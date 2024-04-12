<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>chatting</title>
</head>
<body style="padding: 0px; margin: 0px">

	<div class="card shadow-sm" style="width: 400px">
		<div
			style="background-color: black; color: white; font-size: 20px; padding: 10px;">
			메세지
			<button
				onclick="sendMessagelogout('${pcrCode}','${memId }','${seatNum }')"
				style="float: right">X</button>
		</div>
		<div id="chattingArea"
			style="background-color: lightgray; height: 400px; overflow: scroll; overflow: hidden;">

			<c:forEach items="${list}" var="dto">
			
				 <c:choose>
					<c:when test="${dto.SEND==memId }">
						<div style="text-align: right">
							<div>${dto.SEND}:</div>
							<div>${dto.MSG}</div>
						</div>
					</c:when>
					<c:otherwise>
						<div style="text-align: left">
							<div>운영자:</div>
							<div>${dto.MSG}</div>
						</div>
					</c:otherwise>
				</c:choose> 
			</c:forEach>

		</div>
		<div
			style="width: 95%; background-color: black; padding: 10px; display: flex;">
			<input type="text" id="chatEl" style="width: 100%; font-size: 20px" />
			<button type="button"
				onclick="sendMessage('${pcrCode}','${memId }','${seatNum }')"
				style="font-size: 20px; padding: 15px; min-width: 100px; margin-left: 5px;">
				보내기</button>
		</div>
	</div>
</body>
<!-- J쿼리-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 소켓-->
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">
function sendMessagelogin(pcrcode,mId,sNum){
	let msgObj = {
			"msgType" : 'guest',
			"act" : 'sendmessagelogin',
			"pcrCode" : pcrcode,
			"memId" : mId,
			"seatNum" : sNum,
	}
	sock.send(JSON.stringify(msgObj));
	
}
const thispcrCode ='${pcrCode}';
const mmId='${memId}';
const sNum='${seatNum}';
const loginTime='${loginTime}';
	var sock = new SockJS('pcRoomServerSock');//소켓 접속
	sock.onopen = function() { //접속이 되면 실행
		console.log('open')
		console.log("thispcrCode: "+thispcrCode)
		console.log("memId: "+mmId)
		console.log("seatNum: "+sNum)
		console.log("loginTime: "+loginTime)
		
		sendMessagelogin(thispcrCode,mmId,sNum)
		
	};
	sock.onmessage = function(e) { // 서버에서 메세지를 받으면 실행
		
		let resMsg = JSON.parse(e.data);

		let msgType = resMsg.msgType; 
		let act = resMsg.act;
		let pcrCode = resMsg.pcrCode;
		let seatNum = resMsg.seatNum;
		let mId = resMsg.memId;
		let message = resMsg.message;
		console.log('msgType: ' + msgType);
		console.log('act: ' + act);
		console.log('pcrCode: ' + pcrCode);
		console.log('seatNum: ' + seatNum);
		console.log('mId: ' + mId);
		console.log('message: ' + message);
		
		if (thispcrCode == pcrCode) { //소켓에서 넘어온 pcrcode와 접속해있는 pcrcode 가 같아야함
			console.log("pcrcode 같음")
			if (msgType == 'admin') { // 손님페이지라서 admin만 고려
				console.log("admin에서 옴")
				if (mmId == mId) {//손님 아이디와 보낸 아이디가 같은경우
					console.log("아이디같음")
					if (act == 'sendmessage') {
						console.log("sendmessage")
						
						let chattingAreaDiv =document.getElementById('chattingArea')
						console.log(chattingAreaDiv)
						
						let chattingCardDiv=document.createElement('div')
						
						chattingCardDiv.innerHTML=`<div style="text-align: left">
													<div>운영자:</div>
													<div>\${message}</div>
												</div>`;
						chattingAreaDiv.appendChild(chattingCardDiv);

					}

				}

			}
		}

	};

	sock.onclose = function() { //접속이 해제되면 실행
		alert('접속이 해제 되었습니다.');
	};
</script>

<script type="text/javascript">
	const chattingAreaDiv = document.getElementById('chattingArea');

	function sendMessagelogout(pcrcode,mId,seatNum){
		let msgObj = {
				"msgType" : 'guest',
				"act" : 'sendmessagelogout',
				"pcrCode" : pcrcode,
				"memId" : mId,
				"seatNum" : seatNum,
		}
		sock.send(JSON.stringify(msgObj));
		window.close();
	}
	

	function sendMessage(pcrCode, mId, seatNum) {
		
	
		let sendMessageDiv = document.getElementById('chatEl');
		console.log(sendMessageDiv )
		let messageDiv=document.createElement('div')
		messageDiv.innerHTML=`			<div style="text-align: right">
			<div>\${mId}</div>
			<div>\${sendMessageDiv.value}</div>
			
		</div>`;
		chattingAreaDiv.appendChild(messageDiv);
		
		
		let msgObj = {
			"msgType" : 'guest',
			"act" : 'sendmessage',
			"pcrCode" : pcrCode,
			"memId" : mId,
			"seatNum" : seatNum,
			"message" : sendMessageDiv.value
		}
		sock.send(JSON.stringify(msgObj));
		
		//채팅테이블에 내용 인서트
		$.ajax({ 
			type : 'post',
			url : 'insert_message',
			data : {
				'pcrCode' : pcrCode,
				'receive' : pcrCode+'_admin',
				'send' : mId,
				'msg':sendMessageDiv.value
			},
			success : function(res) {
				sendMessageDiv.value='';
				sendMessageDiv.focus();

			}

		});

	}
</script>




</html>