<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加影片</title>
</head>
<body>
	<form action="/ttms/film/addFilm" method="post" enctype="multipart/form-data">
		影片名称:<input type="text" name="film_name"><br/>
		影片时长:<input type="text" name="film_length"><br/>
		影片类型:<c:if test="${not empty filmTypeList}">
					<c:forEach items="${filmTypeList}" var="type" varStatus="vs">
						<input type="checkbox" name="film_type" value="${vs.count}">${type}
						<c:if test="${vs.count%5==0}">
							<br/>
						</c:if>
					</c:forEach>
			   </c:if><br/>
		影片主演:<input type="text" name="film_stars"/><br/>
		 影片简介:<br/><textarea cols="30" rows="10" name="film_desc" ></textarea><br/>
		影片价格:<input type="text" name="film_price"><br/>
	         上映时间:<input type="text" name="film_datatime"><br/>
		影片地区:<c:if test="${not empty filmAreaList}">
					<select name="film_area">
						<option value="0">请选择影片地区</option>
						<c:forEach items="${filmAreaList}" var="filmArea">
							<option value="${filmArea}">${filmArea}</option>
						</c:forEach>
					</select>
			   </c:if><br/>
		影片图片:<input type="file" name="filmImg"><br/>
		影片状态:<select name="film_status">
					<option value="1">上架</option>
					<option value="2">下架</option>
			   </select><br/> 
		影片评分:<input type="text" value="0.0" name="film_score"><br/>
		<input type="submit" value="添加">
	</form>
	<img alt="图片" src="${fileUrl}">
</body>
</html>