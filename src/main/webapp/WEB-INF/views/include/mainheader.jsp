<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="vendor" value="${root }/assets/vendor" />

<!-- ======= Header ======= -->
<header id="header" class="fixed-top ">
  <div class="container d-flex align-items-center ">
    <h1 class="logo">
      <a href="${root}/">Happy House<span>.</span></a>
    </h1>

    <nav class="nav-menu d-none d-lg-block ">
      <ul>
        <li><a href="${root }/getlistpage?num=1">공지사항</a></li>
        <li><a href="${root }/api/news">오늘의 뉴스</a></li>
        <li><a href="${root}/map">내 집 찾기</a></li>
        <c:if test="${realtorinfo eq null}">
        	<li><a href="${root }/chat">실시간 상담</a></li>
        </c:if>
        <c:if test="${realtorinfo ne null}">
        	<li><a href="${root}/moveChating?rid=${realtorinfo.rid}&rno=${realtorinfo.rno}">실시간 상담(중개사)</a></li>
        </c:if>
        <li><a href="http://localhost:8080/">커뮤니티</a></li>
      </ul>
    </nav>
    <!-- .nav-menu -->

    <c:if test="${userinfo eq null and realtorinfo eq null}">
      <a href="${root}/loginform" class="get-started-btn scrollto ml-auto">로그인</a>
    </c:if>
    <c:if test="${userinfo ne null and grade eq 2}">
      <nav class="nav-menu d-lg-block ml-auto">
        <ul>
          <li class="drop-down">
            <div class="icon-box">
              <a><i class="ri-user-line ri-xl"></i>&nbsp;${userinfo.userid}님</a>
            </div>

            <ul>
              <li><a href="${root}/mydata?userid=${userinfo.userid}">내정보</a></li>
							<li><a href="${root}/favorite">관심지역 관리</a></li>
              <c:if test="${grade eq 1}">
                <li><a href="${root }/person/list">관리자페이지</a></li>
              </c:if>
              <li><a href="${root}/logout">로그아웃</a>
            </ul>
          </li>
        </ul>
      </nav>
    </c:if>
     <c:if test="${userinfo ne null and grade eq 1}">
      <nav class="nav-menu d-lg-block ml-auto">
        <ul>
          <li class="drop-down">
            <div class="icon-box">
              <a><i class="ri-user-settings-line ri-xl"></i>&nbsp;관리자님</a>
            </div>

            <ul>
              <li><a href="${root}/mydata?userid=${userinfo.userid}">내정보</a></li>
							<li><a href="${root}/favorite">관심지역 관리</a></li>
             
                <li><a href="${root }/person/list">관리자페이지</a></li>
             
              <li><a href="${root}/logout">로그아웃</a>
            </ul>
          </li>
        </ul>
      </nav>
    </c:if>
    
    <c:if test="${realtorinfo ne null}">
    <nav class="nav-menu d-lg-block ml-auto">
        <ul>
          <li class="drop-down">
            <div class="icon-box">
              <a><i class="ri-building-4-line ri-xl"></i>&nbsp;${realtorinfo.rname}님</a>
           
            </div>

            <ul>
              <li><a href="${root}/realtor/updateForm?rid=${realtorinfo.rid}&rno=${realtorinfo.rno}">중개소 관리</a></li>
							<li><a href="${root}/favorite">관심지역 관리</a></li>
              
              <li><a href="${root}/logout">로그아웃</a>
            </ul>
          </li>
        </ul>
      </nav>
      </c:if>
  </div>
</header>
<!-- End Header -->
