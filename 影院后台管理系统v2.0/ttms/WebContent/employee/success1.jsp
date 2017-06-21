<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录成功</title>
</head>
<body>
	<ul>
		<li><a href="/ttms/employee/preAddEmp">员工添加</a></li>
		<li><a href="/ttms/employee/getEmployees">员工列表</a></li>
	</ul>
	<ul>
		<li><a href="/ttms/film/preAddFilm">添加影片</a></li>
		<li><a href="/ttms/film/getFilmList">影片列表</a></li>
		<li><a href="/ttms/film/filmsearch.jsp">影片检索</a></li>
		<li><a href="/ttms/film/getFilmList">影片批量删除</a></li>
	</ul>
	<ul>
		<li><a href="/ttms/notice/publishNotice.jsp">发布公告</a></li>
		<li><a href="/ttms/notice/getNoticeList">公告列表</a></li>
	</ul>
	<ul>
		<li><a href="/ttms/studio/preAddStudio">添加演出厅</a></li>
		<li><a href="/ttms/studio/studioList">演出厅列表</a></li>
	</ul>
	<ul>	
		<li><a href="/ttms/seat/getAllStudios?flag=1">座位管理</a></li>
		<li><a href="/ttms/seat/getAllStudios?flag=2">查看当前演出厅的座位分布状态</a></li>
	</ul>
	<ul>
		<li><a href="/ttms/schedule/prePlayFilm">放映电影</a></li>
		<li><a href="/ttms/schedule/getPrePlayFilmList">获取放映列表</a></li>
	</ul>
	<ul>
		<li><a href="/ttms/film/filmPlay.jsp">查看某影片放映情况</a></li>
	</ul>
</body>
</html>