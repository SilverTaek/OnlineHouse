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
				<div class="main-div">
					<div class="panel">
						<%--  <img src="${root }/assets/img/logo3.png" style="margin-bottom: 10px" height="100px" /> --%>
						<!-- <h2 style="font-family: SpoqaHanSans; font-size:22px;">간단하게 로그인하고</h2> -->
						<h2 style="font-family: SpoqaHanSans; font-size: 18px;"><strong>
							국가공간정보포털</strong></h2>
													<h2 style="font-family: SpoqaHanSans; font-size: 16px;">부동산중개업 정보에 등록된</h2>
						<h2 style="font-family: SpoqaHanSans; font-size: 16px;"><strong>대표 공인중개사</strong>만 회원가입이 가능합니다.</h2>

					</div>

					<form action="${root }/realtor/regist" method="post" id="realtorform">
							<div class="form-group">


							<input type="text" class="form-control" id="license" name="license"
								placeholder="자격증 번호">

						</div>
						<div class="form-group">


							<input type="text" class="form-control" id="rname" name="rname"
								placeholder="중개소 이름">

						</div>

					
						<div class="form-group">


							<input type="text" class="form-control" id="rid" name="rid"
								placeholder="아이디">

						</div>


						<div class="form-group">

							<input type="password" class="form-control" id="rpwd"
								name="rpwd" placeholder="영문,숫자 포함 8자이상">

						</div>
						<div class="form-group">

							<input type="password" class="form-control" id="rPwcheck"
								name="rPwcheck" placeholder="비밀번호 재입력">

					

						</div>
						<div class="form-group">
							<input type="email" class="form-control" id="remail" name="remail"
								required="required" placeholder="이메일 주소">

						</div>
						
						<div class="form-group">
							<input type="number" class="form-control" id="rphone" name="rphone"
								required="required" placeholder="대표번호">

						</div>
						
						
						

						<div class="form-group">

							<input type="text" class="form-control" id="raddress"
								name="raddress" required="required" placeholder="소재지">
						</div>
						
						<!-- <div class="form-check-inline">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" name="optradio">아파트
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" name="optradio">다세대/다가구
							</label>
						</div>
						<div class="form-check-inline ">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" name="optradio" >오피스텔/도시형생활주택
								
							</label>
						</div>
						<div class="form-check-inline disabled">
							<label class="form-check-label"> <input type="checkbox"
								class="form-check-input" name="optradio" >빌라
								
							</label>
						</div>
 -->
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