<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>사회</title>
<style type="text/css">
.pcroom {
	display: flex;
}

.needclean {color-red;
	
}
</style>
</head>
<body style="background-color: yellowgreen">

	<button onclick="openPCRoomJoinform()">피시방 개업</button>
	<c:forEach items="${pcRoomList}" var="pcr">
		<div>
			<div>${pcr.pcrName}
				정원: ${pcr.pcrSeatsEa}
				<button type="button"
					onclick="enterGuest('${pcr.pcrName}','${pcr.pcrCode}','${pcr.pcrSeatsEa}')">입장</button>

				<button type="button" onclick="enterAdmin('${pcr.pcrCode}')">관리자입장</button>
			</div>
			<div>
				<div style="display: flex;">
					<div>들어가있는 자리:</div>
					<div id="${pcr.pcrCode}" style="display: flex;"></div>
				</div>
			</div>
		</div>

	</c:forEach>

	<button onclick="getPCRoomList()">피시방 리스트</button>



</body>
<script type="text/javascript">
	function enterAdmin(pcrCode){
		alert(pcrCode)
		location.href = "adminLoginForm?pcrCode=" + pcrCode ;
	
	}
</script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">

	function openPCRoomJoinform() {//피시방 개업
		window.open("openPCRoomJoinform", "pop", "width=600,height=500")
	}
	
	function renewSeatNum(act,pcrCode,seatNum){//각 피시방의 자리정보 갱신  
		let pcid=pcrCode+"_"+seatNum
		if(act=='enter'){
			console.log(pcrCode+"의 "+seatNum+"번 자리에 "+act+"했다" );

			let seatnumberListDIV= document.getElementById(pcrCode);
			let seatnumber=document.createElement('div');
			
			seatnumber.setAttribute('id',pcid);
			seatnumber.innerHTML=seatNum+"번 &nbsp;";
			seatnumberListDIV.appendChild(seatnumber);
			
		}else if(act=='out'){
			console.log(pcrCode+"의 "+seatNum+"번 자리에서 "+act+"했다" );
			let seatnumber=document.getElementById(pcid);
			seatnumber.remove();
		
		}else if(act=='login'){
			console.log(pcrCode+"의 "+seatNum+"번 자리에서 "+act+"했다" );			
		}else if(act=='logout'){
			
			console.log(pcrCode+"의 "+seatNum+"번 자리에서 "+act+"했다" );
			let seatnumber=document.getElementById(pcid);
			seatnumber.innerHTML=seatNum+"번 자리 청소중 &nbsp;";
			seatnumber.classList.add('needclean')
			
		}
		
				}
	function test(pcrName,pcrCode,pcrSeatsEa){
		let seatNums=[];
		let seatnumberListDIV=document.querySelectorAll('#'+pcrCode+" div");//"#ff div"
		console.log(seatnumberListDIV);
		for(let num of seatnumberListDIV){
			console.log(num.innerText);
			seatNums.push(num.innerText);
		}
		console.log("seatNums: "+seatNums);
	}

	
	

	function enterGuest(pcrName,pcrCode,pcrSeatsEa) {//피시방 입장 메소드
	let seatNum = Number(prompt('몇번자리에 입장하시겠습니까?'));
		
	let seatNums=[];
	let seatnumberListDIV=document.querySelectorAll('#'+pcrCode+" div");//"#ff div"

		for(let num of seatnumberListDIV){
			
			seatNums.push(num.innerText);
			
			}
		
		
		
		if(seatNum==null){
			return;
		}else if(0<seatNum && seatNum<=pcrSeatsEa){
			
			for(num of seatNums){
				if(seatNum ==num){
					alert('중복된자리입니다.');
					return;
				}
				
			}
			alert(pcrName + '피시방에 ' + seatNum + '자리번호로 입장합니다.');
			location.href = "enterPCRoom?pcrCode=" + pcrCode + "&seatNum="+ seatNum+ "&act="+"enter";
		}else if(!(0<seatNum && seatNum<=pcrSeatsEa)){
			alert('1부터'+pcrSeatsEa+'까지의 숫자를 입력해주세요');
		}
		
	}
</script>

<script>

	function getPCRoomList(){
		let pcRoomlist = document.getElementById('pcRoomlist');
		
		 $.ajax({
		 		type : 'post',
		 		url : 'getPCRoomList',
		 		dataType:'json',
	 			success : function(list){
	 				pcRoomlist.innerHTML="";
	 				for(let res of list ){
	 					let pcRoom=document.createElement('div');
	 					console.log(res)	 					
	 					pcRoom.innerHTML=`<div >
	 											<div >\${res.pcrName} 정원: \${res.pcrSeatsEa} 
	 											<button onclick="enterGuest('\${res.pcrName}','\${res.pcrCode}','\${res.pcrSeatsEa}')">	
	 													입장
	 												</button>
	 														
 													<button onclick="enterAdmin('${pcrCode}')">
	 													관리자입장
 													</button>
	 												</div>
	 									  		</div> 
	 									   </div> 
	 						<div  style="display:flex;" >
	 							<div >들어가있는 자리:</div> <div id="\${res.pcrCode}" style="display:flex;"></div>
	 						</div> 
	 					`;
	 					pcRoomlist.appendChild(pcRoom);
	 				}
	 			
	 					 				
	 			}
	
		 });
	 } 
</script>

<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">


	//getPCRoomList()	


	var sock = new SockJS('societySock');//소켓 접속
	
	
	sock.onopen = function() { //접속이 되면 실행
		console.log('open');
		update()
		//sock.`('test');  서버에 메세지를 전송
	};
	sock.onmessage = function(e) { // 서버에서 메세지를 받으면 실행
		let resMsg = JSON.parse(e.data);
		console.log(resMsg);
		renewSeatNum(resMsg.act,resMsg.pcrCode,resMsg.seatNum)
	};

	sock.onclose = function() { //접속이 해제되면 실행
		
		alert('접속이 해제 되었습니다.');
		
	};
	
</script>
<script type="text/javascript">
	function update(){
		console.log("update")
		 $.ajax({
		 		type : 'post',
		 		url : 'update',
		 		dataType:'json',
	 			success : function(list){
	 				for(dto of list){
	 					let seatnumberListDIV= document.getElementById(dto.pcrCode);
	 					seatnumberListDIV.innerHTML="";
	 				}
	 				for(dto of list){
	 					console.log(parseInt(dto.seatNum));
	 					let setseatnum=parseInt(dto.seatNum)+"";
	 					console.log(dto.pcrCode);
 						let pcid=dto.pcrCode+"_"+setseatnum
	 					let seatnumberListDIV= document.getElementById(dto.pcrCode);
	 					let seatnumber=document.createElement('div');
	 					seatnumber.setAttribute('id',pcid);
	 					seatnumber.innerHTML=dto.seatNum+" &nbsp;";
	 					seatnumberListDIV.appendChild(seatnumber);
	 					
	 					
	 				}
	 			}
		
		
		 });
	}
</script>

</html>