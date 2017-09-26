<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ajax-basic</title>
<script type="text/javascript">
var xhr;
function startAjax(){
	//ajax 통신객체를 생성한다
	xhr=new XMLHttpRequest();
	//서버가 응답하면 실행될 callback함수를 등록한다
	xhr.onreadystatechange=callback;
	xhr.open("get","HelloAjaxSerlvet");
	xhr.send("null");//get방식일때는 null을 할당
	
}
//서버가 응답완료되면 실행될 함수
function callback(){
	//readyState 가 4 이면 응답완료
	//status 가 200은 정상수행
	//즉 응답완료되고 정상수행되었을 때 조회수를 없데이트를 하겠다
	if(xhr.readyState==4&&xhr.status==200){
		//받아오는 텍스트값을 span값에 넣어줌
		document.getElementById("countView").innerHTML=xhr.responseText;				   
	}else{
		document.getElementById("countView").innerHTML="서버에서 처리중..";		
	}
}
</script>
</head>
<body>
<%--기존방식으로 조회수를 요청하여 응답한다 --%>
<form action="HelloSerlvet">
<input type="submit" value="기존방식테스트">
</form>
<hr>
<%--Ajax방식으로 조회수를 요청하여 응답받는다 --%>
<input type="button" value="Ajax방식테스트" onclick="startAjax()">
<span id="countView"></span>
<br><br><br>
<textarea rows="50" cols="50"></textarea>
</body>
</html>