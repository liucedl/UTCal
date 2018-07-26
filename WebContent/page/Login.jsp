<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="com.user.bean.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title><s:text name="title_login"></s:text></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="Boundary Sign in Form template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- Custom Theme files -->
<link href="./css/logon.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- //Custom Theme files -->
<!-- web font -->
<link href='http://fonts.googleapis.com/css?family=Oxygen:400,700'
	rel='stylesheet' type='text/css'>
<!-- //web font -->
</head>
<body>
	<h1>用户登录</h1>
	<!--form-stars-here-->
	<div class="login-form w3-agile">
	<s:fielderror cssStyle="color:red"></s:fielderror>
		<h2>用户登陆</h2>
		<form action="loginAction!login.action" method="post" name="form1">
			<p>
				<s:text name="id"></s:text>
			</p>
			<input type="text" name="user.id" placeholder=" " />
			<p>
				<s:text name="password"></s:text>
			</p>
			<s:if test="message != null"> 
				<script  type="text/javascript">
						var msg = "${message}";
						alert(msg);
				</script>
			</s:if>
			<input type="password" name="user.password" placeholder=""/>
			<input type="submit"   value=<s:text name="submit"></s:text>>
			<input type="button"   value=<s:text name="regist"></s:text> onclick="window.location.href='./page/Register.jsp'">
		</form>
	</div>
	<!--//form-ends-here-->
	<!-- copyright -->
	<div class="copyright w3-agile">
		<p>IBM</p>
	</div>
</body>
</html>