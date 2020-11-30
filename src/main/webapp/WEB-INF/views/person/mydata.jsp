<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="vendor" value="${root }/assets/vendor"/>
<c:if test="${userinfo == null}">
	<c:redirect url="/main.do"/>
</c:if>
<c:if test="${userinfo != null}">
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
  <link href="${vendor}/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="${vendor}/venobox/venobox.css" rel="stylesheet">
  <link href="${vendor}/remixicon/remixicon.css" rel="stylesheet">
  <link href="${vendor}/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${root }/assets/css/style.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	function mvmodify() {
		document.getElementById("memberform").action = "${root}/person/modifyform";
		document.getElementById("memberform").submit();
	}
	</script>
  
</head>


<body>

  <jsp:include page = "/WEB-INF/views/include/header.jsp"/>

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>회원정보</h2>
          <ol>
            <li><a href="${root}/happyhouse">Home</a></li>
            <li>회원정보</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page">
			<div class="container" data-aos="fade-up" align="center">
				<div class="col-lg-6" align="center">
					<h2>회원 정보</h2>
					<form id="memberform" method="post" action="${root }/person">
						<input type="hidden" name="act" value="updateForm">
						<input type="hidden" name="userno" id="userno" value="${person.userno}">
						<div class="form-group" align="left">
							<label for="userid">아이디</label>
							<input type="text" class="form-control" id="userid" name="userid" value="${person.userid }"
								readonly="readonly">
						</div>
						<div class="form-group" align="left">
							<label for="userName">이름</label>
							<input type="text" class="form-control" id="username" name="username" value="${person.username }" readonly="readonly">
						</div>
						<div class="form-group" align="left">
							<label for="userEmail">이메일</label>
							<input type="email" class="form-control" id="email" name="email" value="${person.email }" required="required" readonly="readonly">
						</div>
						<div class="form-group" align="left">
							<label for="address">주소</label>
							<input type="text" class="form-control" id="address" name="address" value="${person.address }" readonly="readonly">
						</div>
						<div class="form-group" align="left">
							<label for="phone">전화번호</label>
							<input type="tel" class="form-control" id="phone" name="phone" value="${person.phone }" readonly="readonly">
						</div>

						<div class="form-group" align="center">
							<a href="${root}/" role="button" class="btn btn-primary">확인</a>
							<button type="button" class="btn btn-primary" onclick="javascript:mvmodify();">수정</button>
							<a href="${root}/person?act=remove&userno=${person.userno}" role="button" class="btn btn-primary" id="btn_del">회원 탈퇴</a>
						</div>
					</form>
				</div>
			</div>

		</section>

  </main><!-- End #main -->

  <jsp:include page = "/WEB-INF/views/include/footer.jsp"/> 

</body>

</html>
</c:if>