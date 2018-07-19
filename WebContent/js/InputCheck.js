
/**
 * 
 */
function UseridCheck() {

	var r = new RegExp(/^[0-9a-zA-Z]+$/);
	if (r.test(document.forms[0].hd_userid.value)) {
		return true;
	} else {
		alert("Please input character or number");
		document.forms[0].hd_userid.focus();
		return false;
	}
}

function DateCheck(id) {
	if(id == "search_date_from" || id == "search_date_to" ){
		if (document.getElementById(id).value == ""){
				return true;
		}								
	}
	
	//var r = new RegExp(/^\d{4}-(0?[1-9]|1[0-2])-(0?[1-9]|[1-2]\d|3[0-1])$/);
	var r = new RegExp(/\d{4}-\d{2}-\d{2}/);
	if (r.test(document.getElementById(id).value)) {

		var arr = document.getElementById(id).value.split("-");

		intYear = parseInt(arr[0], 10);
		intMonth = parseInt(arr[1], 10);
		intDay = parseInt(arr[2], 10);

		if ((intMonth == 1 || intMonth == 3 || intMonth == 5 || intMonth == 7
				|| intMonth == 8 || intMonth == 10 || intMonth == 12)
				&& intDay > 31) {
			alert("Input date error");
			return false;

			// ?????4,6,9,11
		} else {
			if ((intMonth == 4 || intMonth == 6 || intMonth == 9 || intMonth == 11)
					&& intDay > 30) {
				alert("Input date error");
				return false;

				// ?????2
			} else {
				if (intMonth == 2) {
					// ?????
					if (intYear % 100 == 0 && intYear % 400 || intYear % 100 && intYear % 4 == 0) {
						if(intDay > 29){
						alert("Input date error");
						return false;}
					} else {
						if (intDay > 28) {
							alert("Input date error");
							return false;
						}
					}
				}
			}
		}
	} else {
		alert("Please input YYYY-MM-DD");
		document.getElementById(id).focus();
		return false;
	}
}

