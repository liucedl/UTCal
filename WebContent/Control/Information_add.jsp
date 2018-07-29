<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
 <%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    System.out.println(basePath);
    System.out.println(session.getAttribute("userid"));
    %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="IE=9" />
<title>UT Calculate System----Add</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/calendar.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/amazeui.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/timedropper.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/menu.css">
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
                <li><a href="javascript:loginOut();"><i class="i i-exit"></i><span class="hidden-xs">退出登陆</span></a></li>
             </ul>  
             <p class="navbar-text"><font color="00ffff">Welcome Back</font></p>  
         </div>  
     </nav>  
		<div id="div1"></div>
	<!--录入信息口-->
<div class="am-modal am-modal-no-btn  hd_info_modal" tabindex="-1" id="calendar-modal-1">
  <div class="am-modal-dialog radius">
	<div class="am-modal-hd">
	  <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
	</div>
	<div class="am-modal-bd">
	  <div class="am-margin-sm">
		<form action="<%=basePath%>/Control/Information_add" name="Add_Form" class="am-form am-form-inline" method="post">
		
		  <div class="hd-work-type">
			<div class="hd-work-block">
				<label class="hd-type-label" >工号:</label>
				<div class="am-form-group am-form-icon">
				<input name="hd_userid" type="text" class="am-form-field" value="${session.userid}" readonly="readonly"></div>
				<%-- <input type="text" name="hd_userid" class="am-form-field" value="${userid}" disabled="true"></div>  --%>
			</div> 
			<div class="stone"></div>
		</div> 
		  
		  <div class="hd-work-type">
			<div class="hd-work-block">
				<label class="hd-type-label" >类型:</label>
				<div class="hd-type-select">
					<select data-am-selected name="hd_type_option" class="am-u-sm-10" >
					  <option value="workday" selected>加班</option>
					  <option value="vocation">休假</option>
					</select>
				</div>
			</div>
			<div class="stone"></div>
		  </div>
		  
		 <div class="hd-work-date">
			  <div class="hd-work-block">
					<label class="am-form-label">日期:</label>
					<div class="am-form-group am-form-icon">
						<i class="am-icon-calendar"></i>
						<input name ="hd_date" id="hd-start-date" type="text" class="am-form-field" placeholder="日期" data-am-datepicker readonly required>
					</div>
			  </div>
		  </div>
		  
		  <div class="hd-work-date">
			  <div class="hd-work-block">
					<label  class="am-form-label">时数:</label>
					<div class="am-form-group am-form-icon">
						<input name="hd_hours" type="text" class="am-form-field" value="" maxlength="4"></div>
			  </div>
			  <div class="hd-work-block">
				  <label class="am-form-label">小时</label>
				  <div class="am-form-group am-form-icon">
					</div>
			  </div>
		  </div>
		  		
		  <div class="hd-work-btns">
			<button type="button" class="am-btn am-btn-secondary" onclick="hscheck()" id="calendar_confirm_btn">确定</button>
			<button type="button" class="am-btn am-btn-default" onClick="close_modal();">取消</button>
		  </div>
		  <div class="stone"></div>
		</form>
	  </div>
	</div>
  </div>
</div>
<script type="text/javascript">
	function hscheck(){
		if(Add_Form.hd_type_option.value =="workday"){			
			if(Add_Form.hd_hours.value ==""){
				alert("请输入加班时数！");	
			}
			else if(Add_Form.hd_hours.value > 16){
				alert("加班时数不得超过16小时!");	
			}
			else{
				Add_Form.submit();
			}
		}
		else if(Add_Form.hd_type_option.value =="vocation"){
			if(Add_Form.hd_hours.value ==""){
				alert("请输入休假时数！");	
			}
			else if(Add_Form.hd_hours.value > 8){
				alert("休假时数不得超过8小时!");	
			}
			else if(Add_Form.hd_hours.value % 4 != 0){
				alert("休假时数只可是4小时或8小时!");	
			}
			else{
				Add_Form.submit();
			}
		}		
		else{
			alert("请选择类型！");			
		} 
	}
	
	function loginOut() {
		alert("你确定要退出登陆吗？");
		location.replace("<%=basePath%>page/Logout.jsp"); //loginOut即是你所要转的退出登录的地址
	}
	
	</script>

<script src="<%=basePath%>js/bootstrap.min.js" charset="utf-8"></script>
<script src="<%=basePath%>js/jquery.min.js" charset="utf-8"></script>
<script src="<%=basePath%>js/amazeui.min.js" charset="utf-8"></script>
<script src="<%=basePath%>js/timedropper.js" charset="utf-8"></script>
<script src="<%=basePath%>js/calendar.js" charset="utf-8"></script>
<script type="text/javascript">
	/*日历*/
	loading_calendar("div1","en");
</script>

</body>
</html>