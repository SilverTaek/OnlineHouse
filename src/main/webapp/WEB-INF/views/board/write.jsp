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
    <script type="text/javascript">
      function readURL(input){
        document.getElementById("preview").style.visibility="visible"; 
        if(input.files && input.files[0]){
          var reader = new FileReader();
          reader.onload = function(e){
            $('#preview').attr('src',e.target.result);
            $(this).next('')
          }
          reader.readAsDataURL(input.files[0]);
        }
      }
      function backToList(obj){
        obj.action = "${contextPath}/qna?action=listArticles.do";
        obj.submit();
      }
    </script>
  
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
    <main id="main">
      
      <section class="inner-page">
        <div class="container" data-aos="fade-up" align="center">
          <div class="col-lg-8" align="center">
            
	        	<div class="mt-5 mb-5">
	          	<h1 class="text-center">공지사항</h1>
	          </div>

            <form
              name="articleForm"
              method="post"
              action="${root }/write"
              enctype="multipart/form-data"
            >
              <table class="table table-borderless">
                <tr>
                  <td>
                    <input
                      type="text"
                      class="form-control"
                      maxlength="300"
                      name="title"
                      placeholder="제목을 입력하세요."
                    />
                  </td>
                </tr>
                <tr>
                  <td>
                    <input
                      type="text"
                      class="form-control"
                      maxlength="300"
                      name="writer"
                      readonly
                      value="${userinfo.username }"
                    />
                  </td>
                </tr>
                <tr>
                  <td>
                    <textarea
                      class="form-control"
                      rows="20"
                      name="content"
                      placeholder="공지사항을 입력해주세요."
                    ></textarea>
                  </td>
                </tr>

                <tr>
                  <td>
                    <div class="custom-file">
                      <input
                        type="file"
                        class="custom-file-input"
                        name="imgFileName"
                        onchange="readURL(this);"
                      />
                      <label class="custom-file-label" for="customFile"
                        >이미지 첨부</label
                      >
                    </div>
                  </td>
                </tr>
              </table>
              <div class="text-center">
                <input
                  type="submit"
                  value="작성완료"
                  class="btn btn-outline-primary btn-lg"
                />
                <input
                  type="button"
                  value="처음으로"
                  class="btn btn-outline-secondary btn-lg"
                  onClick="backToList(this.form)"
                />
              </div>
            </form>
          </div>
        </div>
      </section>
    </main>
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
  </body>
</html>
