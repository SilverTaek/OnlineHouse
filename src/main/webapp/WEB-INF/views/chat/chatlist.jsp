<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="vendor" value="${root }/assets/vendor" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happy House</title>

<link href="${root }/assets/css/chat.css" rel="stylesheet">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	function login() {
		document.getElementById("userinfo").action = "${root}/login";
		document.getElementById("userinfo").submit();
	}
</script>


<style>

.chating .me {
	color: #F6F6F6;
	text-align: left;
}

.chating .others {
	color: #FFE400;
	text-align: right;
}
</style>
</head>
<script type="text/javascript">
  var ws;
	document.addEventListener("keypress", function(e){
		if(e.keyCode == 13){ //enter press
			send();
		}
	});
	function goRoom(rno, rid){
		location.href="/happyhouse/moveChating?rno="+rno+"&"+"rid="+rid;
	}
</script>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section class="breadcrumbs">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
					<h2>실시간 상담</h2>
					<ol>
						<li><a href="${root}/main.do">Home</a></li>
						<li>실시간 상담</li>
					</ol>
				</div>

			</div>
		</section>
		<!-- End Breadcrumbs -->
		
		<div class="messaging">
			<div class="inbox_msg">
				<div class="inbox_people">
					<div class="headind_srch">
						<div class="recent_heading">
							<h4 style="color: #ffc451">
								<strong>공인중개소</strong>
							</h4>
						</div>
						<div class="srch_bar">
							<div class="stylish-input-group">
								<input type="text" class="search-bar" placeholder="Search">
							</div>
						</div>
					</div>
					<div class="inbox_chat scroll">
						<c:forEach items="${realtors }" var="realtor">
							<div class="chat_list active_chat">
								<div class="chat_people">
									<div class="chat_img">
										<img src="https://ptetutorials.com/images/user-profile.png"
											alt="sunil">
									</div>
									<div class="chat_ib">
										<h5><a href="${root }/realtor/info?rno=${realtor.rno}&rid=${realtor.rid}">${realtor.rname}</a>
											<span class="chat_date"><button type="button"
													class="btn btn-primary btn-mm"
													onclick="goRoom(${realtor.rno},'${realtor.rid }');">채팅하기</button></span>
										</h5>
										<p>${realtor.rcontent }</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="mesgs">
					<div class="msg_history" style="text-align:center;">
						 <img src="${root }/assets/img/logo10.jpeg" style="margin-bottom: 10px" height="300px" />
						<h1>행복하게 시작하는 우리집</h1>
						<h1>지금 바로 문의하세요!</h1>
					</div>
				</div>
			</div>
		</div>
		
		</main>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>