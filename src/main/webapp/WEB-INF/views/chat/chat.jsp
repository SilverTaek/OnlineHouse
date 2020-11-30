<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="vendor" value="${root }/assets/vendor" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happy House</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link href="${root }/assets/css/chat.css" rel="stylesheet">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${vendor}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${vendor}/icofont/icofont.min.css" rel="stylesheet">
<link href="${vendor}/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${vendor}/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="${vendor}/venobox/venobox.css" rel="stylesheet">
<link href="${vendor}/remixicon/remixicon.css" rel="stylesheet">
<link href="${vendor}/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${root }/assets/css/style.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	function login() {
		document.getElementById("userinfo").action = "${root}/login";
		document.getElementById("userinfo").submit();
	}
</script>


<style>

#me_img {
	witdh: 50px;
	height: 50px;
}

.msgImg {
	width: 200px;
	height: 125px;
}

.clearBoth {
	clear: both;
}

.img {
	float: right;
}
</style>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		wsOpen();
		/* getRoom(); */

	})

	var ws;

	function wsOpen() {
		ws = new WebSocket("ws://" + location.host + "/happyhouse/chating/"
				+ $("#rno").val());
		wsEvt();
	}
	function wsEvt() {
		ws.onopen = function(data) {
			//소켓이 열리면 동작
		}

		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if (msg != null && msg.type != '') {
				//파일 업로드가 아닌 경우 뿌려준다.
				var d = JSON.parse(msg);
				if (d.type == "getId") {
					var si = d.sessionId != null ? d.sessionId : "";
					if (si != '') {
						$("#sessionId").val(si);
					}
				} else if (d.type == "message") {
					if (d.sessionId == $("#sessionId").val()) {
						$("#chating")
								.append(
										"<div class='incoming_msg'><img id='me_img' src='https://ptetutorials.com/images/user-profile.png' alt='sunil'></div>  <div class='received_msg'><div class='received_withd_msg'><p class='me'>나 :"
												+ d.msg + "</p></div></div>");
					} else {
						$("#chating").append(
								"<div class='outgoing_msg'><div class='sent_msg'><p class='others'>"
										+ "<c:if test='${userinfo.userid eq null}'>"+d.userName  +":</c:if>"  + d.msg
										+ "</p></div></div>");
						
					}

				} else {
					console.warn("unknown type!")
				}
			} else {
				//파일 업로드한 경우 업로드한 파일을 채팅방에 뿌려준다.
				var url = URL.createObjectURL(new Blob([ msg ]));
				$("#chating")
						.append(
								"<div class='img'><img class='msgImg' src="+url+"></div><div class='clearBoth'></div>");
			}
		}

		document.addEventListener("keypress", function(e) {
			if (e.keyCode == 13) { //enter press
				send();
			}
		});
	}



	function send() {


		var option = {
			type : "message",
			rno : $("#rno").val(),
			sessionId : $("#sessionId").val(),
			userName : '${userinfo.userid}',
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}

	function fileSend() {
		var file = document.querySelector("#fileUpload").files[0];
		var fileReader = new FileReader();
		fileReader.onload = function() {
			var param = {
				type : "fileUpload",
				file : file,
				rno : $("#rno").val(),
				sessionId : $("#sessionId").val(),
				msg : $("#chatting").val(),
				userName : '${userinfo.userid}'
			}
			ws.send(JSON.stringify(param)); //파일 보내기전 메시지를 보내서 파일을 보냄을 명시한다.
			
			console.log(this.result);
			
			arrayBuffer = this.result;
			console.log(this.result);
			ws.send(arrayBuffer); //파일 소켓 전송
			console.log(this.result);
		};
		fileReader.readAsArrayBuffer(file);
		
	}
</script>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section class="breadcrumbs">
			<div class="container">
				<div class="d-flex justify-content-between align-items-center">
					<h2>실시간 상담</h2>
					<ol>
						<li><a href="${root}/main.do">Home</a></li>
						<li>실시간 상담</li>
					</ol>
				</div>

			</div>
		</section>
		<!-- End Breadcrumbs -->
		<input type="hidden" id="rno" value="${realtorInfo.rno }">
		<div class="messaging container">
			<div class="inbox_msg border-0">
				<div class="inbox_people">
					<div class="headind_srch border-0">
						<div class="recent_heading ">
						<img src="${root }/assets/img/grade${realtorInfo.rgrade }.png" style="width:50px;">
							<h1 style="color: #ffc451">
								<strong>${realtorInfo.rname } </strong>
							</h1>
						</div>
						
					</div>
					
					<div class="inbox_chat scroll">
					<img src="${root }/assets/img/${realtorInfo.rname }.png" style="width: 100%; height: 360px;">
					<h2>${realtorInfo.rcontent }</h2>
					
					<h2>${realtorInfo.raddress }</h2>
					<h2>${realtorInfo.ceo }</h2>
					<h3>${realtorInfo.rphone }</h3>
					

					</div>
				</div>
				<div class="mesgs">
					<div class="msg_history">
						<input type="hidden" id="sessionId" value="${userinfo.userid }">
						<div id="chating" class="chating"><h4 style="font-family: SpoqaHanSans;"><c:if test="${userinfo eq null }">${realtorInfo.rname }님 환영합니다!</c:if><c:if test="${userinfo ne null }">${userinfo.userid }님 환영합니다!</c:if></h4>	</div>

					</div>

					<div id="yourMsg">
						<div class="type_msg">
							<div class="input_msg_write">
								<input type="text" id="chatting" class="write_msg"
									placeholder="Type a message" />
								<button class="msg_send_btn" onclick="send()">
									<i id="sendBtn" class="fa fa-paper-plane" aria-hidden="true"
										style=""></i>
								</button>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</main>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>