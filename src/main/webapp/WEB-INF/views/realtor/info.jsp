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



<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
	integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg"
	crossorigin="anonymous">


<script>
	function goRoom(rno, rid){
		location.href="/happyhouse/moveChating?rno="+rno+"&"+"rid="+rid;
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
					<h2>중개소 정보</h2>
					<ol>
						<li><a href="${root}/main.do">Home</a></li>
						<li>중개소 정보</li>
					</ol>
				</div>

			</div>
		</section>
		<!-- End Breadcrumbs -->
		<div class="container">
		
		
			<h1 class="text-center"
				style="font-family: SpoqaHanSans; color: #ffc451">${realtorInfo.rname }<img src="${root }/assets/img/bronze.png" style="width:100px;"></h1>
				
				
			
			<hr>
			<div class="row">
				<div class="col-sm-8">
					<img src="${root }/assets/img/${realtorInfo.rname }.png"
						style="width: 740px; height: 560px;">
				</div>

				<div class="col-sm-4" id="contact2">
					<h3 style="font-family: SpoqaHanSans;">${realtorInfo.rcontent }</h3>
					<hr align="left" width="100%">
					<h4 class="pt-2">주거래</h4>
					<p>아파트/빌라</p>
					<hr align="left" width="100%">
					<h4 class="pt-2">주소</h4>
					<p>${realtorInfo.raddress }</p>
					<hr align="left" width="100%">
					<br>
					<h4 class="pt-2">연락처</h4>
					
					<i class="fas fa-phone" style="color: #000"></i> <a href="tel:+">
						${realtorInfo.rphone } </a><br>
	<hr align="left" width="100%">
					<h4 class="pt-2">이메일</h4>
					<i class="fa fa-envelope" style="color: #000"></i> <a href="">${realtorInfo.remail }</a><br>
				</div>
			</div>
		</div>

	<br>
	
	

  <!-- The Modal -->
  <div class="modal fade" id="myModal"  style="text-align:center;">
    <div class="modal-dialog modal-dialog-centered" style="text-align:center;">
      <div class="modal-content" style="width:296px; text-align:center;">
      
        <!-- Modal Header -->
        <div class="modal-header" style="text-align:center;">
          <h4 class="modal-title" style="font-size:20px; font-family: SpoqaHanSans; margin-left:100px;"><strong style="text-align:center;">문의하기</strong></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <p style="font-size:18px; font-family: SpoqaHanSans;">${realtorInfo.rname }(${realtorInfo.ceo })</p>
          <p style="font-size:30px; color:#ffc451; font-family: SpoqaHanSans;">${realtorInfo.rphone }</p>
        	<p style="font-size:12px">통화내용이 녹음됩니다. </br>녹음에 동의하신다면 대표 번호로 연락주세요.	</p>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width:260px; background-color:#ffc451;">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
  
	<div style="text-align: center;">
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="background-color:#FFC451;">
    전화하기
  </button>
		<button type="button"  style="background-color: #ffc451" class="btn btn-primary btn-mm"
			onclick="goRoom(${realtorInfo.rno},'${realtorInfo.rid }');">실시간 상담</button>
			<br>
</div>
	</main>
	<!-- End #main -->
	</br>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />

</body>

</html>