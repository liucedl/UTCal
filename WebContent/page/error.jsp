    <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
    <%@ taglib uri="/struts-tags" prefix="s" %>  
    <%@ page import="com.user.bean.User" %>  
    <%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    %>  
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
    <html>  
      <head>  
        <base href="<%=basePath%>">  
        <title><s:text name="login_error"></s:text></title>  
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">  
      </head>  
      <body>  
      <div>登录错误</div>  
      </body>  
    </html>  