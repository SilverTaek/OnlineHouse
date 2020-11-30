<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="vendor" value="${root }/assets/vendor"/>
<c:if test="${cookie.happyhouse_id.value ne null}">
	<c:set var="saveid" value="${cookie.happyhouse_id.value}"/>
	<c:set var="idck" value=" checked=\"checked\""/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happy House</title>

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
		function login(){
			document.getElementById("userinfo").action = "${root}/login";
			document.getElementById("userinfo").submit();
		}
	</script>
	
	
<style>

/*haber akışı list*/
ul.timeline {
  list-style-type: none;
  position: relative;
}
ul.timeline:before {
  content: ' ';
  background: #d4d9df;
  display: inline-block;
  position: absolute;
  left: 29px;
  width: 2px;
  height: 100%;
  z-index: 400;
}
ul.timeline > li {
  margin: 20px 0;
  padding-left: 20px;
}
ul.timeline > li:before {
  content: ' ';
  background: white;
  display: inline-block;
  position: absolute;
  border-radius: 50%;
  border: 3px solid #ffc451;
  left: 20px;
  width: 20px;
  height: 20px;
  z-index: 400;
}
/*vertical carousel*/
.vert .carousel-item-next.carousel-item-left,
.vert .carousel-item-prev.carousel-item-right {
    -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
}

.vert .carousel-item-next,
.vert .active.carousel-item-right {
    -webkit-transform: translate3d(0, 100%, 0);
            transform: translate3d(0, 100% 0);
}

.vert .carousel-item-prev,
.vert .active.carousel-item-left {
-webkit-transform: translate3d(0,-100%, 0);
        transform: translate3d(0,-100%, 0);
}



</style>
</head>
<body>
<jsp:include page = "/WEB-INF/views/include/header.jsp"/>

  <main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>오늘의 뉴스</h2>
          <ol>
            <li><a href="${root}/main.do">Home</a></li>
            <li>오늘의 뉴스</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

	<br>
	<div class="container">
	<div class="row">
	   <div class="card golge">
            <div class="card-header" style="background-color:#ffc451;">
              <h4 class="text-center m-2 text-white" >오늘의 뉴스</h4>
            </div>
            <div class="card-body">
              <div class="carousel vert slide" data-ride="carousel" data-interval="2000">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <ul class="timeline">
                    <c:forEach var="news" items="${news.items }" varStatus="i">
                      <li>
                        <a target="_blank" href="${news.link }" class="text-info font-weight-bold">${news.title }</a>
                        <p class="float-right text-muted small">${news.pubDate }</p>
                        <p class="article">${ news.description}</p>
                      </li>
                      <hr>
                      </c:forEach>
                     
                    </ul> 
                  </div>
                
                </div>
              </div>
            </div>
          </div>
	</div>
</div>
</main>
</body>
</html>

