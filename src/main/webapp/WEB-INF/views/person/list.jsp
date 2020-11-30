<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="vendor" value="${root }/assets/vendor"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Happy House</title>

  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet"/>

  <!-- Vendor CSS Files -->
  <link href="${vendor}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${vendor}/icofont/icofont.min.css" rel="stylesheet">
  <link href="${vendor}/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${vendor}/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="${vendor}/venobox/venobox.css" rel="stylesheet">
  <link href="${vendor}/remixicon/remixicon.css" rel="stylesheet">
  <link href="${vendor}/aos/aos.css" rel="stylesheet">
  <link
      href="${vendor}/owl.carousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <!-- Template Main CSS File -->
  <link href="${root }/assets/css/style.css" rel="stylesheet">
  <link href="${root }/assets/css/admin.css" rel="stylesheet">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<%-- productList.jsp --%>
<body>
<jsp:include page = "/WEB-INF/views/include/header.jsp"/> 
<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>관리자페이지</h2>
          <ol>
            <li><a href="${root}/">Home</a></li>
            <li>관리자페이지</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
    
    <div class="container">
	<div class="row">

		<section class="content">
			<h1>회원목록</h1>
			<div class="col-md-10 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="pull-right">
							<div class="btn-group">
								
							</div>
						</div>
						
						<div class="table-container">
							<form action="${root }/person/remove">
							<button type="submit" class="btn btn-danger btn-filter"  data-target="cancelado" style="margin-bottom:6px;">회원삭제</button>
							<table class="table table-filter">
								<tbody>
								
								
								<c:forEach items="${person }" var="Person">
								
									<tr data-status="pagado">
										<td>
											<div class="ckbox">
												<input type="checkbox" id="checkdel" name="checkdel" value="${Person.userid }">
												<label for="checkbox1"></label>
											</div>
										</td>
										<td>
											<a href="javascript:;" class="star">
												<i class="glyphicon glyphicon-star"></i>
											</a>
										</td>
										<td>
											<div class="media">
												<!-- <a href="#" class="pull-left">
													<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
												</a>
												 -->
	   										
												<div class="media-body">
													<%-- <span class="media-meta pull-right">${person.userid}</span> --%>
													<h4 class="title">
														${Person.username}(${Person.userid})
														<span class="pull-right pagado">${Person.phone}</span>
													</h4>
													<p class="summary">${Person.address}</p>
												</div>
											</div>
										</td>
									</tr>
									
									</c:forEach>
									
									
								</tbody>
							</table>
							</form>
						</div>
					</div>
				</div>
				<div class="content-footer">
					
				</div>
			</div>
		</section>
		
		<section class="content">
			<h1>중개소 목록</h1>
			<div class="col-md-10 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="pull-right">
							<div class="btn-group">
								
								
							</div>
						</div>
						<div class="table-container">
							<form action="${root }/realtor/remove">
							<button type="submit" class="btn btn-danger btn-filter" data-target="cancelado" style="margin-bottom:6px;">중개소 삭제</button>
							<table class="table table-filter">
								<tbody>
								
								
								<c:forEach items="${realtorInfo }" var="realtorsInfo">
									<tr data-status="pagado">
										<td>
											<div class="ckbox">
												<input type="checkbox" id="checkdel" name="checkdel"value="${realtorsInfo.rid }">
												<label for="checkbox1"></label>
											</div>
										</td>
										
										<td>
											<div class="media">
												<!-- <a href="#" class="pull-left">
													<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
												</a>
												 -->
	   										
												<div class="media-body">
													<%-- <span class="media-meta pull-right">${person.userid}</span> --%>
													<h4 class="title">
														${realtorsInfo.rname}(${realtorsInfo.ceo})
														<span class="pull-right pagado">${realtorsInfo.rphone}</span>
													</h4>
													<p class="summary">${realtorsInfo.raddress}</p>
												</div>
											</div>
										</td>
									</tr>
									</c:forEach>
								
								</tbody>
							</table>
								</form>
						</div>
					</div>
				</div>
				<div class="content-footer">
					
				</div>
			</div>
		</section>
	</div>
</div>


 <div class="container" style="display: inline-block;">
	<div class="row">

		
		
	</div>
</div>




    
	<%-- <section class="inner-page col col-lg-4" style="text-align: center; ">
	 <h3>회원목록</h3>
	   
	 <form action="${root }/person/remove">
	 <table class="table table-hover table-srtiped text-center" style="margin: auto; border:1px solid;" >
	 <thead>
	   <tr>
	      <th>아이디</th>
	      <th>이름</th>
	     <th>이메일</th>
	     <th>주소</th>
	     <th>핸드폰 번호</th>
	      <th>삭제</th>
	   </tr>
	   </thead>
	   <tbody>
	 <c:forEach items="${person }" var="person">
	   <tr>
	      <td>${person.userid}</td>
	      <td> ${person.username}</td>
	      <td>${person.email}</td>
	      <td>${person.address}</td>
	      <td>${person.phone}</td>
	      <td><input type="checkbox" name="checkdel" value="${person.userid }"></td>
	   </tr>
	 </c:forEach>
	 </tbody>
	 </table>
	   <br>
	   
	  <button type="submit" class="btn btn-primary">회원삭제</button>
		</form>
	  <!--  <form action="join">
	<button style="width: 260px; height: 52px; background-color: blue; color: white;margin-left:15px;">회원등록</button> 
		</form> -->
	
	</section>
	
	<section class="inner-page col col-lg-4" style="text-align: center; ">
	 <h3>중개사 목록</h3>
	   
	 <form action="${root }/realtor/remove">
	 <table class="table table-hover table-srtiped text-center" style="margin: auto; border:1px solid;" >
	 <thead>
	   <tr>
	      <th>중개소 번호</th>
	      <th>중개소 이름</th>
	      <th>대표 이름</th>
	     <th>이메일</th>
	     <th>주소</th>
	     <th>핸드폰 번호</th>
	      <th>삭제</th>
	   </tr>
	   </thead>
	   <tbody>
	 <c:forEach items="${realtorInfo }" var="realtorInfo">
	   <tr>
	      <td>${realtorInfo.license}</td>
	      <td>${realtorInfo.rname}</td>
	      <td> ${realtorInfo.ceo}</td>
	      <td>${realtorInfo.remail}</td>
	      <td>${realtorInfo.raddress}</td>
	      <td>${realtorInfo.rphone}</td>
	      <td><input type="checkbox" name="checkdel" value="${realtorInfo.rid }"></td>
	   </tr>
	 </c:forEach>
	 </tbody>
	 </table>
	   <br>
	   
	  <button type="submit" class="btn btn-primary">중개소 삭제</button>
		</form>
	   <form action="join">
	   <!-- <button style="width: 260px; height: 52px; background-color: blue; color: white;margin-left:15px;">회원등록</button> -->
		</form>
	
	</section> --%>
</main>
	
<jsp:include page = "/WEB-INF/views/include/footer.jsp"/> 

</body>
</html>