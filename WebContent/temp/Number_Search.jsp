<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Java Reskill System----Search</title>

<!----------lixiuhong-----add  start------------->
<link rel="stylesheet" type="text/css" href="../Css/mystyle.css">
<!----------lixiuhong-----add  end------------->

</head>
<body>

	<!----------lixiuhong-----add  start------------->
	<!----------comn------------------>
	<nav id="comn"> <section>
	<h1>AFLAC</h1>
	</section> </nav>

	<!----------comn2-----welcome------------->
	<nav id="comn2"> <section>
	<p>&nbsp;&nbsp;Welcome to Aflac Learning System !</p>
	</section> </nav>
	<!----------lixiuhong-----add  end------------->
	<hr />
	<div class="text_l">
		<img src="../Img/sub_title.gif" width="10" height="14"
			align="absmiddle" style="margin-right: 5px">Search Conditions
	</div>
	<hr />
	<div class="text">&nbsp;</div>
	<form name=search method="post" action="Result_Search" onsubmit="return CheckAllNumberSearch()">
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
									<td align="left"><input name="test_userid" value="${id }"
										type="text" onfocus="this.style.backgroundColor='#FEFCD8'"
										onblur="this.style.backgroundColor='#FFFFFF'"
									 	maxlength="6"
										onchange="UseridCheck()" size="40"
										style="background-color: rgb(255, 255, 255);"></td>
								</tr>
								<tr>
									<td width="125" height="10" align="right"
										class="bgcolor_yellow2">From</td>
									<td align="left"><input id="test_exam_date_from"
										name="test_exam_date_from" type="date"
										onfocus="this.style.backgroundColor='#FEFCD8'"
										onblur="this.style.backgroundColor='#FFFFFF'"
										onchange="DateCheck(this.id)" maxlength="10" size="40"
										style="background-color: rgb(255, 255, 255);"></td>

								</tr>
								<tr>
									<td width="125" height="10" align="right"
										class="bgcolor_yellow2">To</td>
									<td align="left"><input id="test_exam_date_to"
										name="test_exam_date_to" type="date"
										onfocus="this.style.backgroundColor='#FEFCD8'"
										onblur="this.style.backgroundColor='#FFFFFF'" 
										onchange="DateCheck(this.id)" maxlength="10" size="40"
										style="background-color: rgb(255, 255, 255);"></td>
								</tr>

							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<table cellpadding="0" cellspacing="0" border="0" width="50%">
			<tr>
				<td align="center"><input type="submit" value=" Search "
					class="form_bt_px16" align="absmiddle"></td>
			</tr>
		</table>
	</form>
	<c:if test="${requestScope.msg != null }">
		<font size=4 color="red">${requestScope.msg}</font>

	</c:if>

	<!----------lixiuhong-----add  start------------->
	<ul id="new1">
	  <li><a href="../index.html">home</a></li>
	  <li><a href="../Pages/LOGIN.jsp">login</a></li>
	  <li><a href="../Pages/navigation.html">menu</a></li>
	  <li><a href="../Pages/about.html">about</a></li>

	</ul>
	<!----------lixiuhong-----add  end------------->


 <script type="text/javascript" src="../JS/InputCheck.js"></script>
</body>
</html>