<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="vendor" value="${root }/assets/vendor" />
<c:if test="${cookie.happyhouse_id.value ne null}">
	<c:set var="saveid" value="${cookie.happyhouse_id.value}" />
	<c:set var="idck" value=" checked=\"checked\"" />
</c:if>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Happy House</title>

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${vendor}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${vendor}/icofont/icofont.min.css" rel="stylesheet">
<link href="${vendor}/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${vendor}/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="${vendor}/venobox/venobox.css" rel="stylesheet">
<link href="${vendor}/remixicon/remixicon.css" rel="stylesheet">
<link href="${vendor}/aos/aos.css" rel="stylesheet">



<!-- Template Main CSS File -->
<link href="${root }/assets/css/style.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	function login() {
		document.getElementById("userinfo").action = "${root}/login";
		document.getElementById("userinfo").submit();
	}
</script>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>


<body id="LoginForm">

	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section class="breadcrumbs">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
					<h2>로그인</h2>
					<ol>
						<li><a href="${root}/main.do">Home</a></li>
						<li>로그인</li>
					</ol>
				</div>

			</div>
		</section>
		<!-- End Breadcrumbs -->
		<div class="container">

			<div class="login-form">
				<div class="main-div">
					<div class="panel">
						<img src="${root }/assets/img/logo10.jpeg"
							style="margin-bottom: 10px" height="200px" />
						<h2 style="font-family: SpoqaHanSans; font-size: 22px;">중개사무소
							회원이 아니세요?</h2>
						<h2 style="font-family: SpoqaHanSans; font-size: 22px;">
							<strong>지금 바로 가입하세요!</strong>
						</h2>
					</div>

					<form action="${root }/realtor/login" method="post" id="Login">

						<div class="form-group">


							<input type="text" class="form-control" id="rid" name="rid"
								value="${saveid }" placeholder="이메일 주소">

						</div>

						<div class="form-group">

							<input type="password" class="form-control" id="rpwd" name="rpwd"
								placeholder="비밀번호">

						</div>
						<div class="forgot">
							<a href="${root}/searchPwForm" style="margin-right: 65px;">비밀번호를
								잊어버리셨나요?</a> </br> <a href="${root}/realtorRegister">공인중개사 등록</a> </br>

						</div>
						<button type="submit" class="btn btn-primary">시작하기</button>

					</form>
				</div>
				<p class="botto-text">HappyHouse</p>
			</div>
		</div>
		</div>






	</main>
	<!-- End #main -->

	<jsp:include page="/WEB-INF/views/include/footer.jsp" />

</body>

</html>