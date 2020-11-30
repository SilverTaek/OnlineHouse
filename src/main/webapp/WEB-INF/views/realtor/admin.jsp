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

	
</script>


<style>
label {
	float: left;
}
</style>
</head>


<body>



	<main id="main">

		<!-- ======= Breadcrumbs ======= -->

		<!-- End Breadcrumbs -->
		<div class="container">
<br></br>
			<div class="login-form">
				<div class="main-div">
					<div class="panel">
						<%--  <img src="${root }/assets/img/logo3.png" style="margin-bottom: 10px" height="100px" /> --%>
						<!-- <h2 style="font-family: SpoqaHanSans; font-size:22px;">간단하게 로그인하고</h2> -->
						<h2 style="font-family: SpoqaHanSans; font-size: 22px;">
							<strong> ${realtorInfo.rname }님 환영합니다</strong>
						</h2>
						<h2 style="font-family: SpoqaHanSans; font-size: 16px;">세부정보를
							기입해주세요</h2>
						<h2 style="font-family: SpoqaHanSans; font-size: 16px;">
							<strong></strong>
						</h2>
		<br>
					</div>

					<form action="${root }/realtor/update" method="post"
						>
						
						
						<input type="hidden" name="rno" id="rno" value="${realtorInfo.rno}">
						<input type="hidden" name="rid" id="rid" value="${realtorInfo.rid}">
						<div class="form-group">

							<label>자격증 번호</label> <input type="text" class="form-control"
								id="license" name="license" value="${realtorInfo.license }">

						</div>
						<div class="form-group">

							<label>대표 이름</label> <input type="text" class="form-control"
								id="ceo" name="ceo" value="${realtorInfo.ceo }"
								placeholder="대표 이름을 등록하세요">

						</div>

					

						<div class="form-group">
							<label>대표 이메일</label> <input type="email" class="form-control"
								id="remail" name="remail" value="${realtorInfo.remail }"
								required="required">

						</div>

						<div class="form-group">
							<label>대표 번호</label> <input type="text" class="form-control"
								id="rphone" name="rphone" value="${realtorInfo.rphone }"
								required="required">

						</div>




						<div class="form-group">
							<label>소재지</label> <input type="text" class="form-control"
								id="raddress" value="${realtorInfo.raddress }" name="raddress"
								required="required">
						</div>

						<div class="form-group">
							<label>소개글</label> <input type="text" class="form-control"
								id="rcontent" value="${realtorInfo.rcontent }" name="rcontent" placeholder="소개글을 작성해주세요" 
								required="required">
						</div>

						<button type="submit" class="btn btn-primary">확인</button>

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