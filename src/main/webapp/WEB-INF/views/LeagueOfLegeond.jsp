<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<style>
</style>
</head>

<body style="background-image: url(${pageContext.request.contextPath }/resources/Youtube.png) " >
<button type="button" style="position:absolute; right:0px; top :0px;" onclick="closethiswindow('${pcrCode}','${memId }','${seatNum }','${seatUseProgram }')">X</button>



		

	
</body>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script type="text/javascript">
		var sock = new SockJS('pcRoomServerSock');//소켓 접속
		sock.onopen = function() { //접속이 되면 실행


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
<script type="text/javascript">
function closethiswindow(pcrCode,memId,seatNum,seatUseProgram) {
	
	console.log(pcrCode)
	let msgObj = {
		"msgType" : 'guest',
		"act" : 'windowClose',
		"pcrCode" : '${pcrCode}',
		"memId" : memId,
		"seatNum" : '${seatNum}'
		
	};//소켓에 피시방코드, 자리번호 넘김
	sock.send(JSON.stringify(msgObj));
	window.close()
	
}

</script>
		
</html>