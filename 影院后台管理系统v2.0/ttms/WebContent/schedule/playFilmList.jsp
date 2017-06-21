<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>演出计划中所有影片放映列表</title>
<script type="text/javascript" src="/ttms/js/jquery-1.11.2.js"></script>
<script type="text/javascript">
	$(function(){
		$("#checkAll").click(function(){	//给其复选框添加点击事件
			var ckd = this.checked;		//获取document属性，进而获取当前复选框的状态
			if(ckd){	//选中的话，全部选中
				$("input[name='checkedScheduleIds']").prop("checked",true);
			}else{	//没选中的话，就直接删除(不选其值)
				$("input[name='checkedScheduleIds']").removeProp("checked");
			}
		});
	});
</script>
</head>
<body>
	<form action="/ttms/schedule/batchDeleteSchedules" method="post">
		<input type="submit" value="批量删除"/>
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" id="checkAll"></th>
					<th>演出计划编号</th>
					<th>影片开始时间</th>
					<th>影片结束时间</th>
					<th>影片名称</th>
					<th>演出厅名称</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty scheList}">
					<c:forEach items="${scheList }" var="schedule">
						<tr>
							<td><input type="checkbox" name="checkedScheduleIds" value="${schedule.sche_id}"></td>
							<td>${schedule.sche_id}</td>
							<td>${schedule.film_begintime}</td>
							<td>${schedule.film_endtime}</td>
							<td>${schedule.film.film_name}</td>
							<td>${schedule.studio.studio_name}</td>
							<td><a href="/ttms/schedule/preUpdate?sche_id=${schedule.sche_id}">编辑</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</form>
</body>
</html>