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
<link href="${root }/assets/css/info.css" rel="stylesheet">
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


<body>

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
		<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <!-- meta -->
                <div class="profile-user-box card-box bg-custom .bg-warnig" style="color:#ffc451">
                    <div class="row">
                        <div class="col-sm-6"><span class="float-left mr-3"><img src="${root }/assets/img/grade${realtorInfo.rgrade }.png" alt="" class="thumb-lg rounded-circle"></span>
                            <div class="media-body text-white">
                                <h4 class="mt-1 mb-1 font-18">${realtorInfo.rname }</h4>
                                <p class="font-13 text-light">${realtorInfo.rcontent }</p>
                                <p class="text-light mb-0">${realtorInfo.raddress }</p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="text-right">
                                <button type="button" class="btn btn-light waves-effect" style="background-color:#ffc451"><i class="mdi mdi-account-settings-variant mr-1"></i> 실시간 채팅</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ meta -->
            </div>
        </div>
        <!-- end row -->
        <div class="row">
            <div class="col-xl-4">
                <!-- Personal-Information -->
              
                <!-- Personal-Information -->
                <div class="card-box ribbon-box">
                    
                    <div class="clearfix"></div>
                    <div class="inbox-widget">
                    <c:forEach var="realtor" items="${realtor }">
                        
                            <div class="inbox-item">
                                <div class="inbox-item-img"><img src="https://bootdey.com/img/Content/avatar/avatar2.png" class="rounded-circle" alt=""></div>
                                <p class="inbox-item-author"><a href="${root }/realtor/info?rno=${realtor.rno}&rid=${realtor.rid}">${realtor.rname }</a></p>
                                <p class="inbox-item-text">${realtor.rcontent }</p>
                                <p class="inbox-item-date">
                                    <button type="button" class="btn btn-icon btn-sm waves-effect waves-light btn-success"onclick="goRoom(${realtor.rno},'${realtor.rid }')">실시간 채팅</button>
                                </p>
                            </div>
                        
                        </c:forEach>
                       
                    </div>
                </div>
            </div>
            <div class="col-xl-8">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="card-box tilebox-one"><i class="icon-layers float-right text-muted"></i>
                            <h6 class="text-muted text-uppercase mt-0">거래량</h6>
                            <h2 class="" data-plugin="counterup">1,587</h2><span class="text-muted"></span></div>
                    </div>
                    <!-- end col -->
                    <div class="col-sm-4">
                        <div class="card-box tilebox-one"><i class="icon-paypal float-right text-muted"></i>
                            <h6 class="text-muted text-uppercase mt-0">등급</h6>
                            <h2 class=""><span data-plugin="counterup"><img src="${root }/assets/img/grade${realtorInfo.rgrade }.png" style="width:65px; margin-right:30px;"></span></h2><span class="text-muted"></span></div>
                    </div>
                    <!-- end col -->
                    <div class="col-sm-4">
                        <div class="card-box tilebox-one"><i class="icon-rocket float-right text-muted"></i>
                            <h6 class="text-muted text-uppercase mt-0">거래완료 매물</h6>
                            <h2 class="" data-plugin="counterup">1,890</h2><span class="text-muted">Last year</span></div>
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
                <div class="card-box">
                    <h4 class="header-title mt-0 mb-3">외관</h4>
                    
                        <div style="display: inline-flex;">
                            <img src="${root }/assets/img/${realtorInfo.rname }.png" style="width:400px; height:430px;">
                              <div class="card-box">
                    <h4 class="header-title mt-0">${realtorInfo.rname }에 오신걸 환영합니다!</h4>
                    <div class="panel-body">
                        <p class="text-muted font-13">안녕하세요, 저희 부동산은 강남/분당구 매물을 주로 취급합니다. 현재 보고 계신 페이지에서 저와 실시간 상담과 세부정보를 볼 수 있습니다.	다른 중개사와 상담하고 싶다면 왼쪽 하단에 리스트를 참고해주세요.</p>
                        <hr>
                        <div class="text-left">
                            <p class="text-muted font-13"><strong>대표 이름 :</strong> <span class="m-l-15">${realtorInfo.ceo }</span></p>
                            <p class="text-muted font-13"><strong>대표 전화 :</strong><span class="m-l-15">${realtorInfo.rphone }</span></p>
                            <p class="text-muted font-13"><strong>이메일 주소 :</strong> <span class="m-l-15">${realtorInfo.remail }</span></p>
                            <p class="text-muted font-13"><strong>소재지 :</strong> <span class="m-l-15">${realtorInfo.raddress }</span></p>
                            <p class="text-muted font-13"><strong>주거래 매물 :</strong> <span class="m-l-5">아파트/빌라<span class="flag-icon flag-icon-us m-r-5 m-t-0" title="us"></span>  </span><span class="m-l-5"><span class="flag-icon flag-icon-de m-r-5" title="de"></span>  </span><span class="m-l-5"><span class="flag-icon flag-icon-es m-r-5" title="es"></span> </span><span class="m-l-5"><span class="flag-icon flag-icon-fr m-r-5" title="fr"></span> </span>
                            </p>
                             <div class="modal fade" id="myModal"  style="text-align:center;">
    <div class="modal-dialog modal-dialog-centered">
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
  
	<div >
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="background-color:#FFC451;">
    전화하기
  </button>
		
			<br>
</div>
                        </div>
                        <ul class="social-links list-inline mt-4 mb-0">
                            <li class="list-inline-item"><a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="" data-original-title="Facebook"><i class="fa fa-facebook"></i></a></li>
                            <li class="list-inline-item"><a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="" data-original-title="Twitter"><i class="fa fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="" data-original-title="Skype"><i class="fa fa-skype"></i></a></li>
                        </ul>
                    </div>
                </div>
                    </div>
                
               <%--  <div class="card-box">
                    <h4 class="header-title mb-3">오늘의 기사</h4>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            
                                <tr>
                                    <th>#</th>
                                    <th>기사제목</th>
                                    <th>내용</th>
                                    <th>Due Date</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="news" items="${news.items }" varStatus="i">
                                <tr>
                                    <td>1</td>
                                    <td><a target="_blank" href="${news.link }">${news.title }</a></td>
                                    
                                    <td>${news.description }</td>
                                   <td>${news.pubDate }</td>
                                </tr>
                              </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div> --%>
            </div>
            <!-- end col -->
        </div>
        <!-- end row -->
    </div>
    <!-- container -->
</div>

</body>

</html>