<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Reskill System----User Search</title>
<link rel="stylesheet" type="text/css" href="../Css/mystyle.css">
</head>
<body>
	<!----------comn------------------>
	<nav id="comn"> <section>
	<h1>AFLAC</h1>
	</section> </nav>

	<!----------comn2-----welcome------------->
	<nav id="comn2"> <section>
	<p>&nbsp;&nbsp;Welcome to Aflac Learning System !</p>
	</section> </nav>

	<hr />
	<div class="text_l">
		<img src="../Img/sub_title.gif" width="10" height="14"
			align="absmiddle" style="margin-right: 5px">Search Conditions
	</div>
	<div class="text">&nbsp;</div>
	<form name="usercheck" method="post" action="User_Search">
		<table cellpadding="0" cellspacing="0" border="0">
			<tbody>
				<tr>
					<td>
						<table cellpadding="4" cellspacing="1" border="0" width="539"
							class="table_border">
							<tbody>
								<tr>
									<td width="125" height="10" align="right"
										class="bgcolor_yellow2">User ID</td>
									<td align="left"><input name="test_userid" value="${id}"
										type="text" onfocus="this.style.backgroundColor='#FEFCD8'"
										onblur="this.style.backgroundColor='#FFFFFF'" maxlength="6"
										size="40" style="background-color: rgb(255, 255, 255);"></td>
								</tr>

							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<table cellpadding="0" cellspacing="0" border="0" width="50%">
			<tr>
				<td align="center">
<!-- 			<input type="button" value=" Search "
					onclick="is_submit('user_search')" class="form_bt_px16"
					align="absmiddle"> 
				<input type="button" value=" Add "
					onclick="is_submit('user_add')" class="form_bt_px16"
					align="absmiddle"></td> -->
				<input type="submit" value=" Search "
					class="form_bt_px16"
					align="absmiddle"> 
			</tr>

		</table>
	</form>
	<c:if test="${requestScope.msg != null }">
		<font size=4 color="red">${requestScope.msg}</font>
	</c:if>
	<script src="../JS/button_check.js"></script>

	<ul id="new1">
	  <li><a href="../index.html">home</a></li>
	  <li><a href="../Pages/LOGIN.jsp">login</a></li>
	  <li><a href="../Pages/navigation.html">menu</a></li>
	  <li><a href="../Pages/about.html">about</a></li>
	</ul>

</body>
</html>