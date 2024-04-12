<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>라즈베리 피시방</title>
<style type="text/css">
.pcimg {
	width: 100%;
	height: 85%;
}

.top-left {
	position: absolute;
	top: 8px;
	left: 16px;
	font-size: 65px;
	color: white;
}

.top-right {
	position: absolute;
	top: 8px;
	right: 16px;
	font-size: 65px;
	color: white;
}

.top-right:hover {
	color: red;
	cursor: pointer;
}
</style>
<script type="text/javascript">
window.name = 'enterPCRoom';
</script>
</head>
<body style="background-color: yellowgreen">
	<div>
		<div>
			<img alt="" class="pcimg"
				src="data:image/jpeg;base64,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">
			<div class="top-left">${seatNum}번</div>
			<div class="top-right" onclick="outpcRoom()">나가기</div>

		</div>

		<div style="display: flex; justify-content: center;">

			<form action="memberLogin" method="post"
				onsubmit="return formCheck(this)" style="display: flex;">

				<div>
					<div>
						아이디 : <input name="memId" type="text">
					</div>
					<div>
						비밀번호 : <input name="memPw" type="password">
					</div>
					<div style="display: none;">
						<input name="seatNum" type="text" value="${seatNum}">
					</div>
					<div style="display: none;">
						<input name="pcrCode" type="text" value="${pcrCode}">
					</div>
				</div>
				<div>
					<input type="submit" value="로그인">
				</div>
			</form>
			<div style="display: flex;">
				<button type="submit" class="btn btn-primary"
					onclick="MemberJoin('${pcrCode}')">회원가입</button>
			</div>
		</div>

		<div style="text-align: center">인천일보 아카데미</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script type="text/javascript">
		var sock = new SockJS('societySock');//소켓 접속
		sock.onopen = function() { //접속이 되면 실행
			enterPcroom()

			console.log('open');
			//sock.`('test');  서버에 메세지를 전송
		};

		sock.onmessage = function(e) { // 서버에서 메세지를 받으면 실행
			let resMsg = JSON.parse(e.data);
			console.log(resMsg);

		};

		sock.onclose = function() { //접속이 해제되면 실행
			alert('접속이 해제 되었습니다.');

		};
	</script>

	<!-- JQUERY -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

	<script type="text/javascript">
		function MemberJoin(pcrCode) {
			window.open("memberJoinForm?pcrCode=" + pcrCode, "pop",
					"width=600, height=700");
		}

		function enterPcroom() {
			let msgObj = {
				"msgType" : 'pcRoom',
				"act" : 'enter',
				"pcrCode" : '${pcrCode}',
				"seatNum" : '${seatNum}'
			};//소켓에 피시방코드, 자리번호 넘김

			sock.send(JSON.stringify(msgObj));
		}
		function outpcRoom() {
			let msgObj = {
				"msgType" : 'society',
				"act" : 'out',
				"pcrCode" : '${pcrCode}',
				"seatNum" : '${seatNum}'
			};//소켓에 피시방코드, 자리번호 넘김
			sock.send(JSON.stringify(msgObj));
			location.href = "/controller";
		}
	</script>
	<script type="text/javascript">
		function formCheck(obj) {

			let formresult = false;
			console.log(obj);
			let idEl = obj.memId.value;
			let pwEl = obj.memPw.value;
			let pcrCode = obj.pcrCode.value;
			if (idEl.length == 0) {
				alert('아이디를 입력 해주세요!');
				idEl.focus();
				return false;

			} else if (pwEl.length == 0) {
				alert('비밀번호를 입력 해주세요!');
				pwEl.focus();
				return false;

			}

			console.log(idEl);
			console.log(pwEl);
			console.log(pcrCode);

			$.ajax({
				type : 'post',
				url : 'memberLoginformcheck',
				async : false,
				data : {
					'memId' : idEl,
					'memPw' : pwEl,
					'pcrCode' : pcrCode
				},
				success : function(result) {
					console.log('result: ' + result)
					
					if (result== 'N') {
						alert("아이디와 비밀번호를 확인해주세요")
						formresult = false;
					} else if (result=='noTime') {
						alert("남은시간이없습니다. 시간을 충전해주세요")
						window.open("chargeTimePage?pcrCode=" + pcrCode+"&memId="+idEl+"&seatNum="+${seatNum} , "pop",	"width=1200, height=400");
						
						formresult = false;
					} else {
						formresult = true;
					}

				}

			});
			return formresult;

		}
	</script>




</body>
</html>

