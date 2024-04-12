<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<script
	src="${pageContext.request.contextPath }/resources/assets/js/color-modes.js"></script>

<meta charset="utf-8" />

<link
	href="${pageContext.request.contextPath }/resources/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" />

<style>
.col {
	cursor: pointer;
}

.menuCategory {
	margin-left: 15px;
	margin-right: 15px;
}

.Product {
	text-align: center;
}

.Product img {
	height: 130px;
}

.circle-btn {
	display: inline-block;
	width: 50px;
	height: 50px;
	border-radius: 50%; /* 원형 버튼을 만들기 위해 반지름을 50%로 설정합니다. */
	background-color: #007bff; /* 배경색을 원하는 색상으로 지정합니다. */
	color: white;
	text-align: center;
	line-height: 50px; /* 텍스트를 버튼 가운데 정렬하기 위해 높이와 동일한 값으로 설정합니다. */
	text-decoration: none; /* 기본 링크 스타일 제거 */
}

.left-content {
	float: left;
}

.right-content {
	float: right;
}

.col:hover {
	background-color: #e74a3b;
}
/* .menu {
        float: right;
      } */
</style>
</head>

<body style="width: 1620px; height: 860px; overflow: hidden">
	<header data-bs-theme="dark">
		<div class="navbar navbar-dark bg-dark shadow-sm">
			<div class="container">
				<a href="#" class="navbar-brand d-flex align-items-center"> <strong
					class="menuCategory" onclick="getCategoryList_type('all')">전체메뉴</strong>
					
					<c:forEach items="${categoryList}" var="dto">

						<c:choose>
							<c:when test="${dto=='rice'}">
								<strong class="menuCategory"
									onclick="getCategoryList_type('${dto}')" id="${dto}">식사</strong>
							</c:when>
							<c:when test="${dto=='noodle'}">
								<strong class="menuCategory"
									onclick="getCategoryList_type('${dto}')" id="${dto}">면류</strong>
							</c:when>
							<c:when test="${dto=='snackBar'}">
								<strong class="menuCategory"
									onclick="getCategoryList_type('${dto}')" id="${dto}">분식</strong>
							</c:when>
							<c:when test="${dto=='drink'}">
								<strong class="menuCategory"
									onclick="getCategoryList_type('${dto}')" id="${dto}">음료</strong>
							</c:when>
							<c:when test="${dto=='time'}">

							</c:when>

							<c:otherwise>
								<strong class="menuCategory"
									onclick="getCategoryList_type('${dto}')" id="${dto}">기타</strong>
							</c:otherwise>

						</c:choose>




					</c:forEach>
				</a>
			</div>
		</div>
	</header>

	<main style="height: 100%;">
		<div class="py-4 bg-body-tertiary"
			style="display: flex; height: 100%;">
			<!-- container -->
			<div class="container" style="height: 100%; overflow: scroll">
				<!-- 상품 row -->
				<div id="container"
					class="row row-cols-0 row-cols-sm-2 row-cols-md-5 g-2">

					<c:forEach items="${prList}" var="dto">
						<c:choose>
							<c:when test="${dto.prCategory=='time'}">
							</c:when>
							<c:otherwise>
								<div class="col" onclick="addToCart(this)">
									<div class="card shadow-sm">
										<div class="Product">
											<img src="${dto.prImg}" />
										</div>

										<div class="card-body">
											<p class="card-text prName">${dto.prName}</p>
											<div style="display: flex;">
												<div class="card-text prPrice">${dto.prPrice}</div>
												<span>원</span>
											</div>
											<div style="display: none;" class="card-text " id="prCode">${dto.prCode}</div>
											<div
												class="d-flex justify-content-between align-items-center"></div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>




					</c:forEach>
					<!-- 상품 col -->
				</div>
				<!-- 상품 row -->
			</div>

			<!-- 장바구니 -->
			<div style="width: 40%; height: 100%">
				<div class="card shadow-sm"
					style="width: 400px; height: 100%; border: 1px solid black; left: -5px; color: gray; position: relative;"
					id="cart">
					<div id="cartContent" style="height: 480px; overflow: scroll">
					</div>

					<div id="payCart">
						<div class="card shadow-sm"
							style="background-color: whitesmoke; padding: 15px; font-size: 20px; width: 397.3px;"
							type="text">
							총 주문금액
							<div style="display: inline-block; position: absolute; right: 0"
								id="totalOrderPrice">
								<span id="totalPriceValue">0</span>원
							</div>
						</div>

						<div>
							<button class="btn btn-primary m-1" onclick="payToCart('현금')">
								현금</button>
							<button class="btn btn-primary m-1" onclick="payToCart('신용카드')">
								신용카드</button>
							<button class="btn btn-primary m-1" onclick="payToCart('시간차감')">
								시간차감</button>
							<button class="btn btn-primary m-1" onclick="payToCart('게토앱결제')">
								게토앱결제</button>
							<button class="btn btn-primary m-1" onclick="payToCart('카카오페이')">
								카카오페이</button>
							<button class="btn btn-primary m-1" onclick="payToCart('포인트')">
								포인트</button>
						</div>

						<div
							style="height: 70px; width: 397.3px; background-color: black; color: white;">
							<input type="radio" />5만원 <input type="radio" />1만원 <input
								type="radio" />5천원 <input type="radio" />1천원 <br /> <input
								type="radio" />금액에 맞게 <input type="radio" />직접입력<input
								type="text" />
						</div>

						<div style="text-align: center">
							<input type="text" id="request"
								placeholder="요청사항은 50자까지 입력할 수 있습니다." style="width: 100%" />
						</div>

						<div style="text-align: center">
							<button class="btn btn-warning" style="width: 380px"
								onclick="orderProducts()">주문하기</button>
						</div>
						<!-- </div> -->
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- JQUERY -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!--분류별 카테고리  -->
	<script type="text/javascript">
	const productlist=${prList_gson};


function getCategoryList_type(prCategory) {
	console.log("productlist : " + productlist)
	let List=[];
	console.log(prCategory)
	
	for(let i=0;i<productlist.length;i++){
		
		if(productlist[i].prCategory!='time'){
			
			List.push(productlist[i]);
			
		}
		
	}
	if(prCategory=='all'){
		printContainer(List)

		
	}else{
		List=delprlist(List,prCategory)
		console.log(List)
		printContainer(List)
		
	}
		

		
	
	
		
	
}
function delprlist(list,prCategory){
	for(let i=0;i<list.length;i++){
		
		if(list[i].prCategory!=prCategory){
			console.log("i "+i);
			list.splice(i,1);
			i--;
			
		}
		
	}
	console.log(list)
	return list;
	
}

function printContainer(list, categoryType) {
	const containerDiv = document.getElementById('container');
	containerDiv.innerHTML="";
	for(let dto of list){
		console.log(dto);

		containerDiv.innerHTML+=`<div class="col" onclick="addToCart(this)" >
									<div class="card shadow-sm">
										<div class="Product">
											<img src="\${dto.prImg}" />
										</div>
					
									<div class="card-body">
										<p class="card-text prName">\${dto.prName}</p>
										
										<div style="display: flex;">
											<div class="card-text prPrice">\${dto.prPrice}</div>
											<span>원</span>
										</div>
										<div style="display: none;" class="card-text " id="prCode">\${dto.prCode}</div>
										<div
											class="d-flex justify-content-between align-items-center"></div>
									</div>
								</div>
							</div>`;
	}
	
	
}

</script>
	<!--주문관련 -->
	<script type="text/javascript">
	const thispcrCode='${pcrCode}';
	const thisseatNum='${seatNum}';
	const thismemId='${memId}';
	function orderProducts() {
		const cartContentDiv = document.getElementById("cartContent");
		let cartContentList=cartContentDiv.querySelectorAll('.card');
		let request=document.getElementById("request").value;
		let totalPriceValue=document.getElementById("totalPriceValue").innerText;
		let cnt=0;
		
		let pay=confirm(totalPriceValue+'원을 결제하시겠습니까?');
		
		if(pay){
			for(let dto of cartContentList){
				
				let prName =dto.querySelector('.prName').innerText;
				let prPrice =dto.querySelector('.prPrice').innerText;
				let prCode =dto.querySelector('#prCode').innerText;
				let quantity=dto.querySelector('.quantity').innerText;
				cnt=Number(cnt)
				result=orderProduct(prCode,quantity,request)
				cnt+=Number(result);
				console.log('cnt: '+cnt)
				
			}
			sendSocket()
			cartContentDiv.innerHTML="";
			request="";
			alert(cnt+'개의 품목을 주문하였습니다.')
			
		}else{
			return ;
		}
				 
	}
	function orderProduct(prCode,quantity,request){
		let result = null;
		$.ajax({ 
			type : 'post',
			url : 'orderProduct',
			data: {'pcrCode':thispcrCode,
				   'prCode':prCode,
				   'odCount':quantity,
				   'memId':thismemId,
				   'request':request,
				   'seatNum':thisseatNum
				  },
			async:false,
			success : function(res){
				console.log(res)
				result = res;
					
			}
			
		});
		
	return result;
	}
	

	function sendSocket(){
		let msgObj = {
				"msgType" : 'guest',
				"act" : 'update_order',
				"pcrCode" : thispcrCode,
				"seatNum" : thisseatNum,
				"memId" : thismemId
			};

			sock.send(JSON.stringify(msgObj));
		
	}

	

</script>


	<script>
      
      
      function addToCart(item) {
        const cartContentDiv = document.getElementById("cartContent");
        let prcode = item.querySelector("#prCode").innerText;
        console.log("선택한 prcode : " + prcode);
        
        let name = item.querySelector(".prName").innerText;
        console.log('name: '+name)
        let priceText = item.querySelector(".prPrice").innerText;
        priceText=Number(priceText);
        console.log('priceText: '+priceText)
        

        let existingItem =cartContentDiv.querySelector('#cartContentEl_'+prcode);
        console.log('existingItem:'+existingItem);
        	
        if (existingItem) {
        	
          console.log("카트에 있는 상품");
          // 수량 +1
          let quantitySpan = existingItem.querySelector(".quantity");
          let quantity = parseInt(quantitySpan.innerText);
          quantity++;
          quantitySpan.innerText = quantity;
          //  (quantity * price)
          let aabbcc = existingItem.querySelector(".prPrice");
          aabbcc.innerText = quantity * priceText;
          }else{

          
          updateTotalOrderPrice();''
          console.log("카트에 없는 상품");
          let div = document.createElement("div");
          div.setAttribute("id",'cartContentEl_'+prcode);
          div.innerHTML = `
					<div class="card shadow-sm card-body">
						<div class="card-text mx-2">
							<div class="menu" style="margin-bottom: 15px">
								<div style="display: none;" class="card-text " id="prCode">\${prcode}</div>
								<div style="display: inline-block; text-align: left" class="prName" >\${name}</div>
							</div>
						</div>
	
						<div class="container">
							<div class="left-content">
								<button class="btn btn-dark py-0 px-2" onclick="updateQuantity('\${prcode}','\${priceText}','decrease')">-</button>
								<span class="d-inlineBlock mx-2 quantity">1</span>
								<button class="btn btn-dark py-0 px-2" onclick="updateQuantity('\${prcode}','\${priceText}' ,'increase')">+</button>
							</div>
							<div class="right-content">
								<div style="display: inline-block" class="prPrice">\${priceText}</div>원
							</div>
						</div>
						<button type="button" onclick="cartRemove('cartContentEl_\${prcode}')" class="btn btn-user" style="position: absolute; right: 0; top: 10px">X</button>
					</div>
				`;

          cartContentDiv.appendChild(div);
        }
        
        updateTotalOrderPrice();
      }

      function updateQuantity(prcode,price ,action) {
    	  console.log(prcode)
    	  console.log(action)
    	  
        const targetItem = document.getElementById('cartContentEl_'+prcode);
    	  console.log(targetItem )
        let quantitySpan = targetItem.querySelector(`.quantity`);

        let quantity = parseInt(quantitySpan.innerText);
        if (action === "increase") {
          quantity++;
        } else if (action === "decrease" && quantity >= 1) {
          quantity--;
          if (quantity === 0) {
            cartRemove('cartContentEl_'+prcode);
            return; // 수량이 0일 때 함수를 종료하고 더 이상 가격을 업데이트하지 않습니다.
          }
        }
        quantitySpan.innerText = quantity;

        let totalPriceForItem = price * quantity;
        let priceElement = targetItem.querySelector(".prPrice");
        console.log("priceElement: " + priceElement);
        priceElement.innerText = totalPriceForItem;

        updateTotalOrderPrice();
      }

      function updateTotalOrderPrice() {
    	const cartContentDiv = document.getElementById("cartContent");
        let priceElements = cartContentDiv.querySelectorAll(".prPrice");
        let totalPrice = 0;

        for (let a of priceElements) {
          console.log(a.innerText);
          a = Number(a.innerText);

          totalPrice += a;
          console.log("totalPrice :" + totalPrice);
        }

        document.getElementById("totalPriceValue").innerText = totalPrice;
        //document.getElementById('totalPriceValue').innerText = totalPrice + "원";
      }

      function cartRemove(prcode) {
        const targetItem = document.querySelector('#'+prcode);
        
        let price= targetItem.querySelector(".prPrice").innerText;
        console.log(price);
        
        let quantity = parseInt(
          targetItem.querySelector(".quantity").innerText
        );
        
        targetItem.remove();
        updateTotalOrderPrice();
      }
   </script>

	<!--소켓-->
	<script
		src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script type="text/javascript">

	var sock = new SockJS('pcRoomServerSock');//소켓 접속
	sock.onopen = function() { //접속이 되면 실행
		console.log('open');
		
	};
	sock.onmessage = function(e) { // 서버에서 메세지를 받으면 실행
		let resMsg = JSON.parse(e.data);
		console.log(resMsg);
		
	};

	sock.onclose = function() { //접속이 해제되면 실행
		
		alert('접속이 해제 되었습니다.');
		
	};
	
</script>

</body>
</html>
