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
        <title><s:text name="title_regist"></s:text></title>  
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">  
      </head>  
      <body>  
        <form action="registAction!regist.action" method="post" name="form1">  
        <table align="center">  
            <tr>  
                <td><s:text name="id"></s:text></td>  
                <td><input type="text" name="user.id"></td>  
            </tr>  
            <tr>  
                <td><s:text name="password"></s:text></td>  
                <td><input type="password" name="user.password"></td>  
            </tr>  
            <tr>  
                <td>普通用户：<input type="radio" name="user.authority" value="0"></td>  
                <td>超级用户：<input type="radio" name="user.authority" value="1"> </td>  
            </tr>  
            <tr>  
                <td><input type="submit" value=<s:text name="regist"></s:text>></td>  
                <td><input type="reset" value=<s:text name="reset"></s:text>></td>  
            </tr>  
        </table>  
        <s:actionerror/>  
        </form>  
      </body>  
    </html>  