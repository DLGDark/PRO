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
				$("input[name='checkedStudioIds']").prop("checked",true);
			}else{	//没选中的话，就直接删除(不选其值)
				$("input[name='checkedStudioIds']").removeProp("checked");
			}
		});
	});
</script>
</head>
<body>
	<c:if test="${not empty studioList}">
	<form action="/ttms/studio/batchDeleteStudios" method="post">
		<input type="submit" value="批量删除"/> &nbsp;&nbsp;${message} <br/>
		<table>
			<thead>
				<tr>
					<td><input type="checkbox" id="checkAll"></td>
					<td>编号</td>
					<td>演出厅名称</td>
					<td>座位行数</td>
					<td>座位列数</td>
					<td>演出厅类型</td>
					<td>样演出厅状态</td>
					<td>简介</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${studioList }" var="studio">
					<tr>
						<td><input type="checkbox" name="checkedStudioIds" value="${studio.studio_id}"></td>
						<td>${studio.studio_name}</td>
						<td>${studio.seat_rows}</td>
						<td>${studio.seat_cols}</td>
						<td>${studio.studio_type}</td>
						<td>${studio.studio_status}</td>
						<td>${studio.studio_desc}</td>
						<td><a href="/ttms/studio/preUpdateStudio?studio_id=${studio.studio_id}">编辑</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	</c:if>
</body>
</html>