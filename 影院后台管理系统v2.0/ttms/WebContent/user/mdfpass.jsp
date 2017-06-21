<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>mdfpass</title>
	<link rel="stylesheet" href="/ttms/user/css/mdcss.css">
	<script type="text/javascript" src="/ttms/js/jquery-1.11.2.js"></script>
</head>
<body class="login">
	<div class="content">
		<!-- method属性值为post，enctype属性值为multipart/form-data，把文件中的数据作为流式数据上传 -->
		<form action="/ttms/employee/updatepass" method="post" class="submitForm" enctype="multipart/form-data">
			<input type="hidden" id="emp_id" name="emp_id" value="${emp_id}"/>
			<div class="dl">
				<input type="password" class="inp" id="oldpass" name="old_pass" value="" placeholder="原密码">
				<p id="hint" style="color: #ff0000;"></p>
			
			</div>
			<div class="dl">
				<input type="password" class="inp" name="new_pass" value="" placeholder="新密码" >
			</div>
			<div class="dl">
				<input type="password" class="inp" name="con_pass" value="" placeholder="确认密码" >
			</div>
			<div>
				<input type="submit" class="btn" name="" value="提交">
			</div>
		</form>
	</div>
	<!-- 以 body 定位背景图片 -->
	<div class="body-bg">
		<img src="/ttms/user/image/mdbg.jpg" width="100%" height="100%" style="" alt="backgroundImage">
	</div>
<!-- 	<script type="text/javascript">
		function check(){
			var emp_id = $("#emp_id").val();
			var oldp=$('#oldpass').val();
			$.post("/ttms/employee/checkpass",{"emp_id":emp_id,"pass":oldp},function(result){
				if(!result){
					$("#hint").val('原密码错误！请重新输入！');
					$('#hint').val();
				}
			},"json");
		};
	</script> -->
</body>
</html>