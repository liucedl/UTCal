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
        <title><s:text name="title_login"></s:text></title>  
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">  
      </head>  
      <body>  
      <div><s:fielderror /></div>  
        <form action="getUserByIdAction!getUserList.action" method="post" name="form1">  
        <table align="center">  
            <tr>  
                <td><input type="button" value=<s:text name="infor"></s:text>></td>  
            </tr>  
        </table>  
        <s:actionerror/>  
        </form>  
      </body>  
    </html>  