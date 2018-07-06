<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="IE=9" />
<title>UT Calculate System----Add</title>
<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
<link rel="stylesheet" href="../css/calendar.css">
<link rel="stylesheet" href="../css/amazeui.min.css">
<link rel="stylesheet" href="../css/timedropper.css">
</head>
<body><script src="/demos/googlegg.js"></script>
<div id="div1"></div>
<!--录入信息口-->
<div class="am-modal am-modal-no-btn  hd_info_modal" tabindex="-1" id="calendar-modal-1">
  <div class="am-modal-dialog radius">
	<div class="am-modal-hd">信息登陆
	  <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
	</div>
	<div class="am-modal-bd">
	  <div class="am-margin-sm">
		<form action="Information_add" name="Add_Form" class="am-form am-form-inline" method="post">
		
		  <div class="hd-work-type">
			<div class="hd-work-block">
				<label class="hd-type-label" >工号:</label>
				<div class="am-form-group am-form-icon">
				<!-- <input name="hd_userid" type="text" class="am-form-field" value=""></div> -->
				<input type="text" name="hd_userid" class="am-form-field" value="${param.id }" disabled="true"></div> 
			</div> 
			<div class="stone"></div>
		</div> 
		  
		  <div class="hd-work-type">
			<div class="hd-work-block">
				<label class="hd-type-label" >类型:</label>
				<div class="hd-type-select">
					<select data-am-selected name="hd_type_option" class="am-u-sm-10" >
					  <option value="workday" selected>加班</option>
					  <option value="tradeday">休假</option>
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
		}
		else if(Add_Form.hd_type_option.value =="tradeday"){
			if(Add_Form.hd_hours.value ==""){
				alert("请输入休假时数！");	
			}
			else if(Add_Form.hd_hours.value > 8){
				alert("休假时数不得超过8小时!");	
			}
		}		
		else{
			Add_Form.submit();
		} 
	}
	
	</script>

<script src="../js/jquery.min.js"></script>
<script src="../js/amazeui.min.js" charset="utf-8"></script>
<script src="../js/timedropper.js" charset="utf-8"></script>
<script src="../js/calendar.js" charset="utf-8"></script>
<script type="text/javascript">
	/*日历*/
	loading_calendar("div1","en");
</script>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>Browser:360,FireFox,Chrome,Safari,Opera,Maxthon,Sogou,Theworld.IE8 version and below is not available.</p>
<!-- <p>from：<a href="http://www.lanrenzhijia.com/" target="_blank">懒人素材</a></p> -->
</div>

</body>
</html>