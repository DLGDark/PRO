/*js onload加载页面函数*/
function addLoadEvent(func){
	var oldonload=window.onload;
	if(typeof window.onload!='function'){
		window.onload=func;
	}else{
		window.onload=function(){
			oldonload();
			func();
		}
	}
}
/*通过封装 getElementsByClassName 来处理兼容性*/
function getElementsByClassName(className){
	var results=[];
	var tags=document.getElementsByTagName('*');
	for(var item in tags){
		if(tags[item].nodeType==1){
			if(tags[item].getAttribute('class')==className){
				results.push(tags[item]);
			}
		}
	}
	return results;
}
//给一个元素添加事件
function addHander(element,type,hander){
	if(element.addEventListener){
		element.addEventListener(type,hander,false);	/*非IE*/
	}else if(element.attachEvent){
		element.attachEvent("on"+type,hander);		/*IE*/
	}else{
		element["on"+type]=hander;
	}
}

/*编辑相关操作*/
function edit(){
	var ed=document.getElementById('edit-operation');
	var hd=document.getElementById('hidde-btn');
	var del=document.getElementById('del');
	var clss=getElementsByClassName("checkbox-img");
	var len=clss.length;

	ed.onclick=function(){
		if(ed.value==="编辑"){
			ed.value="取消";
			hd.style.display="block";
			del.disabled="disabled";

			for(var i=0;i<len;i++){
				var ip=clss[i].getElementsByTagName('input')[0];
				ip.disabled=false;

				clss[i].className="";
				clss[i].className="checkbox-img nochoice";
			}
		}else{
			ed.value="编辑";
			hd.style.display="none";

			for(var i=0;i<len;i++){
				var ip=clss[i].getElementsByTagName('input')[0];
				ip.checked=false;
				ip.disabled="disabled";

				clss[i].className="";
				clss[i].className="checkbox-img";
			}
		}
	}	
	dash();
}
function dash(){
	var check=document.getElementById('checkall');
	var del=document.getElementById('del');
	var chek=getElementsByClassName("checkbox-img");
	var len=chek.length;
	
	for(var i=0;i<len;i++){

		(function(num){
			
			var inp=chek[num].getElementsByTagName('input')[0];
			var that=chek[num];
			var flag=0;

			addHander(inp, 'click',function(){

				inp.checked=this.checked;
			
				if(inp.checked){
					flag=1;
					that.className="";
					that.className="checkbox-img choice";
					
				}else{
					flag=0;
					that.className="";
					that.className="checkbox-img nochoice";
				}	

				/*循环遍历input 判断并设置标志值*/
				var log=false;
				for(var i=0;i<len;i++){
					var input=chek[i].getElementsByTagName('input')[0];
					if(input.checked){
						flag=1;
					}else{
						log=true;
					}
				}

				/*判断*/
				if(flag){
					del.disabled=false;
					if(log && check.value=="取消全选"){
						check.value="全选"
					}
				}else{
					del.disabled="disabled";
					if(check.value=="取消全选"){
						check.value="全选"
					}
				}
						
			});	

		})(i);
	}
}
/*全选操作*/
function select(){
	var del=document.getElementById('del');
	var check=document.getElementById('checkall');
	var lab = document.getElementsByTagName("label");
  	var n=lab.length;
  	

	check.onclick=function(){
		if(check.value=="全选"){
			check.value="取消全选"
			del.disabled=false;
		   	for(var i=0;i<n;i++){
		   		var it=lab[i].getElementsByTagName('input')[0];
				it.checked=true;
		   		lab[i].className="";
		  	 	lab[i].className="checkbox-img choice";		           
		       
		   	}
		}else if(check.value==="取消全选"){
			check.value="全选"
			del.disabled="disabled";
		   	for(var i=0;i<n;i++){
		   		var it=lab[i].getElementsByTagName('input')[0];
				it.checked=false;
		   		lab[i].className="";
		  	 	lab[i].className="checkbox-img nochoice";		           
		       
		   	}
		}
	}
  	
  	
   
  	  
}
// addLoadEvent(checkall);
// addLoadEvent(clearall);
addLoadEvent(edit);
addLoadEvent(select);