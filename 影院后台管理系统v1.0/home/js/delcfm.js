function delcfm(url) {  
      $('#url').val(url);					//给会话中的隐藏属性URL赋值  
      $('#delcfmModel').modal();  
}  
function urlSubmit(){  
   var url=$.trim($("#url").val());			//获取会话中的隐藏属性URL  
   window.location.href=url;    
}