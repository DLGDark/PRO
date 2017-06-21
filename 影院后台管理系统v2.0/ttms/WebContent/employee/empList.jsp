<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
</head>
<body>
	<c:if test="${not empty employeeList}">
		<table>
			<thead>
				<tr>	
					<th>编号</th>
					<th>账户</th>
					<th>密码</th>
					<th>姓名</th>
					<th>职位</th>
					<th>性别</th>
					<th>生日</th>
					<th>年龄</th>
					<th>电话</th>
					<th>邮箱</th>
					<th>地址</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${employeeList}" var="emp">
					<tr>
						<td><a href="/ttms/employee/getEmpInfo/${emp.emp_id}">${emp.emp_id}</a></td>
						<td>${emp.emp_account}</td>
						<td>${emp.emp_pass}</td>
						<td><a href="/ttms/employee/getEmpInfo/${emp.emp_id}">${emp.emp_name}</a></td>
						<td>${emp.emp_position}</td>
						<td>${emp.emp_sex}</td>
						<td>${emp.emp_birth}</td>
						<td>${emp.emp_age}</td>
						<td>${emp.emp_tel}</td>
						<td>${emp.emp_email}</td>
						<td>${emp.emp_addr}</td>
						<td><a href="/ttms/employee/delEmpInfo/${emp.emp_id}">删除</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		当前页:${currentPage}&nbsp;&nbsp;总页码:${pageCount}<br/>
		<c:if test="${currentPage == 1 }">上一页</c:if>
		<c:if test="${currentPage > 1}"><a href="/ttms/employee/employeePagging?currentPage=${currentPage}&dir=pre">上一页</a></c:if>
		<c:if test="${currentPage == pageCount }">下一页</c:if>
		<c:if test="${currentPage < pageCount }"><a href="/ttms/employee/employeePagging?currentPage=${currentPage}&dir=next">下一页</a></c:if>
	</c:if>
</body>
</html>