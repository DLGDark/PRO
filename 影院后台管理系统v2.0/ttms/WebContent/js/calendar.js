/**
 * 选择年份的时候
 */
function year_click() {
	var html = "<option value='0'>-month-</option>";
	var year = document.getElementById("year").value;

	if (year != "0") {
		for ( var j = 1; j < 13; j++) {
			html += "<option>" + j + "</option>";
		}
	}

	document.getElementById("month").innerHTML = html;
	document.getElementById("day").innerHTML = "<option value='0'>-day-</option>";
	//得到该用户的年龄
	getAge(year);
}

/**
 * 选择月份的时候
 */
function month_click() {
	var obj = document.getElementById("month");
	if (obj.value == "0") {
		document.getElementById("day").innerHTML = "<option value='0'>-day-</option>";
		return;
	}
	var html = "<option value='0'>-day-</option>";
	var year = document.getElementById("year").value;
	var day = 30;
	var month = parseInt(obj.value);
	switch (month) {
	case 1:
	case 3:
	case 5:
	case 7:
	case 8:
	case 10:
	case 12:
		day = 31;
		break;
	}
	if (month == 2) {
		if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
			day = 29;
		} else {
			day = 28;
		}
	}
	for ( var k = 1; k <= day; k++) {
		html += "<option>" + k + "</option>";
	}

	document.getElementById("day").innerHTML = html;
}

/**
 * 得到当前用户的年龄
 */
function getAge(year){
	if (year!=0) {
		var date = new Date();
		var current_year = date.getUTCFullYear();
		var age = current_year-year;
		document.getElementById("age").value=age;
	}else{
		document.getElementById("age").value="";
	}
}
