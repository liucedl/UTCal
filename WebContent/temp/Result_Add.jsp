<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Reskill System----Insert</title>
<link rel="stylesheet" type="text/css" href="../Css/mystyle.css">
</head>
<body>
<!-- update time dateformat set -->
<%
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 
Date date =new Date();
String strdate = sdf.format(date);
request.setAttribute("date",strdate); 
%>
<!----------comn------------------>
<nav id="comn">
     <section>
         <h1>AFLAC</h1>        
     </section>
</nav>

<!----------comn2-----welcome------------->
<nav id="comn2">
     <section>
         <p>&nbsp;&nbsp;Welcome to Aflac Learning System !</p>        
     </section>
</nav>

    <hr />
    <div class="text_l"><img src="../Img/sub_title.gif" width="10" height="14" align="absmiddle" style="margin-right:5px">Java Test Result Insert</div>
    <hr />
<form action="Result_Add" id="infoform" method="post" onsubmit="return CheckAllResultAdd()">
		<table>
			<tr>
				<td align="right">User ID:</td>
				<td align="left"><input type="text" 
					onFocus="this.style.backgroundColor='#FEFCD8'"
					onBlur="this.style.backgroundColor='#FFFFFF'" value="${param.id }" disabled="true"
					required="required"></td>
				<input type="hidden" name="test_userid" value="${param.id }">
			</tr>
			<tr>
				<td align="right">Name:</td>
				<td align="left"><input type="text" name="user_name"
					onFocus="this.style.backgroundColor='#FEFCD8'"
					onBlur="this.style.backgroundColor='#FFFFFF'" value="${param.name }" disabled="true"
					required="required"></td>
					<input type="hidden" name="user_name" value="${param.name }">
			</tr>
			<tr>
				<td align="right">Exam Date:</td>
				<td align="left"><input type="date" id="test_exam_date" name="test_exam_date"
					onFocus="this.style.backgroundColor='#FEFCD8'"
					onBlur="this.style.backgroundColor='#FFFFFF'" value=""
					onchange="DateCheck(this.id)"  maxlength="10"
					required="required"></td>
			</tr>
			<tr>
				<td align="right">Language:</td>
				<td align="left"><input type="text" id ="Language" name="test_language"
					onFocus="this.style.backgroundColor='#FEFCD8'"
					onBlur="this.style.backgroundColor='#FFFFFF'" value="" maxlength="20"
					onchange="EmptyCheck(this.id)"
					required="required"></td>
			</tr>
			<tr>
				<td align="right">Class:</td>
				<td align="left"><input type="text" id ="Class" name="test_class"
					onFocus="this.style.backgroundColor='#FEFCD8'"
					onBlur="this.style.backgroundColor='#FFFFFF'" value="" maxlength="20"
					onchange="EmptyCheck(this.id)"
					required="required"></td>
			</tr>
			<tr>
				<td align="right">Score:</td>
				<td align="left"><input type="text" id="test_score" name="test_score"
					onFocus="this.style.backgroundColor='#FEFCD8'"
					onBlur="this.style.backgroundColor='#FFFFFF'" value="" maxlength="3"
					onchange="TestResultCheck()"
					required="required"></td>
			</tr>
			<tr>
				<td align="right">Comment:</td>
				<td align="left"><input type="text" name="test_comment"
					onFocus="this.style.backgroundColor='#FEFCD8'"
					onBlur="this.style.backgroundColor='#FFFFFF'" maxlength="20" value=""></td>
			</tr>
						<tr>
				<td align="right">Update Time:</td>
				<td align="left"><input type="date" id="test_update_date" name="test_update_date"
					onFocus="this.style.backgroundColor='#FEFCD8'"
					onBlur="this.style.backgroundColor='#FFFFFF'" value="${date }"
					onchange="DateCheck(this.id)"  maxlength="10"
					required="required"></td>
			</tr>
		</table>
		<input type="submit" value="Add">
	</form>
	<c:if test="${requestScope.msg != null }">
			 	<font size=4 color="red">${requestScope.msg}
			
	</c:if>
	<script src="../JS/InputCheck.js"></script>
	
<ul id="new1" >
	  <li><a href="../index.html">home</a></li>
	  <li><a href="../Pages/LOGIN.jsp">login</a></li>
	  <li><a href="../Pages/navigation.html">menu</a></li>
	  <li><a href="../Pages/about.html">about</a></li>
</ul>

</body>
</html>