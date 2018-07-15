<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="DTO.InformationDTO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UT Calculate System----Search</title>
<!--  <link rel="stylesheet" type="text/css" href="../Css/mystyle2.css"> -->
</head>
<body>
	<form name="Search_info" method="post" action="Information_show">
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
									<td align="left"><input name="hd_userid" value="${id }"
										type="text" onfocus="this.style.backgroundColor='#FEFCD8'"
										onblur="this.style.backgroundColor='#FFFFFF'"
										onchange="DateCheck(this.id)" maxlength="6"
										onchange="UseridCheck()" size="40"
										style="background-color: rgb(255, 255, 255);"></td>
								</tr>
								
								<tr>
									<td width="125" height="10" align="right"
										class="bgcolor_yellow2">From</td>
									<td align="left"><input id="search_date_from"
										name="search_date_from" type="date"
										onfocus="this.style.backgroundColor='#FEFCD8'"
										onblur="this.style.backgroundColor='#FFFFFF'"
										onchange="DateCheck(this.id)" maxlength="10" size="40"
										style="background-color: rgb(255, 255, 255);"></td>

								</tr>
								<tr>
									<td width="125" height="10" align="right"
										class="bgcolor_yellow2">To</td>
									<td align="left"><input id="search_date_to"
										name="search_date_to" type="date"
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
					class="form_bt_px16" onclick="searchFunc()" type="button"
					align="absmiddle"></td>
			</tr>
		</table>
	</form>
	<c:if test="${requestScope.msg != null }">
		<font size=4 color="red">${requestScope.msg}</font>

	</c:if>
	<p></p>
	<hr align="left" size="1" class="bgcolor_gray2" width="80%">
	<p></p>

<table>
    <tbody>
    <tr>
        <td width="125" height="10" align="left" class="bgcolor_yellow2">User ID : </td>
        <td align="left">${requestScope.id }</td>
    </tr>
    <tr>
        <td width="125" height="10" align="left" class="bgcolor_yellow2">Name : </td>
        <td align="left">${requestScope.name }</td>
    </tr>

    </tbody>
    
 <form name=add method="post" action="Information_add.jsp" >
<table cellpadding="0" cellspacing="0" border="0" width="50%">
    <tr>
       	<tr>
            <input type="hidden" name="id" type="text" value ="${requestScope.id }">
            <input type="hidden" name="name" type="text" value ="${requestScope.name }">
        </tr>
          <input type="submit" value=" Add " class="form_bt_px16"
                 align="absmiddle" >
    </tr>
</table>
</form>

   
</table>

	<table>
		<tbody>
			<tr>
				<td>
					<%
          	pageContext.setAttribute("list_size",-1);
          	List<InformationDTO> information_result =  (ArrayList<InformationDTO>)request.getAttribute("result"); 
          	//int list_size = test_result.size();
          	if(information_result != null){
          	pageContext.setAttribute("list_size",information_result.size());
          	}
          	%> <c:if test="${list_size > 0 }">
						<form name=result_form method="post" action="">
							<table cellpadding="4" cellspacing="1" border="0"
								class="table_border">
								<tbody>
									<tr class="bgcolor_green2">
										<td nowrap="" align="center" width="125" height="10"
											class="bgcolor_yellow2">ID</td>
										<td nowrap="" align="center" width="125" height="10"
											class="bgcolor_yellow2">date</td>
										<td nowrap="" align="center" width="125" height="10"
											class="bgcolor_yellow2">hours</td>
										<td nowrap="" align="center" width="125" height="10"
											class="bgcolor_yellow2">type</td>
										<td nowrap="" align="center" width="125" height="10"
											class="bgcolor_yellow2">Update</td>
										<td nowrap="" align="center" width="125" height="10"
											class="bgcolor_yellow2">Delete</td>
									</tr>

									<c:forEach var="testdto" items="${result }">
										<tr>
											<td align="center">${informationdto["userid"] }</td>
											<td align="center">${informationdto["date"] }</td>
											<td align="center">${informationdto["hours"] }</td>
											<td align="center">${informationdto["type"] }</td>
											<td align="center"><input type="button"
												class="form_bt_px14" value="Update"
												onclick="doUpdate('${id}','${informationdto["date"] }','${informationdto["hours"] }','${informationdto["type"] }')"></td>
											<td align="center"><input type="button"
												class="form_bt_px14" value="Delete"
												onclick="doDelete('${id}','${informationdto["date"] }','${informationdto["type"] }')"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</c:if> <c:if test="${list_size == 0 }">
                
                 There is no result!
                                   
			</c:if>
				</td>
			</tr>
		</tbody>
	</table>

	<p></p>

	<script type="text/javascript" src="../JS/InputCheck.js"></script>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/amazeui.min.js" charset="utf-8"></script>
	<script src="../js/timedropper.js" charset="utf-8"></script>
	<script src="../js/calendar.js" charset="utf-8"></script>
	<script type="text/javascript">
function searchFunc()
{
	if(Search_info.hd_userid.value ==""){
		alert("请输入userid！");
	}
	else if(Search_info.search_date_from.value ==""){
		alert("请输入fromDate！");	
	}
	else if(Search_info.search_date_to.value ==""){
		alert("请输入toDate！");	
	}		
	else{
		Search_info.submit();
	} 
}
</script>
	<ul id="new1">
		<li><a href="../index.html">home</a></li>
		<li><a href="../Pages/LOGIN.jsp">login</a></li>
		<li><a href="../Pages/navigation.html">menu</a></li>

</body>
</html>