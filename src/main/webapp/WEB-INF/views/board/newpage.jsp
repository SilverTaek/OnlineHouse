<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="vendor" value="${root }/assets/vendor" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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

<style>

th{
border-top: 2px solid rgb(204, 204, 204);
border-bottom: 1px solid rgb(204, 204, 204);
font-size:17px;

}
td{
border-bottom: 1px solid rgb(204, 204, 204);
}
#title:hover{
background-color:#ffc451;
}
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<main id="main">
      <!-- ======= Breadcrumbs ======= -->
      <section class="breadcrumbs">
        <div class="container">
          <div class="d-flex justify-content-between align-items-center">
            <h2>공지사항</h2>
            <ol>
              <li><a href="${root}/main.do">Home</a></li>
              <li>공지사항</li>
            </ol>
          </div>
        </div>
      </section>
      
      
  <div class="container">
  <br>
      <p style="font-size:33px; text-align:center;">공지사항</p>
      <br>
   <table>
   <thead>
   <tr>
   <th style="text-align:center; border-top: 2px solid rgb(204, 204, 204);border-bottom: 1px solid rgb(204, 204, 204); width:1045px;"><strong>제목</strong></th>
   <th></th>
   <th style="text-align:right; border-top: 2px solid rgb(204, 204, 204);
    border-bottom: 1px solid rgb(204, 204, 204); width:145px;"><strong>날짜</strong></th>
   </tr>
   </thead>
     <tbody>
     <form action="${root }/notice/remove">
     <c:forEach items="${list }" var="listvar">
      <tr>
      <td id="title"style="border-bottom: 1px solid rgb(204, 204, 204);">
      <a
        
        id="show"
        onclick="if(b${ listvar.bno}.style.display=='none')
    {b${listvar.bno}.style.display=''; }
    else {b${ listvar.bno}.style.display='none';}"
        ><p style="font-size:20px;">${listvar.title }</p></a>
<div id="b${ listvar.bno}" style="display: none; background-color:#F5F5F5;">
        ${listvar.content } <img src="${root }/assets/img/${listvar.bno }.png" style="width:1050px;">
         
      </div>
      
      </td>
      <td style="background-color:#F5F5F5;"></td>
      <fmt:formatDate var="date" value="${listvar.regDate}" pattern="yyyy-MM-dd"/>
      <td style="width:150px; text-align:center;"><strong>${date }</strong></td>
      <c:if test="${grade eq 1 }">
      <td><input type="checkbox" name="checkdel" value="${listvar.bno }"></td>
      </c:if>
      </tr>
      
     

</c:forEach>
      </tbody>

    </table>
    <br>
	 <nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <c:forEach begin="1" end="${pageNum}" var="num">
	              <li class="page-item">
	              	<a class="page-link" href="${root }/getlistpage?num=${num}">${num}</a>
	              </li>
	            </c:forEach>
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
					<c:if test="${grade eq 1 }">
					<div class="move" style="text-align:center;">
					<button type="submit" class="btn btn-success btn-filter" data-target="cancelado" style="margin-bottom:6px;">작성</button>
					<button type="submit" class="btn btn-warning btn-filter" data-target="cancelado" style="margin-bottom:6px;">수정</button>
					<button type="submit" class="btn btn-danger btn-filter" data-target="cancelado" style="margin-bottom:6px;">삭제</button>
</div>
</c:if>
</form>
</div>
    </main>
</body>
</html>