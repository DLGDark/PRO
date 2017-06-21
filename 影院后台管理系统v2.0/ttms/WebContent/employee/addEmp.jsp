<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加员工</title>
</head>
<body>
	<form action="/ttms/employee/addEmp" method="post">
		姓名:<input type="text" name="emp_name" /><br /> 
		账号:<input type="text" name="emp_account" /><br />
		职位:<select name="emp_position">
				<option value="0">请选择职位</option>
				<c:if test="${not empty empPositionList}">
					<c:forEach items="${empPositionList}" var="empPosition">
						<option value="${empPosition}">${empPosition}</option>
					</c:forEach>
				</c:if>
			</select><br/>
		<input type="submit" value="添加"><br/>
	</form>
</body>
</html>