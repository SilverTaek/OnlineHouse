<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="vendor" value="${root }/assets/vendor" />
<c:if test="${cookie.happyhouse_id.value ne null}">
  <c:set var="saveid" value="${cookie.happyhouse_id.value}" />
  <c:set var="idck" value=" checked=\"checked\""/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Happy House</title>

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link href="${vendor}/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${vendor}/icofont/icofont.min.css" rel="stylesheet" />
    <link href="${vendor}/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link
      href="${vendor}/owl.carousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />
    <link href="${vendor}/venobox/venobox.css" rel="stylesheet" />
    <link href="${vendor}/remixicon/remixicon.css" rel="stylesheet" />
    <link href="${vendor}/aos/aos.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="${root }/assets/css/style.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script type="text/javascript">
      function login() {
        document.getElementById('userinfo').action = '${root}/login';
        document.getElementById('userinfo').submit();
      }
    </script>   
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
          <div class="main-div p-5">
            <div class="panel">
              <img src="${root }/assets/img/logo10.jpeg" style="margin-bottom: 10px" height="150px"/>
              <h2>간단하게 로그인하고</h2>
              <p>다양한 서비스를 이용하세요.</p>
            </div>

            <form action="${root }/login" method="post" id="Login">
              <div class="form-group">
                <input type="text" class="form-control" id="userid" name="userid" 
                				value="${saveid }" placeholder="이메일주소" required/>
              </div>

              <div class="form-group">
                <input type="password" class="form-control" id="userpwd"
                  name="userpwd" placeholder="비밀번호" required/>
              </div>
              <div class="forgot d-flex mb-2">
                <a href="${root}/searchPwForm">비밀번호를 잊어버리셨나요?</a>
                <a href="${root}/registForm" class="ml-auto">회원가입</a>
              </div>
              <div class="forgot">
              	<a href="${root}/realtorLogin">공인중개사 로그인</a>
              </div>
              <button type="submit" class="btn btn-primary">로그인</button>
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
