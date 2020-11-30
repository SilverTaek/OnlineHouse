<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="vendor" value="${root }/assets/vendor" />
<!DOCTYPE html>
<html lang="ko">
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
    <script
      type="text/javascript"
      src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9jrk69qmcg&submodules=geocoder"
    ></script>
    <script type="text/javascript" src="${root }/assets/js/MarkerClustering.js"></script>
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/include/header.jsp" />

    <main id="main">
      <section class="container mt-5">
        <div class="" data-aos="fade-up">
					<div class="custom-control-inline m-2">
						<div class="custom-control custom-switch m-2">
						  <input type="checkbox" class="custom-control-input" id="s-realdeal" checked>
						  <label class="custom-control-label" for="s-realdeal">실거래가</label>
						</div>
						<div class="custom-control custom-switch m-2">
						  <input type="checkbox" class="custom-control-input" id="s-store">
						  <label class="custom-control-label" for="s-store">상권 정보</label>
					  </div>					  
					  <div class="custom-control custom-switch m-2">
						  <input type="checkbox" class="custom-control-input" id="s-triageroom">
						  <label class="custom-control-label" for="s-triageroom">코로나 선별 진료소 </label>
					  </div>
					  <div class="custom-control custom-switch m-2">
						  <input type="checkbox" class="custom-control-input" id="s-hospital">
						  <label class="custom-control-label" for="s-hospital">국민 안심 병원 </label>
						</div>
					</div>
					
          <div class="" data-aos="fade-up" data-aos-delay="100">
          	<div class="text-center row m-3">
              <select id="sido" class="text-secondary border col custom-select">
                <option value="0">시/도</option>
              </select>
              <select id="gugun" class="text-secondary border col custom-select">
                <option value="0">구/군</option>
              </select>
              <select id="dong" class="text-secondary border col custom-select mr-2">
                <option value="0">읍/면/동</option>
              </select>              
              <form id="searchApt" method="post" class="form-inline col">
	             <input type="text" class="form-control border border-warning" 
	             	 name="saptname" id="saptname" placeholder="아파트 이름 입력" value="${keyword}"/>
	             <button type="button" id="aptnameSearch" class="btn col">
	               <i class="ri-search-line ri-xl text-warning"></i>
	             </button>
	           </form>
           	</div>
           	<div class="row">
	          	<div style="width: 100%; height: 700px; overflow: auto;" class="col-lg-3">
	               <table class="table mt-2">
	                 <thead>
	                   <tr>
	                     <th id="AptResult">아파트 이름</th>
	                   </tr>
	                 </thead>
	                 <tbody id="searchResult"></tbody>
	               </table>
	             </div>
	 				
	           <div class="col" id="map" style="width: 100%; height: 700px"></div>
           </div>
           <script>
              var map;
              var apt_markers=[], 
              		tri_markers=[], 
              		hos_markers=[],
              		store_markers=[];

              if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                  onSuccessGeolocation,
                  onErrorGeolocation
                );
              } else {
                var center = map.getCenter();
                infowindow.setContent('Geolocation not supported');
                infowindow.open(map, center);
              }
              
              //init map
              var map = new naver.maps.Map('map', {
            	  useStyleMap: true,
                /* center: new naver.maps.LatLng(
                  37.50157063922148,
                  127.03969188398086
                ), */
                zoom: 15,
                mapTypeId: naver.maps.MapTypeId.NORMAL,
              });

              //map info
              var infowindow = new naver.maps.InfoWindow({
                borderWidth: 0,
                anchorSize: new naver.maps.Size(10, 10),
              });

              //get current location
              function onSuccessGeolocation(position) {
                var location = new naver.maps.LatLng(
                  position.coords.latitude,
                  position.coords.longitude
                );
                map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
                var mylocation = new naver.maps.Marker({
              	    position: location,
              	    map: map,
              	    title: '내위치',
              	    icon: {
              	        content: '<div class="rounded-circle shadow p-1 rounded" style="background-color:purple;"><i class="ri-map-pin-user-line ri-lg text-white"></i></div>',
              	        size: new naver.maps.Size(22, 35),
              	        anchor: new naver.maps.Point(11, 35)
              	    }
              	});
                mylocation.setMap(map);
              }

              function onErrorGeolocation() {
                var center = map.getCenter();
                infowindow.setContent('위치를 불러오지 못했습니다.');
                infowindow.open(map, center);
              }
              //end get current location

              //marker
              function addMarker(tmpLat, tmpLng, name, type) {
              	var contentIcon ;
              	if(type=='apt'){
              		contentIcon = '<div class="rounded-circle shadow p-2 bg-warning rounded"><i class="ri-home-5-line ri-lg text-white"></i></div>';
              	} else if(type=='triageroom'){
              		contentIcon = '<div class="rounded-circle shadow p-2 bg-primary rounded"><i class="ri-virus-line ri-lg text-white"></i></div>';
              	} else if(type=='hospital'){
              		contentIcon = '<div class="rounded-circle shadow p-2 bg-success rounded"><i class="ri-hospital-line ri-lg text-white"></i></div>';
              	} else if(type=='store'){
              		contentIcon = '<div class="rounded-circle shadow p-2 bg-info rounded"><i class="ri-store-2-line ri-lg text-white"></i></div>';
              	}
              	
                var marker = new naver.maps.Marker({
                  position: new naver.maps.LatLng(tmpLat, tmpLng),
                  title: name,
                  map: map,
                  icon: {
                    content: [
                      contentIcon,
                    ].join(''),
                    anchor: new naver.maps.Point(15, 10),
                  },
                });
                
                marker.addListener('click', function () {
                  var location = new naver.maps.LatLng(tmpLat, tmpLng);
                  var info;
                  map.setCenter(location);
                  if(type=='apt'){
                	  getSearchAptDetail(name);
                	  info = '<div class="shadow p-3 bg-white rounded" width="100%" height="100%">'
              			+ name + '</div>';
                  } else if(type=='triageroom'){
                		info = getTriageroomDetail(name);
                	} else if(type=='hospital'){
                		info = getHospitalDetail(name);
                	} else if(type=='store'){
                		info = getStoreDetail(name);
                	} 
                  infowindow.setContent(info);
                  infowindow.open(map, location);
                });
                
                marker.setMap(map);
                if(type=='apt'){
                	apt_markers.push(marker);
                } else if(type=='triageroom'){
                	tri_markers.push(marker);
                } else if(type=='hospital'){
                	hos_markers.push(marker);	
                } else if(type=='store'){
                	store_markers.push(marker);
                } 
              }
              
              //marker clustering
              $(document).ready(cluster);
              function cluster(){
            	  var markericon = {
            			  content : '<div class="rounded-circle shadow p-2 bg-info rounded"></div>',
            			  size: N.Size(40, 40),
            		    anchor: N.Point(20, 20)	  
            	  }
            	  var markerClustering = new MarkerClustering({
					        minClusterSize: 3,
					        maxZoom: 20,
					        map: map,
					        markers: store_markers,
					        disableClickZoom: false,
					        gridSize: 120,
					        icons: [markericon, markericon, markericon, markericon, markericon],
					        indexGenerator: [10, 100, 200, 500, 1000],
					        stylingFunction: function(clusterMarker, count) {
				            $(clusterMarker.getElement()).find('div:first-child').text(count);
					        }
						    });
              }
              

              //init map marker
              function initMarker(type) {
            	  if(type=='apt'){
            		  for (var i = 0; i < apt_markers.length; i++) {
                    apt_markers[i].setMap(null);
                  }
                  apt_markers = [];
                } else if(type=='triageroom'){
         		  		for (var i = 0; i < tri_markers.length; i++) {
                    tri_markers[i].setMap(null);
                  }
                  tri_markers = [];
                } else if(type=='hospital'){
         		  		for (var i = 0; i < hos_markers.length; i++) {
                    hos_markers[i].setMap(null);
                  }
                  hos_markers = [];
                } else if(type=='store'){
   		  					for (var i = 0; i < store_markers.length; i++) {
                    store_markers[i].setMap(null);
                  }
                  store_markers = [];
                } 
              }
              
              function getsidolist(){
								$.get('${root}/map/sidolist',
					        function (data, status) {
					          $.each(data, function (index, vo) {
					        	  $('#sido').append(
					              "<option value='" + vo.sido_code + "'>" + vo.sido_name + '</option>'
					            );
					          }); //each
					        }, //function
					        'json'
					      ); //get
							} $(document).ready(getsidolist);
              
              function getTriageroom(){
            	  var gugun = $("#gugun option:selected").val();
            	  $.get("${root}/covid/triageroomName/"+gugun
									,{gugun:gugun}
									,function(data, status){
										searchAddressToCoordinate(data, 'triageroom');
									}//function
									, "json"
								);//get
              }
              
              function getHospital(){
            	  var gugun = $("#gugun option:selected").val();
            	  $.get("${root}/covid/hospitalName/"+gugun
									,{gugun:gugun}
									,function(data, status){
										searchAddressToCoordinate(data, 'hospital');
									}//function
										, "json"
								);//get
              }
              
              function getStore(){
            	  var sido = $("#sido option:selected").text();
            	  var gugun = $("#gugun option:selected").text();
            	  var dong = $("#dong option:selected").text();
            	  
            	  $.get("${root}/store/storeList/"+sido+'/'+gugun+'/'+dong
									,{sido:sido, gugun:gugun, dong:dong}
									,function(data, status){
										
										searchAddressToCoordinate(data, 'store');
									}//function
										, "json"
								);//get
              }             
              
              function getTriageroomDetail(name){            	  
            	  $.get("${root}/covid/triageroomTName/"+name
									,{tname: name}
									,function(data, status){
										let info = 
											'<div class="shadow p-3 bg-white rounded" width="100%" height="100%">'
											+ '<h4 class="text-primary">' + name + '</h4>'
											+ '<span class="font-weight-bold text-primary">주소: </span> ' + data[0].address + '<br>'
											+ '<span class="font-weight-bold text-primary">평일 운영시간: </span> ' + data[0].weekdaytime + '<br>'
											+ '<span class="font-weight-bold text-primary">토요일 운영시간: </span> ' + data[0].sattime + '<br>'
											+ '<span class="font-weight-bold text-primary">일요일/공휴일 운영시간: </span> ' + data[0].suntime + '<br>'
											+ '<span class="font-weight-bold text-primary">대표 전화번호: </span> ' + data[0].phone + '<br>' 
											+ '<span class="font-weight-bold text-primary">검체채취 가능여부: </span> ' + data[0].swabbing + '<br>'
											+'</div>';											
										setCenterDong(data[0].address, name, info);			     
									}//function
									, "json"
								);//get								
              }
              
              function getHospitalDetail(name){
            	  $.get("${root}/covid/hospitalHName/"+name
									,{hname:name}
									,function(data, status){
										let info = 
											'<div class="shadow p-3 bg-white rounded" width="100%" height="100%">'
											+ '<h4 class="text-success">' + name + '</h4>'
											+ '<span class="font-weight-bold text-success">주소: </span> ' + data[0].address + '<br>'
											+ '<span class="font-weight-bold text-success">신청유형<small>(A: 외래진료, B:외래진료 및 입원)</small>: </span> ' + data[0].type +'<br>'
											+ '<span class="font-weight-bold text-success">대표 전화번호: </span> ' + data[0].phone +'<br>' 
											+'</div>';
											setCenterDong(data[0].address, name, info);
									}//function
									, "json"
								);//get								
              }
              
              function getRealDealList(){
            	  $.get('${root}/map/dong/' + $('#dong').val(),
                  { dong: $('#dong').val() },
                  function (data, status) {
                    $('#searchResult').empty();
                    $('#AptResult').text('아파트 이름');
                    $.each(data, function (index, vo) {
                      let str =
                        '<tr>' +
                        '<td><p id="aptname" class="search-dong" value=' + vo.aptName + '>' +
                        vo.aptName +
                        '</p></td></tr>';
                      $('tbody').append(str);
                    }); //each
                    setCenterDong($('#dong').val(), null, null);
                    initMarker('apt');
                    initMarker('triageroom');
                    initMarker('hospital');
                    initMarker('store');
                    searchAddressToCoordinate(data, 'apt');
                  }, //function
                  'json'
                ); //get
              }
              
              function getRealDeal(name){
            	  $.get('${root}/map/aptname/' + name + '/' + $('#dong').val(),
                  {
                    aptname: name,
                    dong: $('#dong').val(),
                  },
                  function (data, status) {
                    $('#searchResult').empty();
                    $('#AptResult').text(name);
                    
                    $.each(data, function (index, vo) {
                      let str =
                        '<tr>' +
                        '<td><img src="${root }/assets/img/apt-sample.jpg" width="100%" hegiht="100%">' +
                        '<span class="font-weight-bold text-info">거래금액: </span>' + vo.dealAmount + '<br>'+
                        '<span class="font-weight-bold text-info">거래일자: </span>' + vo.dealYear +'.'+vo.dealMonth+'.'+vo.dealDay + '<br>'+
                        '<span class="font-weight-bold text-info">면적: </span>' + vo.area + '<br>'+
                        '<span class="font-weight-bold text-info">평형: </span>' + vo.floor +
                        '</td></tr>';
                      $('tbody').append(str);
                    }); //each
                    setCenterDong($('#dong').val() + ' ' + data[0].jibun, name, null);
                  }, //function
                  'json'
                ); //get
              }
              
              $(document).ready(function(){
            	  if(${keyword ne null}){            		  
               	  getSearchAptName();
                 }
              })
              
              function getSearchAptName(){
            	  $('#AptResult').text('아파트 이름');
                  $.get(
                    '${root}/map/searchAptName/' + $('#saptname').val(),
                    { aptname: $('#saptname').val() },
                    function (data, status) {
                      $('#searchResult').empty();
                      $.each(data, function (index, vo) {
                        let str =
                          '<tr>' +
                          "<td><p id='aptname' class='search-apt' value='" +
                          vo.aptName +
                          "'>" +
                          vo.aptName +
                          '</p></td></tr>';
                        $('tbody').append(str);
                      }); //each
                      setCenterDong(data[0].dong + ' ' + data[0].jibun, null, null);
                      initMarker('apt');
                      searchAddressToCoordinate(data, 'apt');
                    }, //function
                    'json'
                  ); //get  
              }
              
              function getSearchAptDetail(name){
            	  $.get('${root}/map/searchAptNameDetail/' + name,
                  { aptname: name },
                  function (data, status) {
                    $('#searchResult').empty();
                    $('#AptResult').text(name); 
                    $.each(data, function (index, vo) {
                 	   let str =
                        '<tr>' +
                        '<td><img src="${root }/assets/img/apt-sample.jpg" width="100%" hegiht="100%">' +
                        '<span class="font-weight-bold text-info">거래금액: </span>' + vo.dealAmount + '<br>'+
                        '<span class="font-weight-bold text-info">거래일자: </span>' + vo.dealYear +'.'+vo.dealMonth+'.'+vo.dealDay + '<br>'+
                        '<span class="font-weight-bold text-info">면적: </span>' + vo.area + '<br>'+
                        '<span class="font-weight-bold text-info">평형: </span>' + vo.floor +
                        '</td></tr>';
                      $('tbody').append(str);
                    }); //each
                    setCenterDong(data[0].dong + ' ' + data[0].jibun, name, null);
                  }, //function
                  'json'
                ); //get
              }
              
              //name -> address
							function getStoreDetail(address){
            	  
								$.get('${root}/store/storeDetail/' + address,
	                 { address: address },
	                 function (data, status) {
	                	 var count = data.length;
	                   $('#searchResult').empty();
	                   $('#AptResult').text(address); 
	                   $.each(data, function (index, vo) {
	                	   let str;
	                	   if(vo.building==null){
	                		   str = '<tr>' +
		                       '<td>' +
		                       '<span class="font-weight-bold text-info">'+vo.sname+ '</span><br>'+
		                       '<span class="small text-secondary">'+vo.mname+'</span><br>'+
		                       '<span class="small">'+vo.address+'</span><br>'+
		                       '<span class="small">'+vo.floor_no+'층</span>'+
		                       '</td></tr>';
	                	   } else {
	                		   str = '<tr>' +
		                       '<td>' +
		                       '<span class="font-weight-bold text-info">'+vo.sname+ '</span><br>'+
		                       '<span class="small text-secondary">'+vo.mname+'</span><br>'+
		                       '<span class="small">'+vo.address+'</span><br>'+
		                       '<span class="small">'+vo.building+' '+vo.floor_no+'층</span>'+
		                       '</td></tr>';
	                	   }	                	   	                       
	                     $('tbody').append(str);
	                   }); //each
	                   if(count>1){
	                	   setCenterDong(data[0].address, data[0].sname+" 외 "+(count-1)+"개", null);
	                   } else if(count==1){
	                	   setCenterDong(data[0].address, data[0].sname, null);
	                   }
	                   
	                 }, //function
	                 'json'
	               ); //get
            	  
              } 
              
              //toggle on, off
              $('.custom-switch').on('change', function () {
            	  infowindow.close();
            	  var getToggle = $(this).children('input').attr('id');
            	  var isChecked = $(this).children('input').prop('checked');
            	  if(isChecked){
            		  if(getToggle=='s-realdeal'){
            			  getRealDealList();
            		  } else if(getToggle=='s-triageroom'){
               		  getTriageroom();
               	  } else if(getToggle=='s-hospital'){
               		  getHospital();
               	  } else if(getToggle=='s-store'){
               		  getStore();
               	  }
            		  
            	  } else if(!isChecked){
            		  if(getToggle=='s-realdeal'){
                  	initMarker('apt');
                  } else if(getToggle=='s-triageroom'){
                  	initMarker('triageroom');
                  } else if(getToggle=='s-hospital'){
                  	initMarker('hospital');	
                  } else if(getToggle=='s-store'){
                	  initMarker('store');
                  }
            	  }
            	});

						//-------------------------------------------------	 
						//센터변환 
              function setCenterDong(address, name, info) {
                naver.maps.Service.geocode(
                  {
                    query: address,
                  },
                  function (status, response) {
                    if (status === naver.maps.Service.Status.ERROR) {
                      if (!address) {
                        return alert('Geocode Error, Please check address');
                      }
                      return alert('Geocode Error, address:' + address);
                    }

                    if (response.v2.meta.totalCount === 0) {
                      return alert('No result.');
                    }

                    var item = response.v2.addresses[0];
                    var point = new naver.maps.Point(item.x, item.y);
                    var address = '';

                    if (item.roadAddress) {
                      address = item.roadAddress;
                    }

                    map.setCenter(point);
                    
                    if (name != null) {
                    	if(info==null){
                    		infowindow.setContent(
                    			'<div class="shadow p-3 bg-white rounded" width="100%" height="100%">'
                    			+ name + '</div>'
                    		);
                    	} else {
                    		infowindow.setContent(info);	
                    	} 
                    	infowindow.open(map, point);
                    } 
                    
                  }
                );
              }

						//----------------------------------------------------
						//주소로 좌표 변환 (도당동 45-5 )
              function searchAddressToCoordinate(data, type) {								
                infowindow.close();
                var address;
                $.each(data, function (index, vo) {
              	  if(type=="apt"){
                   	address = vo.dong + ' ' + vo.jibun;
              	  } else{
              			address = vo.address;
              	  }
              	  naver.maps.Service.geocode(
                   {
                  	 query: address,
              	  	},
                    function (status, response) {
                      if (status === naver.maps.Service.Status.ERROR) {
                        if (!data) {
                          return alert('Geocode Error, Please check address');
                        }
                        return alert('Geocode Error, address:' + data);
                      }

                      if (response.v2.meta.totalCount === 0) {
                        return alert('No result.');
                      }

                      var item = response.v2.addresses[0];
                      if(type=='apt'){
                      		addMarker(item.y, item.x, vo.aptName, type);
                      } else if(type=='triageroom'){
                      		addMarker(item.y, item.x, vo.tname, type);
                      } else if(type=='hospital'){
                      		addMarker(item.y, item.x, vo.hname, type);
                      } else if(type=='store'){
                    	  addMarker(item.y, item.x, vo.address, type);
                      }
                    }
                  );
              	
                });
                
              }

            $(document).ready(function () {             
            	$('#sido').change(function () {
                $.get('${root}/map/sido/' + $(this).val(),
                  { sido:$(this).val() },
                  function (data, status) {
                    $('#gugun').empty();
                    $('#searchResult').empty();
                    $('#AptResult').text('아파트 이름');

                    $("#gugun").append('<option value="0">선택</option>');
										$.each(data, function(index, vo) {
											$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
										});//each
                  },
                  //function
                  'json'
                ); //get
              }); //change

              $('#gugun').change(function () {
            	  $.get('${root}/map/gugun/' + $('#gugun').val(),
                  { gugun: $('#gugun').val() },
                  function (data, status) {
                    $('#dong').empty();
                    $('#searchResult').empty();
                    $('#AptResult').text('아파트 이름');
                    $('#dong').append('<option value="0">선택</option>');
                    $.each(data, function (index, vo) {
                      $('#dong').append(
                        "<option value='" + vo.dong + "'>" + vo.dong + '</option>'
                      );
                    }); //each
                  }, //function
                  'json'
                ); //get                           	 
               }); //change

               $('#dong').change(function () {
                 getRealDealList();
               }); //change

               $('#searchResult').on('click', 'p', function () {
             	 	 map.setZoom(15);
                 var name = $(this).text();
                 var getClass = $(this).attr('class');

                 if (getClass == 'search-dong') {
                	 getRealDeal(name);
                 } else if(getClass == 'search-apt'){
                   getSearchAptDetail(name);
                  }
                });

                $('#aptnameSearch').on('click', function () {
                  getSearchAptName();
                });
              }); //ready
            </script>
          </div>
				</div>
      </section>
    </main>
    <!-- End #main -->

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
  </body>
</html>
