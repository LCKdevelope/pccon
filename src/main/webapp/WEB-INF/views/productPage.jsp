<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>라즈베리 피시방</title>
<style type="text/css">
</style>
</head>
<body style="background-color: yellowgreen">
	<c:if test="${close==null}">
		<script type="text/javascript">
			alert("등록완료");
			window.close();
		</script>
	</c:if>
	<div style="display: flex;">
		<div>
			<header>
				<h2>상품 등록</h2>
				<!-- 네비게이션 메뉴 등 -->
			</header>


			<form action="registryProduct" method="POST">

				<input style="display: none;" type="text" value="${pcrCode}"
					name="pcrCode">

				<div>
					<label for="product_name">상품 이름:</label> <input type="text"
						id="prName" name="prName" required>
				</div>
				<div>
					<label for="product_price">가격:</label> <input type="number"
						id="prPrice" name="prPrice" required>
				</div>
				<div>
					<label for="product_category">카테고리:</label> <select id="prCategory"
						name="prCategory" required onchange="select(this)">
						<option value="noodle">라면</option>
						<option value="drink">음료</option>
						<option value="rice">밥</option>
						<option value="snackBar">분식</option>
						<option value="etc">기타</option>
						<option value="time">시간</option>
						<!-- 다른 카테고리 옵션들 -->
					</select>
				</div>
				<div>
					<label id="toggle" for="product_image">이미지 업로드:</label> <input
						type="text" id="prImg" name="prImg" accept="image/*" required>
				</div>
				<button type="submit">등록</button>
				<button type="button" onclick="window.close()">취소</button>
			</form>
		</div>

		<div>
		<h2>상품 삭제</h2>
			<c:forEach items="${prlist}" var="dto">
				<div style="display: flex;">
					상품명:
					<div style="margin-right: 10px">${dto.prName}</div>
					상품가격:
					<div style="margin-right: 10px">${dto.prPrice}</div>
					<button type="button"
						onclick="deleteProduct('${dto.pcrCode}','${dto.prCode }')">삭제</button>
				</div>


			</c:forEach>
		</div>
	</div>
	<footer>
		<!-- 페이지 하단에 추가 정보 또는 링크를 포함할 수 있습니다. -->
	</footer>
	<!-- JQUERY -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

	<script type="text/javascript">
		function select(selEl) {
			let optionObj = document.getElementById('prCategory')
			console.log(optionObj.value)

			let inputObj = document.getElementById('prImg')

			let label = document.getElementById('toggle');
			console.log(label);

			//만약 옵션이 시간이면  id toggle에  단위시간을 입력하게끔 바뀜
			if (optionObj.value == 'time') {
				inputObj.setAttribute('type', 'number')
				label.innerHTML = '단위시간을 입력해주세요'
			} else {
				inputObj.setAttribute('type', 'text')
				label.innerText = "이미지 업로드"
			}

		}

		function deleteProduct(pcrCode, prCode) {
			$.ajax({
				type : 'post',
				url : 'deleteProduct',
				data : {
					'pcrCode' : pcrCode,
					'prCode' : prCode

				},
				success : function(res) {
					alert('삭제완료')
					location.reload();

				}

			});

		}
	</script>


</body>
</html>
