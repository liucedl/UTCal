<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Reskill System----Delete</title>
</head>
<body>
<form action="Result_Delete" name="delform" method="post">
	<script language=javascript> 
		setTimeout("document.delform.submit()",1) 
	</script>
		<table>
			<tr>
				<input type="hidden" name="test_userid" value="${param.id }">
			</tr>
			<tr>
				<input type="hidden" name="user_name" value="${param.name }">
			</tr>
			<tr>
				<input type="hidden" name="test_exam_date" value="${param.testdate }">
			</tr>
			<tr>
				<input type="hidden" name="test_language" value="${param.language }">

			</tr>
			<tr>
				<input type="hidden" name="test_class" value="${param.cls }">
			</tr>
		</table>

	</form>
</body>
</html>