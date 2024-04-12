<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.guest {
	
}

.orderEl {
	border: 1px solid black;
	border-radius: 14px;
	padding: 2px;
	margin: 2px;
	background-color: yellow;
	color: blue;
}

table {
	width: 100%;
	border: 1px solid black;
}

tr td {
	border: 1px solid black;
	text-align: center;
}

td {
	width: 143px;
	height: 100px;
}

.guest {
	background-color: green;
}

.adminBtn {
	margin: 10px;
}
</style>
</head>
<body>
	<div style="display: flex;">
		<div style="width: 1220px;">
			<div style="display: flex; font-size: 40px;">
				<div>${pcRoomInfo.pcrName }</div>
				:
				<div>${pcRoomInfo.pcrSeatsEa}</div>
				,
				<div>${pcrAdinfo.adName},${pcrAdinfo.adRight }</div>
				<button class="adminBtn" onclick="adminInfoPage()">관리자 정보수정</button>
				<button class="adminBtn" onclick="adminChangeRight()">관리자
					권한설정</button>
				<button class="adminBtn" onclick="adminChangeMemberInfo()">회원정보
					수정</button>
				<button class="adminBtn" onclick="salesStatisticsPage()">매출통계</button>
				<button class="adminBtn" onclick="outPcroom()">관리자 로그아웃</button>

			</div>
			<div style="display: flex;">
				<div>
					<button type="button" onclick="productPage()">상품목록</button>
				</div>
				<div>
					<button type="button" onclick="sendMessageEveryone()">단체메세지</button>
				</div>


			</div>


			<div style="overflow: scroll; height: 823px; width: 100%;">
				<table>
					<tr>
						<c:forEach items="${seatlist}" var="dto">
							<c:choose>
								<c:when test="${dto.seatState=='I'}">
									<td id="${pcrAdinfo.pcrCode}_${dto.seatNum}"
										style="cursor: pointer;"
										onclick="logoutGuest('${pcrAdinfo.pcrCode}','${dto.seatNum}','${dto.memId}','${dto.sTime }')"
										class="guest">
										<div>${dto.seatNum}</div>
										<div id="${dto.seatNum}">
											<div id="${dto.seatNum}_memId">${dto.memId }</div>
											<div id="${dto.memId}_sTime">${dto.sTime }</div>
											<div id="${dto.memId}_seatUseProgram">${dto.seatUseProgram }</div>
											<div>
												<button class="sendMsgBtn" type="button"
													onclick="sendMsg('${dto.pcrCode}','${dto.memId}','${dto.seatNum}', event)">메세지보내기</button>
											</div>
										</div>
								</c:when>
								<c:when test="${dto.seatState=='C'}">
									<td id="${pcrAdinfo.pcrCode}_${dto.seatNum}">
										<button
											onclick="clean('${pcrAdinfo.pcrCode}','${dto.seatNum}')">청소완료</button>
								</c:when>
								<c:otherwise>
									<td id="${pcrAdinfo.pcrCode}_${dto.seatNum}">
										<div>${dto.seatNum}</div>
								</c:otherwise>
							</c:choose>

							<c:if test="${dto.seatNum%7==0}">
								<tr>
							</c:if>


						</c:forEach>
					</tr>
				</table>

			</div>
		</div>

		<div>
			<hr>
		</div>
		<div style="display: flex; flex-grow: 1;">
			<div id="order" style="width: 55%;">
				<div id="orderArea" style="height: 800px; overflow: scroll;">
					<c:forEach items="${odlist }" var="dto">
						<div class="orderEl">
							<div style="display: flex;">
								<div>자리번호: ${dto.SEATNUM } &nbsp</div>
								<div>${dto.PRNAME }&nbsp</div>
								<div>
									금액:<span id="price">${dto.PRPRICE}</span>
								</div>

							</div>
							<div style="display: flex;">
								<div>요청사항:</div>
								<div>${dto.REQUEST }</div>
							</div>
							<div>
								주문시간:<span id="oddate">${dto.ODDATE}</span>
							</div>
						</div>

					</c:forEach>
				</div>
				<div>
					금일매출합계 : <span id="priceAll"></span> 원
				</div>
			</div>
			<div>
				<hr>
			</div>
			<div id="chattingArea" style="width: 45%;"></div>
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
function salesStatisticsPage(){
	window.open("salesStatisticsPage?pcrCode=" + thispcrCode + "&adId=" + thisAdId, "pop", "width=1500, height=1000");
	
}
function adminInfoPage() {
	
		window.open("adminInfoPage?pcrCode=" + thispcrCode + "&adId=" + thisAdId, "pop", "width=800, height=800");
	}
function adminChangeRight(){
	if(thisAdRight!='CEO'){
		alert('설정권한 없음')
		return;
	}
	window.open("adminChangeRight?pcrCode=" + thispcrCode + "&adId=" + thisAdId, "pop", "width=800, height=800");	
}

function adminChangeMemberInfo(){
	if(thisAdRight!='CEO'){
		alert('설정권한 없음')
		return;
	}
	window.open("adminChangeMemberInfo?pcrCode=" + thispcrCode + "&adId=" + thisAdId, "pop", "width=800, height=800");
}
	
</script>

<script type="text/javascript">
function convertTimeString_sTime(stime) { //60진법을 10진법으로 변환
	

	var parts = stime.split(":");
	var hours = parseInt(parts[0]);
	var minutes = parseInt(parts[1]);

	var decimal = (parseInt(hours) + (parseInt(minutes) / 60))
			.toFixed(2);

	if (decimal == 'NaN') {
		
		console.log("decimal: " + decimal);

	} else {
		console.log(stime);
		return decimal;
	}



}



window.name = 'adminpage';
function updatetime(seatId,sTime) { 
	$.ajax({
		type : 'post',
		url : 'update_time',
		data : {
			'pcrCode' : thispcrCode,
			'memId' : seatId,
			'sTime' : convertTimeString_sTime(sTime)
		},

		success : function(res) {
			console.log('사용종료')
		}

	});
	
	

}

function logoutGuest(pcrcode,snum,mid,sTime) {

	console.log(pcrcode)
	console.log(snum)
	console.log(mid)
	if(confirm('사용을 종료하시겠습니까?')){
		let msgObj = {
				"msgType" : 'admin',
				"act" : 'sysout',
				"pcrCode" : pcrcode,
				"memId" : mid,
				"seatNum" : snum

			}
		sock.send(JSON.stringify(msgObj));
		
		updatetime(mid,sTime)
		
		let seatNumTd = document.getElementById(thispcrCode + '_'
				+ snum);
		seatNumTd.removeAttribute('onclick');
		console.log("손님 로그아웃");
		
		seatNumTd.classList.remove('guest');
		seatNumTd.innerHTML = `<button onclick="clean('\${pcrcode}','\${snum}')">청소완료</button>`;

	}else{
		return;
	}
	
	
	
}
</script>
<!--채팅관련 스크립트  -->
<script type="text/javascript">
	function getLoginIdlist(){
		let result;
		$.ajax({ 
			type : 'post',
			url : 'getLoginIdlist',
			data : {
				'pcrCode' : thispcrCode
			},
			async:false,
			dataType : 'json',
			success : function(res) {
				result=res;
				
			}
			
		
		});
		return result;
	
	}
		

function sendMessageEveryone() {
	let loginList= getLoginIdlist();
	console.log(loginList)
	if(loginList==null){
		alert('로그인 한 인원이없습니다.')
		return;
	}
	var inputString =prompt("메세지를 입력하세요")
	console.log(inputString)
	if(inputString==""){
		return;
	}
	let msgObj = {
		"msgType" : 'admin',
		"act" : 'sendmessageEveryOne',
		"pcrCode" : thispcrCode,
		"message":inputString

	}
	
	
	for(dto of loginList){
		console.log(dto)
		
		if(dto.MEMID!=null){
			console.log('loginId'+dto.MEMID)
			insertMessage(dto.MEMID,inputString)
		}
		
		
	}
	sock.send(JSON.stringify(msgObj));
	alert('전송완료')
	


	
}
function sendMsg(pcrcode,id,seatNum, event) {
	var inputString =prompt("메세지를 입력하세요")
	insertMessage(id,inputString) 
	let msgObj = {
		"msgType" : 'admin',
		"act" : 'sendmessage',
		"pcrCode" : pcrcode,
		"memId" : id,
		"seatNum" : seatNum,
		"message":inputString

	}
sock.send(JSON.stringify(msgObj));
	event.stopPropagation();
}
function insertMessage(meid,messagevalue) {
	$.ajax({ 
		type : 'post',
		url : 'insert_message',
		data : {
			'pcrCode' : thispcrCode,
			'send' : thispcrCode+'_admin',
			'receive' : meid,
			'msg':messagevalue
		},
		success : function(res) {
			
			

		}

	});
	
}
function responseMessage(meid,seatNum){
	const messageCard=document.getElementById('chattingEl_'+seatNum);
	let MessageCardDiv=document.getElementById('chattingElmessage_'+seatNum);
	let messagevalue=MessageCardDiv.value;
	console.log("messagevalue :"+messagevalue)
	let msgObj = {
				"msgType" : 'admin',
				"act" : 'sendmessage',
				"pcrCode" : thispcrCode,
				"memId" : meid,
				"seatNum" : seatNum,
				"message":messagevalue

			}
		sock.send(JSON.stringify(msgObj));
	$.ajax({ 
		type : 'post',
		url : 'insert_message',
		data : {
			'pcrCode' : thispcrCode,
			'send' : thispcrCode+'_admin',
			'receive' : meid,
			'msg':messagevalue
		},
		success : function(res) {
			alert('전송완료')
			

		}

	});
		
	
	messageCard.remove(); 
}

function closeChat(meid,seatNum) {
	const messageCard=document.getElementById('chattingEl_'+seatNum);
	messageCard.remove();
}

</script>

<script type="text/javascript">
	function enterPcroom() {
		let msgObj = {
			"msgType" : 'admin',
			"act" : 'login',
			"pcrCode" : thispcrCode,
			"adId" : '${pcrAdinfo.adId}',
			'seatNum' : '0'
		};

		sock.send(JSON.stringify(msgObj));
	}
	function outPcroom() {
		console.log("out")
		let msgObj = {
			"msgType" : 'admin',
			"act" : 'logout',
			"pcrCode" : thispcrCode,
			"adId" : '${pcrAdinfo.adId}',
			'seatNum' : '0'
		};
		sock.send(JSON.stringify(msgObj));
		location.href = "/controller";
	}
</script>
<script type="text/javascript">
	const thispcrCode = '${pcRoomInfo.pcrCode}';
	const thisAdId='${pcrAdinfo.adId}';
	const thisAdRight='${pcrAdinfo.adRight}';

	var sock = new SockJS('pcRoomServerSock');//소켓 접속
	sock.onopen = function() { //접속이 되면 실행
		enterPcroom()
		console.log('open');
	};
	sock.onmessage = function(e) { // 서버에서 메세지를 받으면 실행
		let resMsg = JSON.parse(e.data); 

		let msgType = resMsg.msgType;
		let act = resMsg.act;
		let pcrCode = resMsg.pcrCode;
		let seatNum = resMsg.seatNum;
		let memId = resMsg.memId;
		let seatUseProgram=resMsg.seatUseProgram;
		let message = resMsg.message;
		
		console.log('msgType: ' + msgType);
		console.log('act: ' + act);
		console.log('pcrCode: ' + pcrCode);
		console.log('seatNum: ' + seatNum);
		console.log('memId: ' + memId);
		if(seatUseProgram){
			console.log('seatUseProgram: ' + seatUseProgram );
			
		}
		
		if(thispcrCode==pcrCode){ //소켓에서 넘어온 pcrcode와 접속해있는 pcrcode 가 같아야함
			if (msgType == 'guest') { // admin페이지라서 손님만 고려
				if (act == 'login') {//손님이 로그인한 경우
					
					let seatNumTd = document.getElementById(thispcrCode + '_'
							+ seatNum);
					seatNumTd.setAttribute('onclick',"logoutGuest('"+pcrCode+"','"+seatNum+"','"+memId+"')");
					seatNumTd.innerHTML="";
					console.log(seatNumTd);
					
					seatNumTd.classList.add('guest')
					let seatNumDiv = document.createElement('div');
					seatNumDiv .innerText = seatNum;
					seatNumTd.appendChild(seatNumDiv);

					let seatIdDiv = document.createElement('div');
					seatIdDiv.setAttribute('id', memId);
					seatIdDiv.innerText = memId;
					
					seatNumTd.appendChild(seatIdDiv);
					
					//남은시간 가져오기
					let stime=get_sTime(thispcrCode,memId);
					
					var converted_sTime=convert_sTime_timeString(stime)
					
					let seatTimeDiv = document.createElement('div');
					seatTimeDiv.setAttribute('id', memId + '_sTime')
					seatTimeDiv.innerText = converted_sTime;
					seatNumTd.appendChild(seatTimeDiv);
					
					let seatUseProgramDiv = document.createElement('div');
					seatUseProgramDiv.setAttribute('id', memId + '_seatUseProgram')
					/* seatUseProgramDiv.style.cursor='pointer'; */
					seatUseProgramDiv.innerText = '바탕화면';
					seatNumTd.appendChild(seatUseProgramDiv);
					
					let sendMsgDiv = document.createElement('button');
					sendMsgDiv.innerText="메세지보내기";
					sendMsgDiv.setAttribute('onclick',"sendMsg('"+pcrCode+"','"+memId+"','"+seatNum+"',event)");
					seatNumTd.appendChild(sendMsgDiv);
				
				} else if (act == 'logout') {
					let seatNumTd = document.getElementById(thispcrCode + '_'
							+ seatNum);
					seatNumTd.removeAttribute('onclick');
					console.log("손님 로그아웃");
					
					seatNumTd.classList.remove('guest');
					seatNumTd.innerHTML = `<button onclick="clean('\${pcrCode}','\${seatNum}')">청소완료</button>`;

					
	
				}else if (act == 'update_time'){
					console.log('seatNum: ' + seatNum);
					let seatTimeDiv = document.getElementById(memId + '_sTime');
					seatTimeDiv.innerHTML=seatNum;
					
				}else if(act =='update_order'){
					console.log("주문업데이트");
					updateOdlist();
				}else if(act =='execute'){
					let seatUseProgramDiv = document.getElementById(memId + '_seatUseProgram')
					console.log(seatUseProgramDiv )
					seatUseProgramDiv.innerText = seatUseProgram;
												  
					
				}else if(act =='windowClose'){
					let seatUseProgramDiv = document.getElementById(memId + '_seatUseProgram')
					
					seatUseProgramDiv.innerText = '바탕화면';
					
				}else if(act =='sendmessage'){
					let chattingonoffdiv=document.getElementById('chattingEl_'+seatNum);
					console.log(chattingonoffdiv)
					console.log('chattingonoffdiv: '+chattingonoffdiv)
					if(chattingonoffdiv!=null){
						let chattingCardDiv=document.createElement('div');
						let chattingCardAreaDiv = document.getElementById('chattingCardArea_'+seatNum); 
						chattingCardDiv.innerHTML=`<div style="text-align: left;">
															<div>\${memId}</div>
															<div>\${message}</div>
														</div>`;
														
						chattingCardAreaDiv.appendChild(chattingCardDiv);
					}else{
						let chattingAreaDiv = document.getElementById('chattingArea');
						let chattingCardDiv=document.createElement('div');
						chattingCardDiv.innerHTML=`<div id="chattingEl_\${seatNum}" class="card shadow-sm" style="width: 100%; margin: 5px 0px; ">
						<div
							style="background-color: black; color: white; font-size: 10px; padding: 5px;">
							\${seatNum}번손님:</div>
							<button	onclick="closeChat('\${memId}','\${seatNum}')"	style="float: right">X</button>
						<div id="chattingCardArea_\${seatNum}"
							style="background-color: lightgray; height: 100px; overflow: scroll;overflow-x:hidden   ">
							<div style="text-align: left;">
								<div>\${memId}</div>
								<div>\${message}</div>
							</div>
						</div>
						<div
							style="width: 95%; height: 30px; background-color: black; padding: 5px; display: flex;">
							<input id="chattingElmessage_\${seatNum}" type="text" style="width: 100%; font-size: 20px" />

							<button type="button" onclick="responseMessage('\${memId}','\${seatNum}')" style="width: 25%;">
								<div>보내기</div>
							</button>
						</div>
					</div>`;
					chattingAreaDiv.appendChild(chattingCardDiv);
						

					}
								
				}else if(act =='call'){
					alert(seatNum+'번 자리에서 호출이 들어왔습니다.')
				}
			}
	
		};
	}
	sock.onclose = function() { //접속이 해제되면 실행
		alert('접속이 해제 되었습니다.');
	};

	function productPage() {

		window.open("productPage?pcrCode=" + thispcrCode, "pop",
				"width=1000, height=700");
	}
</script>
<!-- 남은시간 가져오기, 소숫점 -> 시간타입으로 변환 -->
<script type="text/javascript">
	function get_sTime(code,Id){
		let result = 0;
		$.ajax({ 
			type : 'post',
			url : 'get_sTime',
			data: {'pcrCode':code,'memId':Id},
			async:false,
			success : function(res){
				result = res;
			}
			
		});
		
		return result;
	}
	function convert_sTime_timeString(time) {// 로그인 시 남은 시간 변환   3시간 남았을경우 3:00   2시간 24분 - 2:24
		
		
		
		var hours = Math.floor(time);
		var minutes = Math.round((time - hours) * 60);

		// 시간과 분을 문자열로 조합하여 반환합니다.
		
		// 시간과 분을 조합하여 시간 문자열을 만듭니다.
		var timeString = hours + ":" + (minutes < 10 ? "0" + minutes : minutes);
		console.log(timeString)
		return timeString;
		

	}
</script>
<!--오더관련-->
<script type="text/javascript">
sumPrice()
function sumPrice(){
	const totalPrice=document.querySelector('#priceAll')
	let priceAll=document.querySelectorAll('#price');
	Number(priceAll)
	
	
	let sum=0;
	for(let price of priceAll ){
		
		sum+=Number(price.innerText);
	}
	
	totalPrice.innerText=sum;
	
}
function updateOdlist(){
	const orderAreaDiv = document.getElementById('orderArea');
	console.log(orderAreaDiv )
	
	orderAreaDiv.innerHTML="";
	
		$.ajax({ 
			type : 'post',
			url : 'getOdlist',
			async : false,
			dataType : 'json',
			data : {
				'pcrCode' : thispcrCode
			},
			success : function(odlist) {
				for(let dto of odlist){
					console.log(dto);
					let orderElDiv =document.createElement('div');
					orderElDiv.classList.add('orderEl')
					orderElDiv.innerHTML=`					
						<div style="display: flex;">
						<div>자리번호:\${dto.SEATNUM } &nbsp</div>
						<div>\${dto.PRNAME }&nbsp</div>
						<div>
							금액:<span id="price">\${dto.PRPRICE}</span>
						</div>
					</div>
					<div style="display: flex;">
						<div>요청사항:</div>
						<div>\${dto.REQUEST }</div>
					</div>
					<div>
					주문시간:<span id="oddate">\${dto.ODDATE}</span>
					</div>
					`;

				
					orderAreaDiv.appendChild(orderElDiv);
				}			
			
			}
			
		});

		sumPrice()
	}
</script>

<script type="text/javascript">
	var Ssock = new SockJS('societySock');//소켓 접속
	Ssock.onopen = function() { //접속이 되면 실행

	};
	Ssock.onmessage = function(e) { // 서버에서 메세지를 받으면 실행

	};

	sock.onclose = function() { //접속이 해제되면 실행
		alert('접속이 해제 되었습니다.');
	};
</script>
<script type="text/javascript">
	function clean(pcrCode, seatNum) {
		console.log(pcrCode);
		console.log(seatNum);
		let msgObj = {
			"msgType" : 'society',
			"act" : 'out',
			"pcrCode" : pcrCode,
			"seatNum" : seatNum
		};//소켓에 피시방코드, 자리번호 넘김
		Ssock.send(JSON.stringify(msgObj));
		let seatNumTd = document.getElementById(pcrCode + '_' + seatNum);
		seatNumTd.innerHTML = `	<div>\${seatNum}</div>`;
		
		$.ajax({//청소완료 자리상태 'O'로 수정 
			type : 'post',
			url : 'update_seat_clean',
			data: {'pcrCode':pcrCode,'seatNum':seatNum+"자리 청소중",'seatState':'O'},
			success : function(res){
				
				alert('청소완료')
								
				
			}
			
		});
	}


</script>


</html>