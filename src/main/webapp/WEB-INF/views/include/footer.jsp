<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="vendor" value="${root }/assets/vendor"/>

<!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3>Happy House<span>.</span></h3>
              <p> 서울 강남구 테헤란로 212<br />
                (역삼역 1번 출구에서 242m)<br /><br />
                <strong>Phone:</strong> 02-3429-5114<br />
                <strong>Email:</strong> ssafy@ssafy.com<br />
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook" ><i class="bx bxl-facebook"></i ></a>
                <a href="#" class="instagram" ><i class="bx bxl-instagram"></i ></a>
                <a href="#" class="google-plus" ><i class="bx bxl-skype"></i ></a>
                <a href="#" class="linkedin" ><i class="bx bxl-linkedin"></i ></a>
              </div>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>사이트 맵</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="${root }/">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">공지사항</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${root}/main.do?act=realDeal&key=dong">실거래가 검색</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="index.html#news">오늘의 뉴스</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${root}/main.do?act=favorite">관심지역 보기</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>주변 탐색</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i><a href="${root}/main.do?act=store">상가정보</a></li>
              <li><i class="bx bx-chevron-right"></i><a href="${root}/main.do?act=environment">주변 환경 정보</a></li>
              <li><i class="bx bx-chevron-right"></i><a href="${root}/main.do?act=triageroom">코로나 선별 진료소</a></li>
              <li><i class="bx bx-chevron-right"></i><a href="${root}/main.do?act=hospital">국민 안심 병원</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>뉴스레터</h4>
            <p>주택관련 정보를 받아보시려면 이메일을 남겨주세요.</p>
            <form action="" method="post">
              <input type="email" name="email" placeholder="email" />
              <input type="submit" value="Subscribe" />
            </form>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Happy House</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer>
  <!-- End Footer -->
  
  <a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a>
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="${vendor}/jquery/jquery.min.js"></script>
  <script src="${vendor}/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${vendor}/jquery.easing/jquery.easing.min.js"></script>
  <script src="${vendor}/php-email-form/validate.js"></script>
  <script src="${vendor}/owl.carousel/owl.carousel.min.js"></script>
  <script src="${vendor}/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${vendor}/venobox/venobox.min.js"></script>
  <script src="${vendor}/waypoints/jquery.waypoints.min.js"></script>
  <script src="${vendor}/counterup/counterup.min.js"></script>
  <script src="${vendor}/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="${root }/assets/js/main.js"></script>
  