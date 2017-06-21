<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑演出计划一条记录</title>
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
	<form action="/ttms/schedule/saveSchedule" method="post">
		<input type="hidden" name="sche_id" value="${scheInfo.sche_id}"/>
		<input type="hidden" name="film_length" value="${scheInfo.film.film_length}"/>
		<input type="hidden" name="studio_id" value="${scheInfo.studio_id}"/>
		<input type="hidden" name="film_id" value="${scheInfo.film_id}"/>
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
		影片名称:${scheInfo.film.film_name}<br/>
		<input type="submit" value="提交"/>
	</form>
</body>
</html>