<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设置座位的状态</title>
</head>
<body>
	<form action="/ttms/seat/saveSeatStatus" method="post">
		选择演出厅:<select name="studio_id" >
					<option value="-2">请选择演出厅</option>
					<c:if test="${not empty studioList}">
						<c:forEach items="${studioList}" var="studio">
							<option value="${studio.studio_id}">${studio.studio_name}</option>
						</c:forEach>
					</c:if>
				</select><br/>
		座位状态(-1代表不可用，0代表已损坏，1代表可用,2代表已出售):<input type="text" name="seat_status" />&nbsp;&nbsp;
		座位行列号(格式:行号 - 列号):<input type="text" name="seatRowCol"/><br/><br/>
		座位状态(-1代表不可用，0代表已损坏，1代表可用,2代表已出售):<input type="text" name="seat_status" />&nbsp;&nbsp;
		座位行列号(格式:行号 - 列号):<input type="text" name="seatRowCol"/><br/><br/>
		座位状态(-1代表不可用，0代表已损坏，1代表可用,2代表已出售):<input type="text" name="seat_status" />&nbsp;&nbsp;
		座位行列号(格式:行号 - 列号):<input type="text" name="seatRowCol"/><br/><br/>
		座位状态(-1代表不可用，0代表已损坏，1代表可用,2代表已出售):<input type="text" name="seat_status" />&nbsp;&nbsp;
		座位行列号(格式:行号 - 列号):<input type="text" name="seatRowCol"/><br/><br/>
		<input type="submit" value="提交"/>
	</form>
</body>
</html>