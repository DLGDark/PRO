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
window.onload=function(){
	var seatId=document.getElementById('seatid');
	var ol=seatId.getElementsByTagName('ol');
	var len=ol.length;
	var stu=document.getElementById('stuHidden').value;
	for(var i=0;i<len;i++){
		(function(count){
			var li=ol[count].getElementsByTagName('li');
			var n=li.length;
			for(var j=0;j<n;j++){

				(function(num){
					addHander(li[num],'click',function(){
						var valia=document.getElementById('avaliable');
						var dam=document.getElementById('damage');
						var vac=document.getElementById('vacancy');
						var flag = 0;
						if(valia.checked){
							li[num].className="";
						}else if(dam.checked){
							li[num].className="";
							li[num].className="redcolor";
							flag = 1;
						}else if(vac.checked){
							li[num].className="";
							li[num].className="trans";
							flag = -1;
						}
						
						$.post("/ttms/seat/saveSeatSatus",{"row":count+1,"col":num+1,"flag":flag,"studio_id":stu},function(result){});
					});
				})(j);
			}
		})(i);
		
	}
}
