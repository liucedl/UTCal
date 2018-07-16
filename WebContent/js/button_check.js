	function is_submit(value) {
		switch (value) {
        case "update"://Information_show.jsp
        	document.Result_mod.action = "Information_update";
        	Result_mod.submit();
        case "delete":
        	document.Result_mod.action = "Information_delete";
        	Result_mod.submit();
		default:
			break;
		}

	}
	
	function doUpdate(id,date) {
		information_form.action = "Information_update.jsp?id="+id+"&date="+date+"";
		information_form.submit();
			
	}
	
	function doDelete(id,data) {
		information.action = "Information_delete.jsp?id="+id+"&date="+date+"";
		information.submit();
			
	}