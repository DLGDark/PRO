<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑座位的状态</title>
</head>
<body>
	<form action="/ttms/seat/editSeat" method="post">
		<input type="hidden" name="seat_id" value="${seatInfo.seat_id}">
		<input type="hidden" name="studio_id" value="${seatInfo.studio_id}">
		座位状态(-1代表不可用，0代表已损坏，1代表可用,2代表已出售):<input type="text" name="seat_status" value="${seatInfo.seat_status}"/><br/>
		座位行号:<input type="text" name="seat_row" value="${seatInfo.seat_row}"><br/>
		座位列号:<input type="text" name="seat_col" value="${seatInfo.seat_col}"><br/>
		<input type="submit" value="更新"/>
	</form>
</body>
</html>