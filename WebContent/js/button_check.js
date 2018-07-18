	function doUpdate(id,date,type) {
		result_form.action = "Information_update.jsp?id="+id+"&date="+date+"&type="+type+"";
		result_form.submit();
			
	}
	
	function doDelete(id,date,type) {
		result_form.action = "Information_delete.jsp?id="+id+"&date="+date+"&type="+type+"";
		result_form.submit();
			
	}