<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="vendor" value="${root }/assets/vendor"/>
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
  function searchPw(){
		document.getElementById("searchPwform").action = "${root}/person/searchPw";
		document.getElementById("searchPwform").submit();
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
          <h2>비밀번호 찾기</h2>
          <ol>
            <li><a href="${root}/main.do">Home</a></li>
            <li>비밀번호 찾기</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page">
			<div class="container" data-aos="fade-up" align="center">
			<div class="login-form" align="center">
				<div class="main-div col-lg-6">
					<h2>비밀번호 찾기</h2>
					<form action="" id="searchPwform" method="post">
						<!-- <input type="hidden" name="act" value="searchPw"> -->
						<div class="form-group" align="left">
							<!-- <label for="userid">아이디</label> -->
							<input type="text" class="form-control" id="userid" name="userid" required="required" placeholder="본인 아이디를 입력하세요">
						</div>
						<div class="form-group" align="left">
							<!-- <label for="userEmail">이메일</label> -->
							<input type="email" class="form-control" id="email" name="email" placeholder="본인 이메일을 입력하세요"
								required="required">
						</div>
						<div class="form-group" align="center">
							<button type="button" class="btn btn-primary" onclick="javascript:searchPw();">찾기</button>
						</div>
					</form>
				</div>
				</div>
			</div>

		</section>

  </main><!-- End #main -->

  <jsp:include page = "/WEB-INF/views/include/footer.jsp"/> 

</body>

</html>