<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加演出厅</title>
</head>
<body>
	<form action="/ttms/studio/addStudio" method="post">
		演出厅名称:<input type="text" name="studio_name" /><br /> 
		座位行数:<input type="text" name="seat_rows" /><br />
		座位列数:<input type="text" name="seat_cols" /><br />
		演出厅类型:<select name="studio_type">
				<option value="0">请选择类型</option>
				<c:if test="${not empty studioList}">
					<c:forEach items="${studioList}" var="studioType">
						<option value="${studioType}">${studioType}</option>
					</c:forEach>
				</c:if>
			</select><br/>
		演出厅状态:<select name="studio_status">
					<option value="1">未使用</option>
					<option value="2">已使用</option>
					<option value="-1">已损坏</option>
				</select><br/>
		描述:<textarea rows="10" cols="30" name="studio_desc"></textarea><br/>
		<input type="submit" value="添加"><br/>
	</form>
</body>
</html>