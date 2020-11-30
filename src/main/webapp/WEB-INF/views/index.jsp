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

  <!-- Template Main CSS File -->
  <link href="${root }/assets/css/style.css" rel="stylesheet">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
  <jsp:include page = "/WEB-INF/views/include/mainheader.jsp"/> 

  <!-- ======= 메인메뉴 Section ======= -->
  <section id="hero" class="d-flex align-items-center justify-content-center">
    <div class="container" data-aos="fade-up">
      <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="150" >
        <div class="col-xl-6 col-lg-8">
          <h1>Happy House<span>.</span></h1>
          <h2>행복하게 시작하는 우리집</h2>          
          <form action="${root }/mainSearch" class="d-flex flex-row justify-center-between mt-3">
	          <input id="main_search" name="main_search" class="form-control m-3 p-3" type="text" placeholder="아파트 이름으로 검색해보세요!" />
	          <button type="submit" class="btn align-self-center"><i class="ri-search-line ri-xl text-warning"></i></button>
          </form>
        </div>
      </div>

      <div class="row mt-3 justify-content-center" data-aos="zoom-in" data-aos-delay="250" >
        <div class="col-xl-2 col-md-4 col-6 mt-4">
          <div class="icon-box">
            <i class="ri-home-smile-line"></i>
            <h3>
              <a href="${root }/map">실거래가<br>검색</a>
            </h3>
          </div>
        </div>
        <div class="col-xl-2 col-md-4 col-6 mt-4">
          <div class="icon-box">
            <i class="ri-newspaper-line"></i>
            <h3><a href="${root }/api/news">오늘의 뉴스</a></h3>
          </div>
        </div>
        <div class="col-xl-2 col-md-4 col-6 mt-4">
          <div class="icon-box">
            <i class="ri-message-2-line"></i>
            <h3>
              <a href="${root }/chat">실시간 상담</a>
            </h3>
          </div>
        </div>
        
        <div class="col-xl-2 col-md-4 col-6 mt-4">
          <div class="icon-box">
            <i class="ri-team-line"></i>
            <h3>
              <a href="http://localhost:8080/">커뮤니티</a>
            </h3>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- End 메인메뉴 -->

  <main id="main">
        <!-- ======= 주변 탐색 Section ======= -->
    <section id="services" class="services">
      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>더 알아보기</h2>
          <p>그 외 주변 탐색</p>
        </div>

        <div class="row">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100" >
            <div class="icon-box">
              <div class="icon"><i class="bx ri-store-2-line"></i></div>
              <h4><a href="${root}/main.do?act=store">상가정보</a></h4>
              <p>
				                나도 편세권, 슬세권, 떡세권을 누리고 싶다! 필요한 것이 있을 때 바로바로
              </p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200" >
            <div class="icon-box">
              <div class="icon"><i class="bx ri-plant-line"></i></div>
              <h4><a href="${root}/main.do?act=environment">주변 환경 정보</a></h4>
              <p>
				                쾌적한 내 집을 위해서 환기는 필수! 도시라도 공기 좋은 곳에서 살아보자.
              </p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="300" >
            <div class="icon-box">
              <div class="icon"><i class="bx ri-surgical-mask-line"></i></div>
              <h4><a href="">코로나 선별 진료소</a></h4>
              <p>COVID-19 대비 집 근처 코로나 선별 진료소 미리 알아두기</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100" >
            <div class="icon-box">
              <div class="icon"><i class="bx ri-user-search-line"></i></div>
              <h4><a href="">맞춤 검색</a></h4>
              <p>
				                가격대 설정, 평형 정보 설정, 주변 학군 설정 등 다양한 맞춤 설정을 통한 최적의 주택 검색
              </p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="200" >
            <div class="icon-box">
              <div class="icon"><i class="bx ri-paint-brush-line"></i></div>
              <h4><a href="">인테리어 추천</a></h4>
              <p>
				                새로 이사한 집, 어떻게 꾸며야 할 지 고민이라면 여러 전문가 및 커뮤니티의 도움을 받아보세요.
              </p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="300" >
            <div class="icon-box">
              <div class="icon"><i class="bx ri-user-5-line"></i></div>
              <h4><a href="">믿음직한 공인중개소</a></h4>
              <p>
				                내 집 마련, 믿고 살 수 있을까? 인증된 공인중개사, 믿음직한 후기, 10년이상 경력의 전문가!
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- End 주변 탐색 Section -->

    <!-- ======= 뉴스 Section ======= -->
    <section id="news" class="cta">
      <div class="container" data-aos="zoom-in">
        <div class="text-center">
          <h3>오늘의 뉴스</h3>
          <p>주택관련 뉴스입니다.</p>
          <a class="cta-btn" href="#">뉴스 바로가기</a>
        </div>
      </div>
    </section>
    <!-- End 뉴스 Section -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>Contact</h2>
          <p>Contact Us</p>
        </div>

        <div>
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.2801141580658!2d127.03746565084414!3d37.50131103551942!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3ff67128961%3A0x55a56e8ffc5bc5d!2z66mA7Yuw7Lqg7Y287IqkIOyXreyCvA!5e0!3m2!1sko!2sbg!4v1600668842881!5m2!1sko!2sbg"
            width="100%"
            height="450"
            frameborder="0"
            style="border: 0"
            allowfullscreen=""
            aria-hidden="false"
            tabindex="0"
          ></iframe>
        </div>

        <div class="row mt-5">
          <div class="col-lg-4">
            <div class="info">
              <div class="address">
                <i class="icofont-google-map"></i>
                <h4>Location:</h4>
                <p>서울 강남구 테헤란로 212(역삼역 1번 출구에서 242m)</p>
              </div>

              <div class="email">
                <i class="icofont-envelope"></i>
                <h4>Email:</h4>
                <p>ssafy@ssafy.com</p>
              </div>

              <div class="phone">
                <i class="icofont-phone"></i>
                <h4>Call:</h4>
                <p>02-3429-5114</p>
              </div>
            </div>
          </div>

          <div class="col-lg-8 mt-5 mt-lg-0">
            <form action="forms/contact.php" method="post" role="form" class="php-email-form" >
              <div class="form-row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4"
                    data-msg="Please enter at least 4 chars" />
                  <div class="validate"></div>
                </div>
                <div class="col-md-6 form-group">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email"
                    data-msg="Please enter a valid email" />
                  <div class="validate"></div>
                </div>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4"
                  data-msg="Please enter at least 8 chars of subject" />
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <textarea class="form-control" name="message" rows="5" data-rule="required"
                  data-msg="Please write something for us" placeholder="Message" ></textarea>
                <div class="validate"></div>
              </div>
              <div class="mb-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">
                  Your message has been sent. Thank you!
                </div>
              </div>
              <div class="text-center">
                <button type="submit">Send Message</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    <!-- End Contact Section -->
  </main>
  <!-- End #main -->

	<jsp:include page = "/WEB-INF/views/include/footer.jsp"/> 

</body>
</html>
