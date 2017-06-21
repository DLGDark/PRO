<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/ttms/js/jquery-1.11.2.js"></script>
<title>影片列表</title>
<script type="text/javascript">
	$(function(){
		$("#checkAll").click(function(){	//给其复选框添加点击事件
			var ckd = this.checked;		//获取document属性，进而获取当前复选框的状态
			if(ckd){	//选中的话，全部选中
				$("input[name='checkedFilmIds']").prop("checked",true);
			}else{	//没选中的话，就直接删除(不选其值)
				$("input[name='checkedFilmIds']").removeProp("checked");
			}
		});
	});
</script>
</head>
<body>
	<c:if test="${not empty filmList}">
	<form action="/ttms/film/batchDeleteFilms" method="post">
		<input type="submit" value="批量删除"/> &nbsp;&nbsp;${message} <br/>
		<table>
			<thead>
				<tr>
					<td><input type="checkbox" id="checkAll"></td>
					<td>影片名称</td>
					<td>影片时长</td>
					<td>影片类型</td>
					<td>影片主演</td>
					<td>影片描述</td>
					<td>影片价格</td>
					<td>影片地区</td>
					<td>影片状态</td>
					<td>影片评分</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${filmList }" var="film">
					<tr>
						<td><input type="checkbox" name="checkedFilmIds" value="${film.film_id}"></td>
						<td>${film.film_name}</td>
						<td>${film.film_length}</td>
						<td>${film.film_type}</td>
						<td>${film.film_stars}</td>
						<td>${film.film_desc}</td>
						<td>${film.film_price}</td>
						<td>${film.film_area}</td>
						<td>${film.film_status}</td>
						<td>${film.film_score}</td>
						<td><a href="/ttms/film/preUpdateFilm?film_id=${film.film_id}">编辑</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		当前页:${currentPage}&nbsp;&nbsp;总页码:${pageCount}<br/>
		<c:if test="${currentPage == 1 }">上一页</c:if>
		<c:if test="${currentPage > 1}"><a href="/ttms/film/filmPagging?currentPage=${currentPage}&dir=pre">上一页</a></c:if>
		<c:if test="${currentPage == pageCount }">下一页</c:if>
		<c:if test="${currentPage < pageCount }"><a href="/ttms/film/filmPagging?currentPage=${currentPage}&dir=next">下一页</a></c:if>
	</form>
	</c:if>
</body>
</html>