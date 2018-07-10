﻿<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="IE=9" />
<title>jQuery全年日历工作考勤表代码amazeui.js插件</title>
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/calendar.css">
<link rel="stylesheet" href="css/amazeui.min.css">
<link rel="stylesheet" href="css/timedropper.css">
</head>
<body><script src="/demos/googlegg.js"></script>
<div id="div1"></div>

<!--录入信息口-->
<div class="am-modal am-modal-no-btn  hd_info_modal" tabindex="-1" id="calendar-modal-1">
  <div class="am-modal-dialog radius">
	<div class="am-modal-hd">新增例外
	  <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
	</div>
	<div class="am-modal-bd">
	  <div class="am-margin-sm">
		<form action="" class="am-form am-form-inline">
		  <div class="hd-work-type">
			<div class="hd-work-block">
				<label class="hd-type-label" >类型:</label>
				<div class="hd-type-select">
					<select data-am-selected class="am-u-sm-10" id="hd-type-option">
					  <option value="workday" selected>工作时间</option>
					  <option value="freeday" >非工作日</option>
					  <option value="lawday" >法定假日</option>
					  <option value="tradeday" >调休日</option>
					</select>
				</div>
			</div>
			<div class="stone"></div>
			
		  </div>
		 <div class="hd-work-date">
			  <div class="hd-work-block">
					<label for="hd-start-date" class="am-form-label">时间:</label>
					<div class="am-form-group am-form-icon">
						<i class="am-icon-calendar"></i>
						<input id="hd-start-date" type="text" class="am-form-field" placeholder="开始日期" data-am-datepicker readonly required>
					</div>
			  </div>
			  <div class="hd-work-block">
				  <label for="hd-end-date" class="am-form-label">至</label>
				  <div class="am-form-group am-form-icon">
					<i class="am-icon-calendar"></i>
					<input id="hd-end-date" type="text" class="am-form-field" placeholder="结束日期" data-am-datepicker readonly required>
				  </div>
			  </div>
		  </div>
		  <div class="hd-work-btns">
			<button type="button" class="am-btn am-btn-secondary" id="calendar_confirm_btn">添加</button>
			<button type="button" class="am-btn am-btn-default" onClick="close_modal();">取消</button>
		  </div>
		  <div class="stone"></div>
		  <div class="stone1"> <input type="submit" value=<s:text name="submit"></s:text> > </div>
		</form>
	  </div>
	</div>
  </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/amazeui.min.js" charset="utf-8"></script>
<script src="js/timedropper.js" charset="utf-8"></script>
<script src="js/calendar.js" charset="utf-8"></script>
<script type="text/javascript">
	/*日历*/
	loading_calendar("div1","en");
</script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>适用浏览器：360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗. 不支持IE8及以下浏览器。</p>
<p>来源：<a href="http://www.lanrenzhijia.com/" target="_blank">懒人素材</a></p>
</div>
</body>
</html>
