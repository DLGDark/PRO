<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>准备购票</title>
</head>
<body>
	<form action="/ttms/order/submitOrder" method="post">
		<input type="hidden" name="sche_id" value="${sche_id}">
		<input type="hidden" name="film_price" value="${filmInfo.film_price}">
		<c:if test="${not empty seatList}">
			该演出厅的座位状态:<br/>
			<c:forEach items="${seatList}" var="seat">
				状态:${seat.seat_status}&nbsp;&nbsp;行号:${seat.seat_row}&nbsp;&nbsp;列号:${seat.seat_col}&nbsp;&nbsp;所属演出厅:${seat.studio_id}
				<input type="hidden" name="studio_id" value="${seat.studio_id}">
			</c:forEach>		
		</c:if><br/>
		<c:if test="${not empty filmInfo}">
			电影名称:${filmInfo.film_name}&nbsp;&nbsp;电影价格:${filmInfo.film_price}&nbsp;&nbsp;
		</c:if><br/>
		准备买票(请选择座位):<br/>
		座位行列号(格式:行号 - 列号):<input type="text" name="seatRowCol"/><br/>
		座位行列号(格式:行号 - 列号):<input type="text" name="seatRowCol"/><br/>
		座位行列号(格式:行号 - 列号):<input type="text" name="seatRowCol"/><br/>
		座位行列号(格式:行号 - 列号):<input type="text" name="seatRowCol"/><br/>
		<input type="submit" value="购买"/>
	</form>
</body>
</html>