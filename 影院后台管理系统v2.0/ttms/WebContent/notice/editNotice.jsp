<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告编辑</title>
</head>
<body>
	<form action="/ttms/notice/updateNotice" method="post">
		<input type="hidden" value="${noticeInfo.notice_id}" name="notice_id"><br/>
		公告名称:<input type="text" name="notice_name" value="${noticeInfo.notice_name}"/><br/>
		公告标题:<input type="text" name="notice_title" value="${noticeInfo.notice_title}"><br/>
		公告内容:<textarea rows="10" cols="30" name="notice_content">${noticeInfo.notice_content}</textarea><br/>
		<input type="submit" value="更新">
	</form>
</body>
</html>