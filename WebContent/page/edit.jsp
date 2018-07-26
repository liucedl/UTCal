
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="com.user.bean.User"%>
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title><s:text name="title_infor"></s:text></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>用户信息一览</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css">
<style>
	body, html {
		position: absolute;
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
        background-image: url("<%=basePath%>images/background.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        background-attachment:fixed;      
		margin: 0;
		padding: 0;
	}
</style>
</head>
<body>
	<nav class = "navbar navbar-default  navbar-inverse" role = "navigation">  
        <div class="navbar-header">             
            <a class="navbar-brand"><font color="00ffff">IBM</font></a>  
        </div>          
        <div>  
            <ul class="nav navbar-nav">  
                <li class="active"><a href="<%=basePath%>Control/Information_add.jsp">信息录入</a></li>  
                 <li><a href="<%=basePath%>Control/Information_show.jsp">信息查询</a></li>  
                <li><a href="getUserByIdAction!getUserById.action">用户信息</a></li>  
             </ul>  
             <p class="navbar-text"><font color="00ffff">Welcome Back</font></p>  
         </div>  
     </nav>  
     <
	<form action="updateByIdAction!updateById.action" method="post"
		name="form1">
		<table cellpadding="4" cellspacing="1" border="0" width="539"
			class="table_border">
			<tbody>
				<tr>
					<td>id:</td>
					<td><input type="text" value="${userid}" name="user.id"
						readonly></td>
				</tr>
				<tr>
					<td>姓名:</td>
					<td><input type="text" name="user.UserName" value="${names}"></td>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input type="text" name="user.password"
						value="${password}"></td>
				</tr>
				<tr>
					<td><label>性别</label></td>
					<td><input type="radio" id="user.sex" name="user.sex"
						${sex=='1'?'checked':''} value="男"><label
						for="flat-radio-1" class="">男</label>
					<input type="radio" id="user.sex" name="user.sex"
						${sex=='0'?'checked':''} value="女"> <label
						for="flat-radio-1" class="">女</label></td>
				</tr>
				<tr>
					<td>部门:</td>
					<td><input type="text" name="user.dept" value="${dept}"></td>
				</tr>
				<tr>
					<td>项目:</td>
					<td><input type="text" name="user.project" value="${project}"></td>
				</tr>
				<tr>
					<td>项目经理:</td>
					<td><input type="text" name="user.Manager_id"
						value="${managerId}"></td>
				</tr>
				<tr>
					<td><input type="submit" value="提交"></td>

				</tr>

			</tbody>
		</table>
	</form>

</body>
</html>