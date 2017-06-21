<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>TTMS</title>
	<meta name="description" content="">
	<meta name="keywords" content="">

	<link rel="stylesheet" type="text/css" href="/ttms/saleTicket/css/reset.css">
	<link rel="stylesheet" type="text/css" href="/ttms/saleTicket/css/movieChoice.css">

</head>
<body>
	<div id="bgImage" class="bgImage"></div>
	<div class="block">
		<div class="head">
			<div class="title">
				<span class="title-font">TTMS影院</span>

				<span class="titaddr">
					<p>地址:西安长安区子午的大道邮电大学东面300m处</p>
					<p>电话: 029-2564 3352</p>
				</span>
			</div>
		</div>
		<ol class="nav">	
			<li><a href="movieChoice.html">选择电影</a></li>
			<span>/</span>		   
		    <li class="active">演出安排</li>
		</ol>
		<div class="wrapper">
			<div class="content">
				<table class="table">
					<thead>
						<tr>
							<th>电影名称</th>
							<th>放映时间</th>
							<th>放映影厅</th>
							<th>片长</th>
							<th>价格</th>
							<th>购票</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty scheList}">
							<c:forEach items="${scheList}" var="sche">
							<tr>
								<td class="org">${sche.film.film_name}</td>
								<td>${sche.film_startdate}</td>
								<td>${sche.studio.studio_name}</td>
								<td>${sche.film.film_length} 分钟</td>
								<td class="org">${sche.film.film_price}</td>
								<td>
									<a href="/ttms/ticket/getSeatsStatus?sche_id=${sche.sche_id}" class="payticket"><span>购票</span></a>
								</td>
							</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
</body>
</html>