<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>、
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告列表</title>
<script type="text/javascript">
	$(function(){
		$("#checkAll").click(function(){	//给其复选框添加点击事件
			var ckd = this.checked;		//获取document属性，进而获取当前复选框的状态
			if(ckd){	//选中的话，全部选中
				$("input[name='checkedNoticeIds']").prop("checked",true);
			}else{	//没选中的话，就直接删除(不选其值)
				$("input[name='checkedNoticeIds']").removeProp("checked");
			}
		});
	});
</script>
</head>
<body>
	<form action="/ttms/notice/batchDeleteNotices" method="post">
		<input type="submit" value="批量删除"/><br/>
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" id="checkAll"></th>
					<th>公告编号</th>
					<th>公告名称</th>
					<th>公告标题</th>
					<th>公告发布时间</th>
					<th>公告内容</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticeList }" var="notice">
					<tr>
						<td><input type="checkbox" name="checkedNoticeIds" value="${notice.notice_id}"></td>
						<td>${notice.notice_id}</td>
						<td>${notice.notice_name}</td>
						<td>${notice.notice_title}</td>
						<td>${notice.notice_time}</td>
						<td>${notice.notice_content}</td>
						<td><a href="/ttms/notice/preUpdate?notice_id=${notice.notice_id}">编辑</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</body>
</html>