<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Reskill System----User Add</title>
<link rel="stylesheet" type="text/css" href="../Css/mystyle.css">
</head>
<body>
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
    <div class="text_l"><img src="../Img/sub_title.gif" width="10" height="14" align="absmiddle" style="margin-right:5px">User Add</div>
    <hr />
<form action="User_Add" name="User_Add_Form" method="post">
		<%
			if (request.getAttribute("id") ==null || request.getAttribute("id") =="" ){
				request.setAttribute("id", request.getParameter("id"));					
			}		
		%>
		<table>
			<tr>
				<td align="right">User ID:</td>
				<td align="left"><input type="text" 
					onFocus="this.style.backgroundColor='#FEFCD8'"
					onBlur="this.style.backgroundColor='#FFFFFF'" value="${id }" disabled="true"
					required="required"></td>
				<input type="hidden" name="user_id" value="${id }">
			</tr>
			<tr>
				<td align="right">Password:</td>
				<td align="left"><input type="password" name="user_password"
					onFocus="this.style.backgroundColor='#FEFCD8'"
					onBlur="this.style.backgroundColor='#FFFFFF'" value="" maxlength="20"
					required="required"></td>
			</tr>
			<tr>
				<td align="right">Re_Password:</td>
				<td align="left"><input type="password" name="user_Re_password"
					onFocus="this.style.backgroundColor='#FEFCD8'"
					onBlur="this.style.backgroundColor='#FFFFFF'" value="" maxlength="20"
					required="required"></td>
			</tr>
			<tr>
				<td align="right">Name:</td>
				<td align="left"><input type="text" id="user_name" name="user_name"
					onFocus="this.style.backgroundColor='#FEFCD8'"
					onBlur="this.style.backgroundColor='#FFFFFF'" value="" maxlength="20"
					required="required"></td>
			</tr>
			<tr>
				<td align="right">Authority:</td>
				<td align="left"><select name="user_authority">
				<option>&nbsp;</option>
				<option>ADMIN</option>
				<option>USER</option>
				</select>
				</td>
			</tr>

		</table>
		<input type="button" onclick="pwcheck()" value="Add">
	</form>
	<c:if test="${requestScope.msg != null }">
			 	<font size=4 color="red">${requestScope.msg}
			
	</c:if>
	
	<script type="text/javascript">
	function pwcheck(){
		if(User_Add_Form.user_password.value != User_Add_Form.user_Re_password.value){
			alert("The password do not match!");			
		}
		else if(User_Add_Form.user_password.value==""){
			alert("The password can not be empty!");			
		}
		else if(User_Add_Form.user_authority.value!="ADMIN" && User_Add_Form.user_authority.value!="USER"){
			alert("Please select authority!");			
		}
		else{
			User_Add_Form.submit();
		}
	}
	
	</script>
	
<ul id="new1" >
	  <li><a href="../index.html">home</a></li>
	  <li><a href="../Pages/LOGIN.jsp">login</a></li>
	  <li><a href="../Pages/navigation.html">menu</a></li>
	  <li><a href="../Pages/about.html">about</a></li>
</ul>
<script src="../JS/ItemCheck.js"></script>
</body>
</html>