<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.Area {
	height: 368px;
}

.chargeArea {
	width: 65%;
	color: white;
}

.payArea {
	background-color: white;
	width: 35%;
}

.chargeArea .tableArea {
	width: 98%;
	height: 350px;
	color: black;
	background-color: white;
	color: black;
}

table {
	width: 100%;
	height: 100%;
	background-color: #DBD8E4;
}

.tableEl {
	border-radius: 16px;
	background-color: white;
	width: 30%;
	height: 30%;
	cursor: pointer;
	padding: 10px;
}
</style>
</head>

<body style="background-color: purple;">
	<div class="Area" style="display: flex;">
		<div class="chargeArea">
			요금제 구매
			<div class="tableArea">
				<table>
					<tr>
						<c:set var="count" value="1" />
						<c:forEach items="${list}" var="dto">
							<c:if test="${count==4}">
								<tr>
							</c:if>
							<td class="tableEl" onclick="select(this)">
								<div>${dto.prName}</div>
								<div style="display: flex;">
									<div id="prcode" style="display: none;">${dto.prCode}</div>
									<div id="time">${dto.prImg }</div>
									<div style="padding-right: 30px;">:00</div>
									<div id="price">${dto.prPrice}</div>
									<div>원</div>
								</div>


							</td>
							<c:set var="count" value="${count + 1}" />
						</c:forEach>
					<tr>
				</table>
			</div>
			<div>좌석에서 로그인 이후 충전시 남은시간이 10분이상일때 충전가능합니다.</div>
		</div>

		<div class="payArea">
			
			<div>${pcrMemberinfo.memId }님의</div>
			<div style="display: flex;">
				<div>남은시간은</div>
				<div id="sTime">${pcrMemberinfo.sTime }</div>
				<div>입니다.</div>
			</div>


			<div style="display: flex;">
				<div>
					<button type="button" onclick="closewindow()">창닫기</button>
				</div>
				<div>
					<button type="button" onclick="chargeAndPay()">충전하기</button>
				</div>

			</div>
		</div>
	</div>
</body>
<!-- JQUERY -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
const memId= '${pcrMemberinfo.memId }'
const thispcrCode = '${pcrMemberinfo.pcrCode }';
let thissTime = '${pcrMemberinfo.sTime }';

const sTimeDiv = document.getElementById('sTime');
const windowName='loginMonitor_'+thispcrCode+'_'+'${seatNum}'
	let time = 0;
	let prcode=0;
	function closewindow() {
		console.log("창닫기")
		window.close();
	}
	function chargeAndPay() {

	}

	function select(obj) {
		time=obj.querySelector('#time').innerText
		price = obj.querySelector('#price').innerText
		prcode = obj.querySelector('#prcode').innerText
		console.log(price );
		console.log(time );
		var allTds = document.querySelectorAll('.tableEl');
        allTds.forEach(function(item) {
            item.style.border = '1px solid white';
        });
        obj.style.border = '2px solid red';

	}
	function chargeAndPay() {
		alert('충전할 시간: ' + time + '충전할 아이디: ' + '${pcrMemberinfo.memId }'
				+ '피시방코드: ' + '${pcrMemberinfo.pcrCode }'+ "prcode :"+prcode  );
		$.ajax({ //orderController에있음
			type : 'post',
			url : 'chargeTime',
			async : false,
			data : {
				'memId' : '${pcrMemberinfo.memId }',
				'time' : time,
				'pcrCode' : '${pcrMemberinfo.pcrCode }',
				'prCode':prcode,
				'seatNum': ${seatNum}
			},

			success : function(result) {
				if(result>=2){
					alert("시간충전이 완료되었습니다.");
					let pageName = window.opener.name;
					console.log('pageName : '+pageName );
					if(pageName =='loginMonitor_'+thispcrCode+'_${seatNum}'+'_'+memId ){
						window.opener.get_sTime();
					}
					
					window.close();
				}else{
					alert("재접속 필요")
					window.opener.close() 
				}

			}
		});
	}
</script>
<!--남은시간 변환  -->
<script type="text/javascript">
	function convert_sTime_timeString(time) {// 로그인 시 남은 시간 변환   3시간 남았을경우 3:00   2시간 24분 - 2:24
		
		console.log("남은 시간 변환: "+time);
		
		var hours = Math.floor(time);
		var minutes = Math.round((time - hours) * 60);
	
	
		var timeString = hours + ":" + (minutes < 10 ? "0" + minutes : minutes);
		console.log(timeString)
		return timeString;
	}
thissTime =convert_sTime_timeString(thissTime)
sTimeDiv.innerText=thissTime;
</script>
</html>