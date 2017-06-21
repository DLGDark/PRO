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
			<li class="active">选择电影</li>
		</ol>
		<div class="wrapper">
			<div class="content">
			<c:if test="${not empty filmList}">
				<div class="row rowset" id="node">
					<ul class="clearfix"> 
					<c:forEach items="${filmList}" var="film" varStatus="vs">
								<li class="imgwrp">
									<a href="/ttms/schedule/getFilmPlay?film_id=${film.film_id}">
								   	<img src="${film.film_img}" alt="通用的占位符缩略图">
								   	<div class="caption">
								   	    <h3 class="name">${film.film_name}</h3>
								   	</div>					
								   </a>
						   		</li>
					</c:forEach>
					</ul>
				</div>
			</c:if>
			
				<div class="row rowset">						
					<div class="col-md-12">
						<div class="pageParent">
							<span class="page"><c:if test="${currentPage == 1 }">上一页</c:if>
								<c:if test="${currentPage > 1}"><a href="/ttms/film/filmPagging?currentPage=${currentPage}&dir=pre">上一页</a></c:if>
							</span>
							<span class="page"><c:if test="${currentPage == pageCount }">下一页</c:if>
								<c:if test="${currentPage < pageCount }"><a href="/ttms/film/filmPagging?currentPage=${currentPage}&dir=next">下一页</a></c:if>
							</span>
							<span class="page">当前页:${currentPage}</span>
							<span class="page">总页码:${pageCount}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>