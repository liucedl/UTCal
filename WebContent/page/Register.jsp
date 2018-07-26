 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
    <%@ taglib uri="/struts-tags" prefix="s" %>  
    <%@ page import="com.user.bean.User" %> 
    <%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">  
<title><s:text name="title_regist"></s:text></title>  
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">  
<link href="./css/logon.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<!-- web font -->
<link href='http://fonts.googleapis.com/css?family=Oxygen:400,700'rel='stylesheet' type='text/css'>
</head>
<body>
<h1>用户注册</h1>
	<!--form-stars-here-->
	<div class="login-form w3-agile">
		<s:fielderror cssStyle="color:red"></s:fielderror>
		<h2>用户注册</h2>
		<form action="registAction!regist.action" method="post" name="form1">
			<p>
				<s:text name="id"></s:text>
			</p>
			<input type="text" name="user.id" placeholder=" " />
			<p>
				<s:text name="password"></s:text>
			</p>
			<input type="password" name="user.password" placeholder=""/>
			<input type="submit" value=<s:text name="regist"></s:text>>
            <input type="reset" value=<s:text name="reset"></s:text>>
		</form>
	</div>
	<!--//form-ends-here-->
	<!-- copyright -->
	<div class="copyright w3-agile">
		<p>IBM</p>
	</div>
</body>
</html>