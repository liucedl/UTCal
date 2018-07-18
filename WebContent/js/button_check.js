	function is_submit(value) {
		switch (value) {
        case "update"://Information_show.jsp
        	document.result_form.action = "Information_update";
        	result_form.submit();
        case "delete":
        	document.result_form.action = "Information_delete";
        	result_form.submit();
		default:
			break;
		}

	}
	
	function doUpdate(id,date,type) {
		result_form.action = "Information_update.jsp?id="+id+"&date="+date+"&type="+type+"";
		result_form.submit();
			
	}
	
	function doDelete(id,date,type) {
		result_form.action = "Information_delete.jsp?id="+id+"&date="+date+"&type="+type+"";
		result_form.submit();
			
	}