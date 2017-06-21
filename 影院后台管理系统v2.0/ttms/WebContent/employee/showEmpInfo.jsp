<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户展示详情界面</title>
</head>
<body>
	<c:if test="${not empty empInfo}">
		<table>
			<tr>
				<td>${empInfo.emp_id}</td>
				<td>${empInfo.emp_account}</td>
				<td>${empInfo.emp_pass}</td>
				<td>${empInfo.emp_name}</td>
				<td>${empInfo.emp_position}</td>
				<td>${empInfo.emp_sex}</td>
				<td>${empInfo.emp_birth}</td>
				<td>${empInfo.emp_age}</td>
				<td>${empInfo.emp_tel}</td>
				<td>${empInfo.emp_email}</td>
				<td>${empInfo.emp_addr}</td>
			</tr>
		</table>
	</c:if>
</body>
</html>