<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="vendor" value="${root }/assets/vendor" />
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
	$(document).ready(function() {
		$("#userPwcheck").change(function() {
			if ($("#userPwcheck").val() != $("#userpwd").val()) {
				$("#userPwcheck").val('');
				$("#userpwd").val('');
				alert("비밀번호가 다릅니다.");
			}
		});
	});

	function regist() {
		document.getElementById("memberform").action = "${root}/regist";
		document.getElementById("memberform").submit();
	}
</script>

</head>


<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section class="breadcrumbs">
			<div class="container">

				<div class="d-flex justify-content-between align-items-center">
					<h2>회원가입</h2>
					<ol>
						<li><a href="${root}/main.do">Home</a></li>
						<li>회원가입</li>
					</ol>
				</div>

			</div>
		</section>
		<!-- End Breadcrumbs -->
		<div class="container">
			<div class="login-form">
				<div class="main-div p-5">
					<div class="panel">
						<h2>간편하게 가입하고</h2>
						<h2>다양한 서비스를 이용하세요.</h2>
					</div>
					<form action="${root }/regist" method="post" id="memberform">
						<div class="form-group">
							<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디">
						</div>
							<div class="form-group">				
							<input type="text" class="form-control" id="username" name="username" required="required" placeholder="이름을 적어주세요">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="영문,숫자 포함 8자이상">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="userPwcheck" name="userPwcheck" placeholder="비밀번호 재입력">
						</div>
						<div class="form-group">
							<input type="email" class="form-control" id="email" name="email" required="required" placeholder="이메일 주소">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="address" name="address" required="required" placeholder="주소를 적어주세요">
						</div>					
						<button type="submit" class="btn btn-primary">가입하기</button>
					</form>
				</div>
				<p class="botto-text">HappyHouse</p>
			</div>
		</div>
		

	</main>
	<!-- End #main -->

	<jsp:include page="/WEB-INF/views/include/footer.jsp" />

</body>

</html>