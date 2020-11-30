<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>


function open(){

	console.log("되는겨안되는겨?")
	alert('list123');
}

</script>
</head>
<body>


 <div>
      <a
        href="#none"
        id="show"
        onclick="if(hide1.style.display=='none')
    {hide1.style.display='';show.innerText='▲접기'}
    else {hide1.style.display='none';}"
        >ㅇㅇㅇㅇ</a
      >
      <div id="hide1" style="display: none">
        펼치면 보이는 내용을 적어줍니다. <br />
        아무 내용이나 적어주세요. <br />
      </div>
    </div>

</body>
</html>