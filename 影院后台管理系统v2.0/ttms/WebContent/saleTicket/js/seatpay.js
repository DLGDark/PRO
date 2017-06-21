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
var seats={};
var k=0;
window.onload=function(){
	var seatId=document.getElementById('seatid');
	var ol=seatId.getElementsByTagName('ol');
	var len=ol.length;
	
	var tArray = new Array();  //先声明一维
	for(var k=0;k<10;k++){    //一维长度为i,i为变量，可以根据实际情况改变
		tArray[k]=new Array();  //声明二维，每一个一维数组里面的一个元素都是一个数组；
		for(var j=0;j<12;j++){   //一维数组里面每个元素数组可以包含的数量p，p也是一个变量；
			tArray[k][j]=0;    //这里将变量初始化，我这边统一初始化为空，后面在用所需的值覆盖里面的值
		}
	}
	
	for(var i=0;i<len;i++){
		(function(count){
			var li=ol[count].getElementsByTagName('li');
			var n=li.length;
			for(var j=0;j<n;j++){

				(function(num){
					
					addHander(li[num],'click',function(){						
						if(li[num].className=="redcolor"){
							li[num].className="redcolor";
							alert("座位已损坏！");
						}
						if(li[num].className=="trans"){
							li[num].className="trans";
							alert("座位不存在！");
						}
						if(li[num].className=="green"){
							li[num].className="";
							seats[k++]=count+','+num;
						}else if(li[num].className==""){
							li[num].className="green";
							delete seats[--k];
						}						
					});
				})(j);
			}
		})(i);	
	}
	
}
function seatPost(){
	//alert(seats);
    $.post("/ttms/order/submitOrder",{"seats":seats},function(result){},"text");
}
	
		