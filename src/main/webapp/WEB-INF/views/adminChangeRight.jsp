<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<script
	src="${pageContext.request.contextPath }/resources/assets/js/color-modes.js"></script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.122.0">
<title>Signin Template · Bootstrap v5.3</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/sign-in/">



<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link
	href="${pageContext.request.contextPath }/resources/assets/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
.b-example-divider {
	width: 100%;
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.btn-bd-primary { -
	-bd-violet-bg: #712cf9; -
	-bd-violet-rgb: 112.520718, 44.062154, 249.437846; -
	-bs-btn-font-weight: 600; -
	-bs-btn-color: var(- -bs-white); -
	-bs-btn-bg: var(- -bd-violet-bg); -
	-bs-btn-border-color: var(- -bd-violet-bg); -
	-bs-btn-hover-color: var(- -bs-white); -
	-bs-btn-hover-bg: #6528e0; -
	-bs-btn-hover-border-color: #6528e0; -
	-bs-btn-focus-shadow-rgb: var(- -bd-violet-rgb); -
	-bs-btn-active-color: var(- -bs-btn-hover-color); -
	-bs-btn-active-bg: #5a23c8; -
	-bs-btn-active-border-color: #5a23c8;
}

.bd-mode-toggle {
	z-index: 1500;
}

.bd-mode-toggle .dropdown-menu .active .bi {
	display: block !important;
}
</style>


<!-- Custom styles for this template -->
<style type="text/css">
html, body {
	height: 100%;
}

.adinfo {
	border: solid black 1px;
	margin: 5px;
	padding: 5px;
	width: 2 20px;
	height: 250px;
}
</style>
<c:if test="${adminList==null }">
	<script type="text/javascript">
		alert('정보수정이 완료되었습니다.')
		window.close();
	</script>
</c:if>
</head>
<body >

	<table style="text-align: center;">
		<c:set var="idx" value="0" />
		<tr>
			<c:forEach items="${adminList}" var="dto">
				<c:set var="idx" value="${idx +1}" />
				<form action="updateAdinfo" onsubmit="return formCheck(this)">
					<td>
						<div class="adinfo">
							<div>${dto.adId }</div>
							<input type="text" style="display: none;" id="pcrCode"
								name="pcrCode" value="${dto.pcrCode }"> <input
								type="text" style="display: none;" id="adId" name="adId"
								value="${dto.adId }">

							<div style="display: flex;">

								<input type="text" id="adPw" name="adPw" value="${dto.adPw }">
							</div>
							<div style="display: flex;">

								<input type="text" id="adName" name="adName"
									value="${dto.adName}">
							</div>
							<div style="display: flex;">

								<input type="text" id="adHp" name="adHp" value="${dto.adHp }">
							</div>
							<div style="display: flex;">

								<input type="text" id="adEmail" name="adEmail"
									value="${dto.adEmail }">
							</div>
							<div style="display: flex;">
								<div style="padding-right: 10px">${dto.adRight }</div>
								<div>
									<select id="adRight" name="adRight">
										<option value="CEO">CEO</option>
										<option value="MNG">Manager</option>
										<option value="PTM">PartTimer</option>
									</select>
								</div>
							</div>
							<div style="text-align: center; padding: 10px;">
								<input type="submit" value="변경하기">
							</div>
						</div>
				</form>
				</td>


				<c:if test="${idx%2==0}">
					<tr>
				</c:if>


			</c:forEach>
	</table>
		<div
		class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle">
		<button
			class="btn btn-bd-primary py-2 dropdown-toggle d-flex align-items-center"
			id="bd-theme" type="button" aria-expanded="false"
			data-bs-toggle="dropdown" aria-label="Toggle theme (auto)">
			<svg class="bi my-1 theme-icon-active" width="1em" height="1em">
				<use href="#circle-half"></use></svg>
			<span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
		</button>
		<ul class="dropdown-menu dropdown-menu-end shadow"
			aria-labelledby="bd-theme-text">
			<li>
				<button type="button"
					class="dropdown-item d-flex align-items-center"
					data-bs-theme-value="light" aria-pressed="false">
					<svg class="bi me-2 opacity-50" width="1em" height="1em">
						<use href="#sun-fill"></use></svg>
					Light
					<svg class="bi ms-auto d-none" width="1em" height="1em">
						<use href="#check2"></use></svg>
				</button>
			</li>
			<li>
				<button type="button"
					class="dropdown-item d-flex align-items-center"
					data-bs-theme-value="dark" aria-pressed="false">
					<svg class="bi me-2 opacity-50" width="1em" height="1em">
						<use href="#moon-stars-fill"></use></svg>
					Dark
					<svg class="bi ms-auto d-none" width="1em" height="1em">
						<use href="#check2"></use></svg>
				</button>
			</li>
			<li>
				<button type="button"
					class="dropdown-item d-flex align-items-center active"
					data-bs-theme-value="auto" aria-pressed="true">
					<svg class="bi me-2 opacity-50" width="1em" height="1em">
						<use href="#circle-half"></use></svg>
					Auto
					<svg class="bi ms-auto d-none" width="1em" height="1em">
						<use href="#check2"></use></svg>
				</button>
			</li>
		</ul>
	</div>

	
	<script
		src="${pageContext.request.contextPath }/resources/assets/dist/js/bootstrap.bundle.min.js"></script>

	<!-- JQUERY -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

	<script type="text/javascript">
		function formCheck(formObj) {
			console.log(formObj)

			let pwEl = formObj.adPw;
			let NameEl = formObj.adName;
			let EmailEl = formObj.adEmail;
			let HpEl = formObj.adHp;
			console.log(pwEl)
			console.log(NameEl)
			console.log(EmailEl)
			console.log(HpEl)

			if (pwEl.value.length == 0) {
				pwMsgEl.innerText = '비밀번호를 입력 해주세요!';
				pwMsgEl.style.color = 'red';
				pwEl.focus();
				return false;
			} else if (NameEl.value.length == 0) {
				nameMsgEl.innerText = '이름을 입력 해주세요!';
				nameMsgEl.style.color = 'red';
				NameEl.focus();
				return false;
			} else if (EmailEl.value.length == 0) {
				emailMsgEl.innerText = '이메일을 입력 해주세요!';
				emailMsgEl.style.color = 'red';
				EmailEl.focus();
				return false;
			} else if (HpEl.value.length == 0) {
				hpMsgEl.innerText = '전화번호를 입력 해주세요!';
				hpMsgEl.style.color = 'red';
				HpEl.focus();
				return false;
			} else if (AgeEl.value.length == 0) {
				ageMsgEl.innerText = '나이를 입력 해주세요!';
				ageMsgEl.style.color = 'red';
				AgeEl.focus();
				return false;
			}

			return ture;
		}
	</script>
</body>
</html>
