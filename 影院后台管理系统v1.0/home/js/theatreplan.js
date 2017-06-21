window.onload=function(){
  
  var check=document.getElementById('check-all');
   
  check.onclick=function(){
    var hobby = document.getElementsByTagName("input");
    var n=hobby.length;
    if(check.checked){
      for(var i=0;i<n;i++){
        if(hobby[i].type=="checkbox"){
          hobby[i].checked=true;
        }
      }
    }else{
      for(var i=0;i<n;i++){
        if(hobby[i].type=="checkbox"){
          hobby[i].checked=false;
        }
      }
    }
  }
}