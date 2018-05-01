<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  "http://www.w3.org/TR/html4/loose.dtd">  
<%@ page language="java" contentType="text/html; charset=utf-8"  
    pageEncoding="utf-8"%>  
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path;  
%>  
<%@taglib prefix="s" uri="/struts-tags"%>  
<html>  
        <STYLE type="text/css">  
            .disabledTd{  
                background-color:gray;  
            }  
            .weekendTd{  
                background-color:yellow;  
            }  
            .holidayTd{  
                background-color:green;  
            }  
            .generalTd{  
                background-color:white;  
            }  
            #calTbl{  
                font-family: verdana,arial,sans-serif;  
                font-size:13px;  
                color:#333333;  
                border-width: 1px;  
                border-color: #a9c6c9;  
                border-collapse: collapse;  
            }  
            #calTbl th{  
                border-width: 1px;  
                padding: 4px;  
                border-style: solid;  
                border-color: #a9c6c9;  
                background-color:olive;  
            }  
            #calTbl td {  
                border-width: 1px;  
                padding: 4px;  
                border-style: solid;  
                border-color: #a9c6c9;  
            }  
            .rowHeader{  
                background-color:olive;  
            }  
        </STYLE>  
          
    <head>  
      
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
        <title>Login page</title>  
        <link rel="stylesheet" type="text/css" media="screen"  
            href="<%=basePath%>/html/styles/styles.css" />  
        <script src="<%=basePath%>/html/scripts/common.js"  
            type="text/javascript"></script>  
        <script src="<%=basePath%>/html/scripts/jquery.js"  
            type="text/javascript"></script>  
        <script src="<%=basePath%>/html/scripts/jquery.json-2.2.min.js"  
            type="text/javascript"></script>  
        <script src="<%=basePath%>/html/scripts/jquery.ui.custom.js"  
            type="text/javascript"></script>  
        <script src="<%=basePath%>/html/scripts/script.js"  
            type="text/javascript"></script>  
            <script type="text/javascript">  
            $(document).ready(function(){  
                var checkType = 0;  
                $.post('calendar',{},function(data,status)  
                {  
                    if(data != null && data.html != null && data.html != ""){  
                        $("#calTbl").html( data.html);  
                        $("#calTbl td").click(tdClick);  
                        $("#checkType input").click(typeCheck);  
                    }  
                }).error(function(){  
                      
                });  
  
                var tdClick = function(){  
                  
                    if(this.className == 'rowHeader' || this.className == 'disabledTd'){  
                        return;  
                    }  
                    if(checkType != null && checkType != "" && checkType != 0){  
                        if(checkType == 1){                   
                            this.style.backgroundColor="white";  
                        }else if(checkType == 2){                             
                            this.style.backgroundColor="yellow";  
                        }else if(checkType == 3){                             
                            this.style.backgroundColor="green";  
                        }  
                    }  
                };  
                var typeCheck = function(){  
                    checkType = this.value;  
                };  
              
              
            });  
              
        </script>  
    </head>  
    <body>  
        <div id="calendar">  
            <table id="calTbl"></table>           
        </div>  
        <div>  
            <table id="checkType">  
                <tr>  
                    <td style="background-color: white;"> <input type="radio" name="type" value="1"> </td>  
                    <td style="background-color: yellow;"><input type="radio" name="type" value="2"></td>  
                    <td style="background-color: green;"> <input type="radio" name="type" value="3"></td>  
                </tr>  
            </table>  
        </div>          
    </body>  
</html>  