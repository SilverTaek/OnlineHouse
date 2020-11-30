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
	$(document).ready(function(){
		$("#userPwcheck").change(function(){
			if($("#userPwcheck").val() != $("#newpwd").val()){
				$("#userPwcheck").val('');
				$("#newpwd").val('');
				alert("비밀번호가 다릅니다.");
			}
		});
	});
	
	function updatePw(){
		document.getElementById("updatePwform").action = "${root}/person/updatePw";
		document.getElementById("updatePwform").submit();
		alert("비밀번호 변경을 완료하였습니다. ");
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
          <h2>비밀번호 초기화 </h2>
          <ol>
            <li><a href="${root}/main.do">Home</a></li>
            <li>비밀번호 초기화 </li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page">
			<div class="container" data-aos="fade-up" align="center">
				<form action="" id="updatePwform" method="post">
					<input type="hidden" name="userno" id="userno" value="${userno}">	
					<div class="login-form" align="center">
				<div class="main-div col-lg-6">
						<label for="userPw"><strong>새로운 비밀번호</strong></label>
						<input type="password" class="form-control" id="newpwd" name="newpwd" required="required"
							placeholder="6~20자리" maxlength="20" minlength="6">
					
					
						<label for="userPwcheck">비밀번호 확인</label>
						<input type="password" class="form-control" id="userPwcheck" name="userPwcheck"
							required="required" placeholder="6~20자리" maxlength="20" minlength="6">
					
					
						<button type="button" class="btn btn-warning" onclick="javascript:updatePw();">초기화 </button>
					</div>
					</div>
				</form>
			</div>
		</section>

  </main><!-- End #main -->

  <jsp:include page = "/WEB-INF/views/include/footer.jsp"/> 

</body>

</html>