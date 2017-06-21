<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录成功</title>
</head>
<body>
	<ul>
		<li><a href="/ttms/employee/preUpdateEmpInfo?emp_id=${emp_id}">修改个人信息</a></li>
		<li><a href="/ttms/employee/getEmpInfo/${emp_id}">查看信息</a></li>
	</ul>
</body>
</html>