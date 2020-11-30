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

    <script>
    
    function modify_article(obj){
      obj.action = "${contextPath}/qna?action=modArticle.do";
      obj.submit();
    }
    
    function backToList(obj){
        obj.action="${contextPath}/qna?action=listArticles.do";
        obj.submit();
      }
    function enable(){
      obj.action = "${root}/modifyform";
      obj.submit();
    }
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#preview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    function remove_qna(url, qnaID){
      var form = document.createElement("form");
      form.setAttribute("method","post");
      form.setAttribute("action",url);
      var qnaIDInput = document.createElement("input");
      qnaIDInput.setAttribute("type","hidden");
      qnaIDInput.setAttribute("name","qnaID");
      qnaIDInput.setAttribute("value", qnaID);
      form.appendChild(qnaIDInput);
      document.body.appendChild(form);
      form.submit();
    }
    function reply_form(url, parentID){
      var form = document.createElement("form");
      form.setAttribute("method", "post");
      form.setAttribute("action", url);
        var parentIDInput = document.createElement("input");
        parentIDInput.setAttribute("type","hidden");
        parentIDInput.setAttribute("name","parentID");
        parentIDInput.setAttribute("value", parentID);
       
        form.appendChild(parentIDInput);
        document.body.appendChild(form);
      form.submit();
    }
    </script>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
    <main id="main">
      <section class="inner-page">
        <div class="container" data-aos="fade-up" align="center">
          <div class="col-lg-10" align="center">
            <div class="mt-5 mb-5">
	          	<h4 class="text-center">${view.title }</h4>
	          </div>

            <table class="table table-borderless">
              <tr>
                <td>글 번호</td>
                <td>
                  <input type="text" class="form-control" value="${view.bno }" readonly />
                </td>
              </tr>
              <tr>
                <td >작성자 아이디</td>
                <td>
                  <input type="text" class="form-control" value="${view.writer }" name="id" readonly />
                </td>
              </tr>
              <tr>
                <td >등록일자</td>
                <td>
                  <input type=text class="form-control" value="<fmt:formatDate value="${view.regDate }" />" readonly/>
                </td>
              </tr>
              
              <tr>
                <td >글내용</td>
                <td>
                  <textarea class="form-control" rows="20" cols="60" name="content" id="i_content" readonly >${view.content}</textarea>
                </td>
              </tr>

              <c:if
                test="${not empty qna.imgFileName&& qna.imgFileName!='null' }"
              >
                <tr>
                  <td rowspan="2">이미지</td>
                  <td>
                    <input
                      type="hidden"
                      name="originalFileName"
                      value="${qna.imgFileName }"
                    />
                    <img
                      src="${contextPath}/download.do?imgFileName=${qna.imgFileName}&qnaID=${qna.qnaID}"
                      id="preview"
                    />
                  </td>
                </tr>
                <tr>
                  <td>
                    <input
                      type="file"
                      name="imgFileName"
                      id="i_imgFileName"
                      disabled
                      onchange="readURL(this);"
                    />
                  </td>
                </tr>
              </c:if>
            </table>

            <div class="text-right" id="btn_sets">
              <a
                href="${root}/notice/delete?bno=${view.bno}"
                class="btn btn-outline-info float-right"
                >삭제</a
              >              
              <a
                href="${root}/notice/modifyform?bno=${view.bno}"
                class="btn btn-outline-info float-right"
                >수정</a
              >
              <a
                href="${root}/getlistpage?num=1"
                class="btn btn-outline-info float-right"
                >목록</a
              >
            </div>
          </div>
        </div>
      </section>
    </main>
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
  </body>
</html>
