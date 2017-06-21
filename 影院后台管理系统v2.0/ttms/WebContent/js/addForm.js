$(document).ready(function(){
	function getObjectURL(file) {
		var url = null ; 
		if (window.createObjectURL!=undefined) { // basic
			url = window.createObjectURL(file) ;
		} else if (window.URL!=undefined) { // mozilla(firefox)
			url = window.URL.createObjectURL(file) ;
		} else if (window.webkitURL!=undefined) { // webkit or chrome
			url = window.webkitURL.createObjectURL(file) ;
		}
		return url ;
	}
	$("#imagefile").change(function(){

		var f = document.getElementById("imagefile").value;
		    
        if (!/\.(jpg|jpeg|JPG)$/.test(f)) {
            alert("图片类型必须是jpg或jpeg格式");
            $("#imagefile").val("");
            return false;
        }else{
   		    var imgSize=this.files[0].size;
   		    var selfSize=parseInt(imgSize/1024);
   		    if(imgSize>1024*100){
   		        alert('此图片大小为'+selfSize+'KB,图片大小要求在100KB以内');
   		        $("#imagefile").val("");
   		        return false;
   		    }else{
   		    	var objUrl = getObjectURL(this.files[0]) ;
   		    	console.log("objUrl = "+objUrl) ;
   		    	if (objUrl) {
   		    		$("#imgsrc").attr("src", objUrl) ;
   		    	}
   		    }
        }
	});
});