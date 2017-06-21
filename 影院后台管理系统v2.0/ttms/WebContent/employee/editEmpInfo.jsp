<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/ttms/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/ttms/js/calendar.js"></script>
<title>编辑员工信息</title>
</head>
<body>
	<form action="/ttms/employee/updateEmpInfo" method="post" enctype="multipart/form-data">
			<input type="hidden" name="emp_id" value="${empInfo.emp_id }"><br/>
     		用户名:<input type="text" name="emp_name" value="${empInfo.emp_name}"><br/>
     		密码:<input type="password" name="emp_pass" value="${empInfo.emp_pass}"><br/>
     		确认密码:<input type="password" name="passwordSure" value="${empInfo.emp_pass }"><br/>
     		生日:<select id="year" name="year" onchange="year_click()">
     					<option value='0'>-year-</option>
     					<c:forEach begin="1970" end="${currentYear}" var="y" step="1">
     						<option value='${y}'>${y}</option>
     					</c:forEach>
     				</select>
   					<select id="month" name="month" onchange="month_click()"><option value='0'>-month-</option></select>
   					<select id="day" name="day"><option value='0'>-day-</option>
   				</select><br/>
   			年龄:<input type="text" name="emp_age" id="age"><br/>
   			性别:<input type="radio" checked="checked" name="emp_sex" value="男"/>男&nbsp;&nbsp;
     			<input type="radio" name="emp_sex" value="女"/>女 <br/>
     		电话:<input type="text" name="emp_tel"><br/>
     		邮箱:<input type="text" name="emp_email"><br/>
     		地址:<input type="text" name="emp_addr"><br/>
     		<!-- 上传头像:<input type="file" name="emp_img"/><br/> -->
			<input type="submit" value="提交"><br/>
		</form>
</body>
</html>