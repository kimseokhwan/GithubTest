<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax</title>
<script type="text/javascript">
	var xhr;
	function startAjax(){
		var dept=document.getElementById("deptNo").value;
		if(dept==""){
			document.getElementById("deptInfo").innerHTML=null;
			return;
		}
		xhr=new XMLHttpRequest();
		xhr.onreadystatechange=callback;
		xhr.open("get","FindDeptServlet?deptNo="+dept);
		xhr.send(null);
		}
	function callback(){
		if(xhr.readyState==4&&xhr.status==200){
			document.getElementById("deptInfo").innerHTML=xhr.responseText;
		}
		
	}
</script>
<style type="text/css">
/* 아이디로 선택할 때는 #으로, 클래스로 접근할 때는 .으로 */
	#deptInfo{
		background-color: pink;
	}
</style>
</head>
<body>
<select onchange="startAjax()" id="deptNo">
	<option value="">--부서번호--</option>
	<option value="10">10번</option>
	<option value="20">20번</option>
	<option value="30">30번</option>
</select>
<span id="deptInfo"></span>
<%--
		만약 부서정보를 부서명,지역 ... 과 같이 분할해서 표현해야 한다면 ? 
		<span id="dname"></span><dr><dr>
		<span id="loc"></span>
 --%>
</body>
</html>