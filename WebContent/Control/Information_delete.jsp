<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UT Calculate System----delete</title>
</head>
<body>
<form action="Information_delete" name="delform" method="post">
	<script language=javascript> 
		setTimeout("document.delform.submit()",1) 
	</script>
		<table>
			<tr>
				<input type="hidden" name="id" value="${param.id }">
			</tr>
			<tr>
				<input type="hidden" name="date" value="${param.date }">
			</tr>

			<tr>
				<input type="hidden" name="type" value="${param.type }">
			</tr>

		</table>

	</form>
</body>
</html>