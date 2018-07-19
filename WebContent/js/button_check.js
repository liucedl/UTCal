	function doUpdate(id,date,type) {
		result_form.action = "Information_update.jsp?id="+id+"&date="+date+"&type="+type+"";
		result_form.submit();
			
	}
	
	function doDelete(id,date,type) {
		var type_en;
		switch(type){
		case "加班":type_en="workday";
					break;
		
		case "休假":type_en="vocation";
					break;
		}
		result_form.action = "Information_delete.jsp?id="+id+"&date="+date+"&type="+type_en+"";
		result_form.submit();
			
	}