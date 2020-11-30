<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="vendor" value="${root }/assets/vendor"/>
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
      <!-- End Breadcrumbs -->
      <section class="inner-page">
        <div class="container">
          <br />
          <h1 class="text-center">공지사항</h1>
          <br />
          <br />

          <table
            class="table table-hover table-striped text-center"
            style="border: 1px solid"
          >
            <thead>
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>작성자</th>
                <th>조회수</th>
              </tr>
            </thead>

            <tbody>
              <c:forEach items="${list}" var="list">
                <tr>
                  <td>${list.bno}</td>
                  <td>
                    <a href="${root }/view?bno=${list.bno}">${list.title}</a>
                  </td>
                  <td>${list.regDate}</td>
                  <td>${list.writer}</td>
                  <td>${list.viewCnt}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <hr />
          <div>
            <ul class="pagination justify-content-center">
              <li>
                <a href="#" style="margin-right: 5px" class="text-secondary">
                  ◀</a
                >
              </li>
              <li>
                <a href="#" style="margin-right: 5px" class="text-secondary">
                  1</a
                >
              </li>
              <li>
                <a href="#" style="margin-right: 5px" class="text-secondary">
                  2</a
                >
              </li>
              <li>
                <a href="#" style="margin-right: 5px" class="text-secondary">
                  3</a
                >
              </li>
              <li>
                <a href="#" style="margin-right: 5px" class="text-secondary">
                  4</a
                >
              </li>
              <li>
                <a href="#" style="margin-right: 5px" class="text-secondary">
                  5</a
                >
              </li>
              <li>
                <a href="#" style="margin-right: 5px" class="text-secondary">
                  ▶</a
                >
              </li>
            </ul>
            
          </div>
          <a href="${root}/writeform" class="btn btn-outline-info float-right"
            >글쓰기</a
          >
        </div>
      </section>
    </main>
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
  </body>
</html>
