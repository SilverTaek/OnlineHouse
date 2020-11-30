<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	          	<h3 class="text-center">수정하기</h3>
	          </div>

            <form action="modify" method="post">
            	<input type="hidden" name="bno" class="form-control" value="${view.bno }" readonly />
              <table class ="table table-borderless">                
                <tr>
                  <td width="150" align="center">작성자</td>
                  <td><input class="form-control" type="text" value="${view.writer }" name="writer" readonly/> </td>
                </tr>
                <tr>
                  <td width="20%" align="center">글제목</td>
                  <td>
                    <input class="form-control" type="text" value="${view.title }" name="title" id="i_title"/>
                  </td>
                </tr>
                <tr>
                  <td width="20%" align="center">글내용</td>
                  <td>
                    <textarea class="form-control" rows="20" cols="60" name="content" id="i_content" >${view.content}</textarea>
                  </td>
                 </tr>
                 
              </table>
              <div class="text-center">
                <input type="submit" value="수정완료" class="btn btn-outline-secondary btn-lg" />
                
              </div>
              </form>
          </div>
        </div>
      </section>
    </main>
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
  </body>
</html>
