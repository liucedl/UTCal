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
										class="bgcolor_yellow2">工号：</td>
									<td align="left"><input name="hd_userid" value="${param.id }" 
										type="text" onfocus="this.style.backgroundColor='#FEFCD8'"
										onblur="this.style.backgroundColor='#FFFFFF'"
										onchange="DateCheck(this.id)" maxlength="6"
										onchange="UseridCheck()" size="40"
										style="background-color: rgb(255, 255, 255);"></td>
								</tr>

<!-- 		            <div class="hd-work-date">
			  <div class="hd-work-block">
					<label class="am-form-label">日期:</label>
					<div class="am-form-group am-form-icon">
						 <i class="am-icon-calendar"></i>
						<input name ="hd_date" id="hd-start-date" type="text" class="am-form-field" placeholder="日期" data-am-datepicker readonly required>
					</div>
			  </div>
		  </div> -->
								
								<tr>
									<td width="125" height="10" align="right"									
										class="bgcolor_yellow2">开始日期：</td>
									<td align="left">
									<input id="search_date_from"
										name="search_date_from" type="date" placeholder="yyyy-mm-dd" value="${fromDate }"
										onfocus="this.style.backgroundColor='#FEFCD8'"
										onblur="this.style.backgroundColor='#FFFFFF'"
										onchange="DateCheck(this.id)" maxlength="10" size="40"
										style="background-color: rgb(255, 255, 255);"></td>						
								</tr>
								<tr>
									<td width="125" height="10" align="right"
										class="bgcolor_yellow2">结束日期：</td>
									<td align="left"><input id="search_date_to" 
										name="search_date_to" type="date" placeholder="yyyy-mm-dd"value="${toDate }"
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
				<td align="center"><input type="submit" value=" 查询 "
					class="form_bt_px16" onclick="" type="button"
					align="absmiddle"></td>
			</tr>
			
		</table>
	</form>
	<c:if test="${requestScope.msg != null }">
		<font size=4 color="red">${requestScope.msg}</font>

	</c:if>
	<p></p>
	<hr align="left" size="1" class="bgcolor_gray2" width="85%">
	<p></p>

<table>
    <tbody>
     <tr>
        <td width="100" height="10" align="left" class="bgcolor_yellow2"></td>您本次查询结果如下。</tr>

    <tr>
        <td width="125" height="10" align="left" class="bgcolor_yellow2">总休假小时数 : </td>
        <td align="left">${requestScope.vocation }</td>
        <td width="125" height="10" align="left" class="bgcolor_yellow2">小时</td>
    </tr>
     <tr>
        <td width="125" height="10" align="left" class="bgcolor_yellow2">总加班小时数 : </td>
        <td align="left">${requestScope.ot }</td>
        <td width="125" height="10" align="left" class="bgcolor_yellow2">小时</td>
    </tr>
    <tr>
        <td width="125" height="10" align="left" class="bgcolor_yellow2">总工作小时数 : </td>
        <td align="left">${requestScope.workhours }</td>
        <td width="125" height="10" align="left" class="bgcolor_yellow2">小时</td>
    </tr>
     <tr>
        <td width="125" height="10" align="left" class="bgcolor_yellow2">法定假日天数 : </td>
        <td align="left">${requestScope.desi }</td>
        <td width="125" height="10" align="left" class="bgcolor_yellow2">天</td>
    </tr>    
    <tr>
        <td width="125" height="10" align="left" class="bgcolor_yellow2">当前UT: </td>
        <td align="left">${requestScope.ut }</td>
        <td width="125" height="10" align="left" class="bgcolor_yellow2">%</td>
    </tr>
    </tbody>
 </table>   

	<p></p>
	<hr align="left" size="1" class="bgcolor_gray2" width="85%">
	<p></p>
   


	<table>
		<tbody>
			<tr>
				<td>
					<%
          	pageContext.setAttribute("list_size",-1);
          	List<InformationDTO> information_result =  (ArrayList<InformationDTO>)request.getAttribute("result"); 
          	/* String current_ut = request.getAttribute("ut");  */
          	
          	if(information_result != null){
          	pageContext.setAttribute("list_size",information_result.size());
          	}
    	
          	%> <c:if test="${list_size > 0 }">
						<form name=result_form method="post" action="">
							<table cellpadding="4" cellspacing="1" border="0"
								class="table_border">
								<tbody>
      								<tr> <td width="100" height="10" align="left" class="bgcolor_yellow2"></td>已录入各系统的信息明细如下。如录入有误，请点击删除后重新录入！</tr>
									<tr class="bgcolor_green2">
										<td nowrap="" align="center" width="125" height="10"
											class="bgcolor_yellow2">工号</td>
										<td nowrap="" align="center" width="125" height="10"
											class="bgcolor_yellow2">日期</td>
										<td nowrap="" align="center" width="125" height="10"
											class="bgcolor_yellow2">时数</td>
										<td nowrap="" align="center" width="125" height="10"
											class="bgcolor_yellow2">类型</td>
										<td nowrap="" align="center" width="125" height="10"
											class="bgcolor_yellow2">删除</td>
									</tr>

									<c:forEach var="informationdto" items="${result }">
										<tr>
											<td align="center">${informationdto["userid"] }</td>
											<td align="center">${informationdto["date"] }</td>
											<td align="center">${informationdto["hours"] }</td>							
											<td align="center">${informationdto["type"] }</td>
											<td align="center"><input type="button"
												class="form_bt_px14" value="删除"
												onclick="doDelete('${informationdto["userid"] }','${informationdto["date"] }','${informationdto["type"] }')"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</c:if> <c:if test="${list_size == 0 }">
                
                 没有相关记录!
                                   
			</c:if>
				</td>
			</tr>
		</tbody>
	</table>

	<p></p>

	<script src="../js/button_check.js"></script>
	<script type="text/javascript" src="../js/InputCheck.js"></script>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/amazeui.min.js" charset="utf-8"></script>
	<script src="../js/timedropper.js" charset="utf-8"></script>
	<script src="../js/calendar.js" charset="utf-8"></script>
	<script type="text/javascript">	

</script>

</body>
</html>