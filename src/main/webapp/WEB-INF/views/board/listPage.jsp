<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="vendor" value="${root }/assets/vendor" />
<!DOCTYPE html>
<html>
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
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
    <main id="main">

      <section class="inner-page">
        <div class="container" data-aos="fade-up" align="center">
          <div class="col-lg-10" align="center">
	        	<div class="mt-5 mb-5">
	          	<h2 class="text-center">공지사항</h2>
	          </div>
          <table class="table table-hover table-striped text-center">
	          <colgroup>
					    <col width="10%">
					    <col width="60%">
					    <col width="10%">					   
					    <col width="20%">
					  </colgroup>
            <thead>
              <tr>
                <th>번호</th>
                <th>제목</th>                
                <th>작성자</th>                
                <th>작성일자</th>
              </tr>
            </thead>

            <tbody>
              <c:forEach items="${list}" var="list">
                <tr>
                  <td>${list.bno}</td>
                  <td class="text-left">
                    <a href="${root }/view?bno=${list.bno}" class="text-dark">${list.title}</a>
                  </td>
									<td>${list.writer}</td>                  
                  <fmt:formatDate var="date" value="${list.regDate}" pattern="yyyy-MM-dd"/>
                  <td>${date}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <hr />
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
					<c:if test="${userinfo ne null and grade eq 1}">
					<a href="${root}/writeform" class="btn btn-outline-info float-right">글쓰기</a>
					</c:if>
          <%-- <div style="text-align:center;">
            <c:forEach begin="1" end="${pageNum}" var="num">
              <span>
                <a href="${root }/getlistpage?num=${num}">${num}</a>
              </span>
            </c:forEach>
            
          </div> --%>
          </div>
          
          
        </div>
      </section>
    </main>
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
  </body>
</html>
