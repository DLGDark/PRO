<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>影片检索</title>
</head>
<body>
	<form action="/ttms/film/searchFilm" method="post">
		影片名称:<input type="text" name="film_name" /><br />  
		影片时长:<input type="text" name="film_length"><br/>
		影片地区:<input type="text" name="film_area"><br/>
		<input type="submit" value="检索" /><br />
	</form>
	<hr />
	<c:if test="${not empty filmList }">
		<h3>商品检索列表</h3>
	</c:if>
	<c:if test="${not empty filmList }">
		<table>
			<thead>
				<tr>
					<td>影片名称</td>
					<td>影片时长</td>
					<td>影片类型</td>
					<td>影片主演</td>
					<td>影片描述</td>
					<td>影片价格</td>
					<td>影片地区</td>
					<td>影片状态</td>
					<td>影片评分</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${filmList }" var="film">
					<tr>
						<td>${film.film_name}</td>
						<td>${film.film_length}</td>
						<td>${film.film_type}</td>
						<td>${film.film_stars}</td>
						<td>${film.film_desc}</td>
						<td>${film.film_price}</td>
						<td>${film.film_area}</td>
						<td>${film.film_status}</td>
						<td>${film.film_score}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		当前页:${currentPage}&nbsp;&nbsp;总页码:${searchPageCount}<br/>
		<c:if test="${currentPage == 1 }">上一页</c:if>
		<c:if test="${currentPage > 1}"><a href="/ttms/film/searchFilmPagging?currentPage=${currentPage}&dir=pre">上一页</a></c:if>
		<c:if test="${currentPage == searchPageCount }">下一页</c:if>
		<c:if test="${currentPage < searchPageCount }"><a href="/ttms/film/searchFilmPagging?currentPage=${currentPage}&dir=next">下一页</a></c:if>
	</c:if>
</body>
</html>