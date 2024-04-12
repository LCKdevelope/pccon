<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>pc화면</title>
<style>
/* 버튼 스타일 */
.custom-button {
	/* 이미지 크기 조정 */
	background-size: cover;
	/* 버튼 크기 조정 */
	width: 62px;
	height: 62px;
	/* 기타 스타일링 */
	border: none;
	cursor: pointer;
	background-color: inherit;
}

.imgfile {
	width: 1200px;
	height: 400px;
	padding-left: 300px;
	padding-top: 15%;
}

.cen {
	margin: 0;
	position: absolute;
	top: 2%;
	left: 50%;
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	background-color: skyblue;
	color: white;
	border: none;
	width: 120px;
	height: 50px;
	border-radius: 16%;
}

.imt {
	position: absolute;
	bottom: 0;
	width: 99.62%;
}

.cent {
	margin: 0;
	position: absolute;
	top: 3%;
	left: 89.1%;
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	background-color: skyblue;
	color: white;
	border: none;
	width: 80px;
	height: 30px;
	border-radius: 16%;
}

.ce {
	margin: 0;
	position: absolute;
	top: 3%;
	left: 68.1%;
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	background-color: skyblue;
	color: white;
	border: none;
	width: 80px;
	height: 30px;
	border-radius: 16%;
}

.timer {
	right: 10px;
}

.custom-button1 {
	/* 이미지 크기 조정 */
	background-size: cover;
	/* 버튼 크기 조정 */
	width: 90px;
	height: 90px;
	/* 기타 스타일링 */
	border: none;
	cursor: pointer;
	background-color: inherit;
}

.custom-button2 {
	/* 이미지 크기 조정 */
	background-size: cover;
	/* 버튼 크기 조정 */
	width: 90px;
	height: 90px;
	/* 기타 스타일링 */
	border: none;
	cursor: pointer;
	background-color: inherit;
}

.custom-button3 {
	/* 이미지 크기 조정 */
	background-size: cover;
	/* 버튼 크기 조정 */
	width: 90px;
	height: 90px;
	/* 기타 스타일링 */
	border: none;
	cursor: pointer;
	background-color: inherit;
}

.custom-button4 {
	/* 이미지 크기 조정 */
	background-size: cover;
	/* 버튼 크기 조정 */
	width: 90px;
	height: 90px;
	/* 기타 스타일링 */
	border: none;
	cursor: pointer;
	background-color: inherit;
}

.custom-button5 {
	/* 이미지 크기 조정 */
	background-size: cover;
	/* 버튼 크기 조정 */
	width: 90px;
	height: 90px;
	/* 기타 스타일링 */
	border: none;
	cursor: pointer;
	background-color: inherit;
}

.custom-button6 {
	/* 이미지 크기 조정 */
	background-size: cover;
	/* 버튼 크기 조정 */
	width: 90px;
	height: 90px;
	/* 기타 스타일링 */
	border: none;
	cursor: pointer;
	background-color: inherit;
}

.back-button {
	width: 200px;
	height: 200px;
}

.midimg {
	width: 219.4px;
	height: 340px;
}

.my {
	background-color: skyblue;
	position: absolute;
	left: 82.5%;
}

.timeUp {
	background-color: skyblue;
	position: absolute;
	left: 63.9%;
}

.call {
	background-color: skyblue;
	position: absolute;
	left: 51.5%;
}

.master {
	background-color: skyblue;
}

.oc {
	position: absolute;
	right: 11px;
	height: 400px;
	bottom: 66px;
}
</style>
<body
	style="background-image: url('https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt2199e124dfc0048a/64816472616b14499815c21d/DRX_%EC%8A%A4%ED%94%8C%EB%9E%98%EC%89%AC_%EC%95%84%ED%8A%B8_%EC%9B%94%ED%8E%98%EC%9D%B4%ED%8D%BC_PC_(2560_1440).jpg');">
	<!-- 버튼 요소 -->
	<div style="display: flex;">
		<div>
			<div style="display: flex;">
				<div>
					<button class="custom-button" onclick="execute('Naver')"
						style="background-image: url('https://i.namu.wiki/i/p_1IEyQ8rYenO9YgAFp_LHIAW46kn6DXT0VKmZ_jKNijvYth9DieYZuJX_E_H_4GkCER_sVKhMqSyQYoW94JKA.svg');"></button>
				</div>
				<div>
					<button style="cursor: pointer;" onclick="productOrderPage()" class="cen">주문하기</button>
				</div>
			</div>
			<div>
				<button class="custom-button" onclick="execute('Youtube')"
					style="background-image: url('https://cdn-icons-png.freepik.com/256/1384/1384060.png');"></button>
			</div>

			<div>
				<button class="custom-button" onclick="execute('LeagueOfLegeond')"
					style="background-image: url('https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcJ1ytB%2FbtqLhQrCENQ%2FlEnEUokHiEs8qcjnkQdr0k%2Fimg.png');"></button>
			</div>
			<div>
				<button class="custom-button" onclick="execute('KakaoTalk')"
					style="background-image: url('https://cdn-icons-png.flaticon.com/512/2111/2111466.png');"></button>
			</div>
			<div>
				<button class="custom-button" onclick="execute('Discord')"
					style="background-image: url('https://i.namu.wiki/i/1Hiv-mf3x_xkYU1kd6PRSAA9TZycl-A3h-HM--kersQF5fL6_fF2PmO8757fj9CqhXnmcy2lFaQkwToWTxtIHw.webp');"></button>
			</div>

		</div>

	</div>
	<div>
		<img class="imgfile"
			src="https://www.geto.co.kr/assets/images/sub_img41_2.png" alt="">
	</div>
	<img class="imt"
		src="${pageContext.request.contextPath }/resources/img3.png">


	<div>

		<div class="pcTimer"
			style="width: 400px; background-color: #4E6C8A; position: absolute; right: 1px; top: 1px; border-radius: 10px;">
			<div>
				<button
					onclick="outPcroom('${pcr.pcrCode}','${seatNum}','${pcr.memId }')"
					style="cursor: pointer;" class="cent">사용종료</button>
				<button type="button" onclick="productOrderPage()" style="cursor: pointer;" class="ce">상품주문</button>
			</div>
			<br> <br>
			
			<div style="text-align: right;">
				${pcr.memName} 
				<div style="display: flex;">
					<div style="text-align: right;">사용시간:</div>
					<div id="spendTime">0:00</div>
				</div>
				<div style="display: flex; text-align: right;">
					<div style="text-align: right;">남은시간:</div>
					<div id="limitTime" style="text-align: right;">${pcr.sTime}</div>
				</div>

			</div>
			<button class="master" onclick="message('${pcr.pcrCode}','${seatNum}','${pcr.memId }')" >카운터 문의</button>
			<button class="my" onclick="memberinfoPage()">회원정보</button>
			<button class="timeUp" onclick="chargeTimePage()">선불연장</button>
			<button class="call" onclick="call()" >호출</button>
			<div style="display: flex; height: 70%;">
				<div>
					<div>
						<button class="custom-button1"
							style="background-image: url('https://url.kr/r36u9z');"></button>
						<br>
						<button class="custom-button2"
							style="background-image: url('https://opgg-com-image.akamaized.net/attach/images/20200914103331.938397.jpg');"></button>
						<br>
						<button class="custom-button3"
							style="background-image: url('https://w7.pngwing.com/pngs/898/401/png-transparent-overwatch-logo-decal-london-spitfire-overwatch-miscellaneous-trademark-video-game.png');"></button>
						<br>
					</div>
				</div>
				<div>
					<img class="midimg"
						src="https://cdn.gameple.co.kr/news/photo/202004/153525_158036_735.jpg"
						alt="">
				</div>
				<div>
					<button class="custom-button4"
						style="background-image: url('https://e7.pngegg.com/pngimages/75/651/png-clipart-red-leaf-maplestory-2-t-shirt-maple-leaf-maple-leaf-maple-leaf.png');"></button>
					<br>
					<button class="custom-button5"
						style="background-image: url('https://e7.pngegg.com/pngimages/996/696/png-clipart-fifa-12-nba-elite-11-ea-sports-electronic-arts-fifa-online-3-electronic-arts-text-sport-thumbnail.png');"></button>
					<br>
					<button class="custom-button6"
						style="background-image: url('https://i.namu.wiki/i/fLTm7sWBKPdbQXsgxAxxqBQqpwh2ua8lsh_D1XSJJGGtn_s2P1VrPDV5T7yuakGEFjoIaGtwEncuWtnee3Qg9Q.webp');"></button>
				</div>


			</div>


		</div>
		<img class="oc"
			src="https://www.hanafn.com:8002/upload/common/upeditor/10000090/20230518//20230518012726338.jpg"
			alt="">
	</div>



</body>
<!-- J쿼리-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
<script type="text/javascript">
function memberinfoPage(){
	window.open("memberinfoPage?pcrCode=" + thispcrCode + "&memId=" + memId, "pop", "width=800, height=800");
	
}
</script>

<!--상품 주문관련  -->
<script type="text/javascript">
	function productOrderPage() {
		window.open("productOrderPage?pcrCode=" + thispcrCode + "&memId=" + memId + "&seatNum=" + seatNum  , "pop", "width=1620, height=860");
	}
</script>



<!--메세지 관련  -->
<script type="text/javascript">
function call() {
	let msgObj = {
		"msgType" : 'guest',
		"act" : 'call',
		"pcrCode" : thispcrCode,
		"seatNum" : seatNum,
		"memId" : memId
	};

	sock.send(JSON.stringify(msgObj));
}

function message(pcrcode,seatNum,id) {
	console.log(pcrcode)
	console.log(seatNum)
	console.log(id)
	window.open("Message?pcrCode=" + pcrcode + "&memId=" + id //시간더하기
			+ "&seatNum=" + seatNum+ "&loginTime=" + loginTime , "pop", "width=400, height=529");
}

</script>

<script type="text/javascript">

	const thispcrCode = "${pcr.pcrCode}";
	const seatNum = "${seatNum}";
	const thisseatNum = "${seatNum}";
	const memId = "${pcr.memId}";
	const thismemId = "${pcr.memId}";
	const loginTime ="${loginTime}"
	window.name = 'loginMonitor_' + thispcrCode + '_' + seatNum + '_' + memId;
	let sTime = Number("${pcr.sTime}"); // 남은시간
	console.log('sTime: ' + sTime)
	let minutes = -1;
	let hour = 0;

	console.log('convert_sTime_timeString(sTime)');
	convert_sTime_timeString(sTime);// 로그인 시 남은 시간 변환   3시간 남았을경우 3:00   2시간 24분 - 2:24
	//피시방 시간 체크 함수
	setInterval(checkTime, 15000);//1분마다 시간체크(60000)

	function checkTime() {
		console.log("checkTime()");
		console.log("thispcrCode: " + thispcrCode)
		console.log("memId: " + memId)
		minutes++;

		console.log(minutes)//경과시간(분단위)

		convertSpendTime(minutes)// 시간단위로 변환   ex) 1분경과시 00:01; 

		//경과시간에따른 남은시간 차감
		spendTime()

		//1분마다 남은시간 테이블에 업로드
		updatetime()
		sendAdmin_limitTime()

	}
	function updatetime() { 
		$.ajax({
			type : 'post',
			url : 'update_time',
			data : {
				'pcrCode' : thispcrCode,
				'memId' : memId,
				'sTime' : convertTimeString_sTime(null)
			},

			success : function(res) {
				console.log('1분차감 업로드')
			}

		});

	}

	function convert_sTime_timeString(Time) {// 로그인 시 남은 시간 변환   3시간 남았을경우 3:00   2시간 24분 - 2:24
		console.log(" 로그인 시 남은 시간 변환");

		var hours = Math.floor(Time);
		var minutes = Math.round((Time - hours) * 60);

		// 시간과 분을 문자열로 조합하여 반환합니다.

		// 시간과 분을 조합하여 시간 문자열을 만듭니다.
		var timeString = hours + ":" + (minutes < 10 ? "0" + minutes : minutes);
		console.log(timeString)
		let limitTime = document.getElementById('limitTime')
		limitTime.innerText = timeString;

	}

	function convertSpendTime(min) {// 시간단위로 변환   ex) 1분경과시 00:01;

		min = Number(min)
		let hours = parseInt(min / 60);
		min = min % 60;
		if (min < 10) {
			min = "0" + min + "";
		}
		let minute = min;
		var timeString = hours + ':' + minute;
		let spendTimeDiv = document.getElementById('spendTime')
		spendTimeDiv.innerText = timeString;

	}
	function spendTime() {//1분씩 빼기  1:00 -> 0:59
		console.log("spendTime()")
		let limitTime = document.getElementById('limitTime');
		console.log(limitTime.innerText)
		var parts = (limitTime.innerText).split(":");
		var hours = parseInt(parts[0]);
		var minutes = parseInt(parts[1]);
		minutes -= 1;
		if (minutes < 0) {
			hours -= 1;
			minutes += 60;
		}
		var newTime = hours + ":" + (minutes < 10 ? "0" + minutes : minutes);

		if (hours == 0 && minutes == 5) {
			alert('5분남았습니다.')
		} else if (hours == 0 && minutes == 0) {
			alert('종료')
			// 남은시간  0 으로 업데이트  후 종료
			updatetime()
			outPcroom(thispcrCode, seatNum, memId)

		}
		limitTime.innerText = newTime;

	}

	function convertTimeString_sTime(zero) { //60진법을 10진법으로 변환

		if (zero == null) {
			let limitTime = document.getElementById('limitTime')

			var parts = (limitTime.innerText).split(":");
			var hours = parseInt(parts[0]);
			var minutes = parseInt(parts[1]);

			var decimal = (parseInt(hours) + (parseInt(minutes) / 60))
					.toFixed(2);

			if (decimal == 'NaN') {
				console.log("decimal: " + decimal);

			} else {
				console.log(zero);
				return decimal;
			}

		} else {
			return zero;
		}

	}

	function chargeTimePage() {//충전시 충전한 시간만큼 더하기
		$.ajax({ //현재까지 사용한 시간 업데이트
			type : 'post',
			url : 'update_time',
			data : {
				'pcrCode' : thispcrCode,
				'memId' : memId,
				'sTime' : convertTimeString_sTime()
			},
			success : function(res) {

			}

		});

		window.open("chargeTimePage?pcrCode=" + thispcrCode + "&memId=" + memId //시간더하기
				+ "&seatNum=" + seatNum, "pop", "width=1200, height=400");

	}

	function get_sTime() {
		// 더해진 시간을 불러와서 남은시간 div에 넣기
		$.ajax({ //현재까지 사용한 시간 업데이트
			type : 'post',
			url : 'get_sTime',
			data : {
				'pcrCode' : thispcrCode,
				'memId' : memId,
			},
			success : function(res) {
				console.log("충전이 완료된 후 시간 :" + res)
				convert_sTime_timeString(res)//10진법 시간은 60진법시간으로 변환 후 남은시간에 innerText

			}

		});

		let msgObj = {
			"msgType" : 'guest',
			"act" : 'update_order',
			"pcrCode" : thispcrCode,
			"seatNum" : seatNum,
			"memId" : memId
		};

		sock.send(JSON.stringify(msgObj));
	}

	function enterPcroom() {
		console.log(thispcrCode)
		console.log(seatNum)
		console.log(memId)
		let msgObj = {
			"msgType" : 'guest',
			"act" : 'login',
			"pcrCode" : thispcrCode,
			"seatNum" : seatNum,
			"memId" : memId
		};

		sock.send(JSON.stringify(msgObj));
	}

	function outPcroom(tpcrCode, sNum, mId) {
		let msgObj = {
			"msgType" : 'guest',
			"act" : 'logout',
			"pcrCode" : tpcrCode,
			"seatNum" : sNum,
			"memId" : mId
		};
		sock.send(JSON.stringify(msgObj));

		msgObj = {
			"msgType" : 'pcRoom',
			"act" : 'logout',
			"pcrCode" : tpcrCode,
			"seatNum" : sNum
		};
		Ssock.send(JSON.stringify(msgObj));

		$.ajax({
			type : 'post',
			url : 'memberLogout',
			data : {
				'pcrCode' : tpcrCode,
				'seatNum' : sNum,
				'seatState' : 'C'
			},
			success : function(res) {

				alert('로그아웃')
				location.href = "/controller";

			}

		});

	}
</script>
<script type="text/javascript">
	function sendAdmin_limitTime() {
		let limitTime = document.getElementById('limitTime').innerText;
		let msgObj = {
			"msgType" : 'guest',
			"act" : 'update_time',
			"pcrCode" : thispcrCode,
			"memId" : memId,
			"seatNum" : limitTime

		};
		sock.send(JSON.stringify(msgObj));

	}
	function execute(what){
		let msgObj = {
				"msgType" : 'guest',
				"act" : 'execute',
				"pcrCode" : thispcrCode,
				"memId" : memId,
				"seatNum" : ${seatNum},
				"seatUseProgram":what

			};
		
		window.open("execute?pcrCode=" + thispcrCode+"&memId="+memId+"&seatNum="+${seatNum}+"&seatUseProgram="+what, "popup", "width=2000,height=1500")
		sock.send(JSON.stringify(msgObj));

		
		
	}
</script>



<!-- 소켓-->
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">
	var sock = new SockJS('pcRoomServerSock');//소켓 접속
	sock.onopen = function() { //접속이 되면 실행
		console.log('open');
		enterPcroom()
		console.log('enterPcroom()');
	};
	sock.onmessage = function(e) { // 서버에서 메세지를 받으면 실행
		let resMsg = JSON.parse(e.data);

		let msgType = resMsg.msgType;
		let act = resMsg.act;
		let pcrCode = resMsg.pcrCode;
		let seatNum = resMsg.seatNum;
		let mId = resMsg.memId;
		console.log('msgType: ' + msgType);
		console.log('act: ' + act);
		console.log('pcrCode: ' + pcrCode);
		console.log('seatNum: ' + seatNum);
		console.log('memId: ' + memId);
		if (thispcrCode == pcrCode) { //소켓에서 넘어온 pcrcode와 접속해있는 pcrcode 가 같아야함
			console.log("같은pcrcode");
			if (msgType == 'admin') { // 손님페이지라서 admin만 고려
				console.log("admin에서 보냄");
				if(memId==mId){//손님 아이디와 보낸 아이디가 같은경우
					console.log('손님 아이디와 보낸 아이디가 같은경우')
					if (act == 'sysout') {//admin에서 강제종료한경우
						
						updatetime()//남은시간 업데이트
						outPcroom(thispcrCode, seatNum, memId)

					}else if(act=='sendmessage'){
						console.log('sendmessage')
						message(pcrCode,thisseatNum,thismemId) 

					}

					
				}else if(act=='sendmessageEveryOne'){
					console.log("sendmessageEveryOne");
					message(pcrCode,thisseatNum,thismemId) 

				}
				
			}
		}

	};

	sock.onclose = function() { //접속이 해제되면 실행
		
		alert('접속이 해제 되었습니다.');
		/* window.close() */
	};
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


</html>