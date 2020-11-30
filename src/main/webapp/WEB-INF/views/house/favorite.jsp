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
  
</head>

<body>

  <jsp:include page = "/WEB-INF/views/include/header.jsp"/>

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>관심지역 관리</h2>
          <ol>
            <li><a href="${root}/happyhouse">Home</a></li>
            <li>관심지역</li>
            <li>관심지역 관리</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page">
      <div class="container" data-aos="fade-up">
        <div >
          <h3>관심지역 목록
	          <button type="button" class="btn btn-default add" data-toggle="modal" data-target="#favoriteAddModal">
	              <i class="ri-add-line"></i>추가
	          </button>
          </h3>
					<ul id="favorite">
						<c:if test="${favlist.size() != 0 }">
						<c:forEach var="fav" items="${favlist}">
						<li>${fav.location }
							<button class="btn"><i id="deleteFav" class="ri-delete-bin-7-line"></i></button>
						</li>
						</c:forEach>
						</c:if>
          </ul>
        </div>
      </div>


      <!-- Modal -->
      <div class="modal fade" id="favoriteAddModal" tabindex="-1" aria-labelledby="favoriteAddModalLabel"
        aria-hidden="true">
        
        <div class="modal-dialog">
          <div class="modal-content">
						<script>
						 $(document).ready(function(){
							 $.get("${root}/map/sidolist"
										,function(data, status){
									$.each(data, function(index, vo) {
										$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
									});//each
								}//function
								, "json"
							);//get
						});//ready
						
						$(document).ready(function(){
							$("#sido").change(function() {
								$.get("${root}/map/sido/"+$("#sido").val()
										,{sido:$("#sido").val()}
										,function(data, status){
											$("#gugun").empty();
											$("#gugun").append('<option value="0">선택</option>');
											$.each(data, function(index, vo) {
												$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
											});//each
										}//function
										, "json"
								);//get
							});//change
							
							$("#gugun").change(function() {
								$.get("${root}/map/gugun/"+$("#gugun").val()
										,{gugun:$("#gugun").val()}
										,function(data, status){
											$("#dong").empty();
											$("#dong").append('<option value="0">선택</option>');
											$.each(data, function(index, vo) {
												$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
											});//each
										}//function
										, "json"
								);//get
							});//change
							
							$("#addFav").on("click", function() {
								$.post("${root}/favorite/add/"+$("#sido option:checked").text()+"/"+$("#gugun option:checked").text()+"/"+$("#dong").val()
										,{sido:$("#sido option:checked").text(), gugun:$("#gugun option:checked").text(), dong:$("#dong").val()}
										, "json"
								);//pose
								
								let str = "<li>"
									+ $("#sido option:checked").text()+" "+$("#gugun option:checked").text()+" "+$("#dong").val()
									+ "<i id='deleteFav' class='ri-delete-bin-7-line'></i></li>";
									$("#favorite").append(str);
							});
							
							$("#deleteFav").on("click", function(){
								var location = $(this).closest('li').text().trim();
								$.post("${root}/favorite/delete/${userid}/"+location
										,{userid:'${userid}', location:location}
										, "json"
								);//post  
								$(this).closest('li').remove();
								alert("관심목록에서 삭제되었습니다. ");
							})
							
						});//ready
						
						
						</script>
            <div class="modal-header">
              <h5 class="modal-title" id="favoriteAddModalLabel">관심지역 추가</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            
            <div class="modal-body">
              <form action="">
                <div class="text-center">
                  <select id="sido" name="sido">
                    <option value="0">시/도</option>
                  </select>
                  <select id="gugun" name="gugun">
                    <option value="0">구/군</option>
                  </select>
                  <select id="dong" name="dong">
                    <option value="0">읍/면/동</option>
                  </select>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
              <button type="button" class="btn btn-primary" id="addFav">등록</button>
            </div>
          </div>
        </div>
      </div>

    </section>

  </main><!-- End #main -->

  <jsp:include page = "/WEB-INF/views/include/footer.jsp"/> 

</body>

</html>
</c:if>