<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>放映电影</title>
<script type="text/javascript" src="/ttms/js/jquery-1.11.2.js"></script>
<script type="text/javascript">
	function showTimeSegment(studio_id){
		$.post("/ttms/schedule/showTimeSegment",{"studio_id":studio_id},function(result){
			console.info(result);
			if(result != null){
				var usetime = $("#usetime");
				var html = "<option value='noChooseTime'>请选择播放开始时间</option>";
				for (var i = 0; i < result.length; i++) {
					html += "<option value='"+result[i]+"'>" + result[i] + "</option>";
				}
				usetime.html(html);
			}
		},"json");
	}
</script>
</head>
<body>
	<form action="/ttms/schedule/saveFilmPlay" method="post">
		选择演出厅:<select name="studio_id" onchange="showTimeSegment(this.value)">
					<option value="0">请选择演出厅</option>
					<c:if test="${not empty studioList}">
						<c:forEach items="${studioList}" var="studio">
							<option value="${studio.studio_id}">${studio.studio_name}</option>
						</c:forEach>
					</c:if>
				</select><br/>
		该演出厅中电影安排可选时间列表:
		<select name="film_begintime" id="usetime">
			<option value="noChooseTime">请选择播放开始时间</option>
		</select>
		<br/>
		选择电影:<br/>
		<c:if test="${not empty filmList}">
				<c:forEach items="${filmList}" var="film" varStatus="vs">
				
					<input type="radio" name="film_id" value="${film.film_id}"/>${film.film_name}
					
					film_length:<input type="text" name="film_length" value="${film.film_length}"/>
					
					<c:if test="${vs.index % 3 == 0 }">
					<br/><br/>
					</c:if>		
				</c:forEach>
			</c:if><br/>
		<input type="submit" value="提交"/>
	</form>
</body>
</html>