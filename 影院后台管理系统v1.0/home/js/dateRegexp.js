function dateRex(obj,str){

	var datetxt=obj.value.trim();
	var hint=document.getElementById('hintdate');
	var hit=document.getElementById('hintde');

	var tip;

	if(str===0){
		tip=hint;
	}else{
		tip=hit;
	}

	var reg=/^\d{4}-\d{2}-\d{2}$/;
	if(!reg.test(datetxt)){	

		tip.innerHTML="请输入正确的日期格式";	
		obj.value="";
		obj.focus();
		return false;
	}else{
		var curdate=new Date();
		var year=curdate.getFullYear();
		var month=curdate.getMonth() + 1;
		var day=curdate.getDate();

		var arr=datetxt.split('-');
		if(parseInt(arr[0])>=year && parseInt(arr[1])>=month && parseInt(arr[2])>=day+1){
			tip.innerHTML="";
			return true;
		}else{
			tip.innerHTML="时间不能小于当前时间";	
			obj.value="";
			obj.focus();
			return false;
		}		
	}	
}