/*
 * User_Add.jsp Check
 * */

function NameCheck() {
	var r = new RegExp(/^[A-Za-z]+$/);

	if (r.test(document.forms[0].user_name.value)) {
		return true;
	} else {
		alert("Please input character type");
		document.forms[0].user_name.focus();
		return false;
	}
}

/**
 * 
 */
function changeStyle1(id) {
	document.getElementById(id).style.backgroundColor = "#FEFCD8"
}
function changeStyle2(id) {
	document.getElementById(id).style.backgroundColor = "#FFFFFF"
}

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

/*		var date = new Date();
		var mon = date.getMonth() + 1;
		var day = date.getDate();
		var nowDay = date.getFullYear() + "-" + (mon < 10 ? "0" + mon : mon)
				+ "-" + (day < 10 ? "0" + day : day);
		if (document.getElementById(id).value > nowDay) {
			alert("Cannot exceed the current date");
			document.getElementById(id).focus();
			return false;
		} else {
			return true;
		}*/

	} else {
		alert("Please input YYYY-MM-DD");
		document.getElementById(id).focus();
		return false;
	}
}

function EmptyCheck(id){
	if (document.getElementById(id).value == ""){
		alert(id + "is required!")
		return false;
}
	
}
function TestResultCheck() {
	var r = new RegExp(/^[0-9]*$/);
	if (r.test(document.getElementById("test_score").value)) {
		if (document.getElementById("test_score").value <= 100) {
			return true;
		} else {
			alert("No more than 100");
			document.getElementById("test_score").focus();
			return false;
		}
	} else {
		alert("Please input number type");
		document.getElementById("test_score").focus();
		return false;
	}
}

function DateCompare() {
	if (document.getElementById("search_date_from").value > document
			.getElementById("search_date_to").value) {
		alert("From date can not exceed To date");
		return false;
	}

}

function CheckAllNumberSearch() {
	var check = DateCheck("search_date_from") && DateCheck("search_date_to");
	return check;
}

function CheckAllResultAdd() {
	var check = DateCheck("search_date") && EmptyCheck("Language") && EmptyCheck("Class") && TestResultCheck() && DateCheck("test_update_date");
	return check;
}
/*function CheckAll(id) {
	var check = UseridCheck()  && DateCheck(id);
	return check;
}*/