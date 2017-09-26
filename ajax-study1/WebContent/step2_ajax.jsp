<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>step2_ajax.jsp</title>
<script type="text/javascript">
	var xhr;
	function startAjax(){
		var mId=document.getElementById("memberId").value;
		if(mId==""){
			alert("아이디를 입력하세요");
			return;//메서드 실행 중단
		}
		xhr=new XMLHttpRequest();//ajax 통신 담당하는 객체	
		//서버가 응답하면 실행할 함수를 등록
		xhr.onreadystatechange=callback;
		//xhr.open("get","FindMemberServlet?memberId="+mId);
		//xhr.send(null); // get방식일때는 null setting, post 방식 데이터 전송용
		xhr.open("post","FindMemberServlet");
		//ajax post 방식일 때 content type을 지정해야 한다. 
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send("memberId="+mId+"&memberName=황새");
	}
	function callback(){//서바가 정상수행되고 응답이 완료되면 실행된다
		//readyState가 4 이면 서버가 응답완료
		//status가 200 정상수행
		if(xhr.readyState==4&&xhr.status==200){
			//alert(xhr.responseText);//responseText : 서버가 응답한 데이터
			document.getElementById("memberInfo").innerHTML=xhr.responseText;
			document.getElementById("memberId").value="";
			document.getElementById("memberId").focus();
		}
	}
</script>
</head>
<body>
회원아이디<input type="text" id="memberId">
<button type="button" onclick="startAjax()">ajax요청</button>
<br>
<span id="memberInfo"></span>
</body>
</html>