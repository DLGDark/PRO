<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询当前演出厅座位的状态</title>
</head>
<body>
	<form action="/ttms/seat/getAllSeatStatus" method="post">
		选择演出厅,查看其座位状态:<select name="studio_id" >
					<option value="-2">请选择演出厅</option>
					<c:if test="${not empty studioList}">
						<c:forEach items="${studioList}" var="studio">
							<option value="${studio.studio_id}">${studio.studio_name}</option>
						</c:forEach>
					</c:if>
				</select><br/>
		<input type="submit" value="提交"/>
	</form>
	<hr>
	<c:if test="${not empty seatList }">
		<h3>座位状态(-1代表不可用，0代表已损坏，1代表可用,2代表已出售)</h3>
		<table>
			<thead>
				<tr>
					<td>座位编号</td>
					<td>座位状态</td>
					<td>座位行号</td>
					<td>座位列号</td>
					<td>演出厅编号</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${seatList }" var="seat">
					<tr>
						<td><a href="/ttms/seat/editSeatStatus?seat_id=${seat.seat_id}"></a>${seat.seat_id}</td>
						<td>${seat.seat_status}</td>
						<td>${seat.seat_row}</td>
						<td>${seat.seat_col}</td>
						<td>${seat.studio_id}</td>
						<td><a href="/ttms/seat/getSeat?seat_id=${seat.seat_id}">编辑</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
</body>
</html>