<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Movies</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="" />
	<script type="application/x-javascript">
		//绑定事件，将页面平滑到指定窗口(初始化加载页面)
		addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 
		function hideURLbar(){ window.scrollTo(0,1); } 
	</script>
	<link rel="stylesheet" type="text/css" href="/ttms/home/css/reset.css">
	<link rel="stylesheet" type="text/css" href="/ttms/home/css/fonts.css">
	<link rel="stylesheet" type="text/css" href="/ttms/home/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/ttms/home/css/home.css">
	<link rel="stylesheet" type="text/css" href="/ttms/home/css/movies.css">
	

</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation">
			<!-- header部分 -->
		    <div class="navbar-header">
		    	<!-- 适配移动端时的显示 -->
		    	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#clickbar">
    	            <span class="sr-only">切换导航</span>
    	            <span class="icon-bar"></span>
    	            <span class="icon-bar"></span>
    	            <span class="icon-bar"></span>
    	        </button>
    	        <!-- 标题 -->
		        <a class="navbar-brand" href="/ttms/home/home.jsp">TTMS</a>
		    </div>
		    <!-- 登录人员信息设置 -->
		    <ul class="nav navbar-nav navbar-right">
		    	<li class="dropdown">
			    	<a href="#" class="dropdown-toggle fli" data-toggle="dropdown">
			    		<img src="/ttms/home/img/1.jpg" alt="humanPhoto">
			    	</a>
			    	<ul class="dropdown-menu">
			    		<li class="ph">
			    			<a href="/ttms/employee/getEmployee"><i class="icon-modify icon"></i>修改信息</a>
			    		</li>
			    		<li class="ph">
			    			<a href="/ttms/index.jsp"><i class="icon-logout icon"></i>退出登录</a>
			    		</li>
			    	</ul>
		    	</li>
		    </ul>
		    <!-- 全局搜索 -->
			<form class="navbar-form navbar-right">
              <input type="text" class="form-control globals" value="Search..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search...';}">
            </form> 
    		<!-- 侧边信息栏 -->
            <div class=" navbar-nav sidebar">
                <div class="collapse navbar-collapse"  id="clickbar">
    				<ul class="nav">
                        <li><a href="/ttms/film/getFilmList"><i class="icon-movies icon"></i>影片管理</a></li>
                        <li><a href="/ttms/studio/studioList"><i class="icon-theatre icon"></i>影厅管理</a></li>
                        <li><a href="/ttms/employee/getEmployees"><i class="icon-human icon"></i>人员管理</a></li>
                        <li><a href="/ttms/home/order.jsp"><i class="icon-schedule icon"></i>订单表</a></li>
                        <!-- <li><a href="/ttms/home/finance.jsp"><i class="icon-finance icon"></i>财务报表</a></li> -->
                        <li><a href="/ttms/notice/getNoticeList"><i class="icon-notice icon"></i>公告</a></li>                        
                    </ul>
    			</div>
            </div>	
		</nav>
		<div id="page-wrapper" class="pa-wrp">			
			<div class="grap">
				<div class="header">
					<div class="page-hd">
					    影片管理
					</div>
				</div>
				<ol class="breadcrumb bg-head">		
					<li><a href="/ttms/home/home.jsp">Home</a></li>	   
				    <li class="active">影片管理</li>
				</ol>
				<form action="/ttms/film/batchDeleteFilms" method="get" accept-charset="utf-8">
					<div class="head-btn">
						<a href="/ttms/film/preAddFilm" class="wrapa"><button type="button" class="btn btn-primary btright" id="addmovie"><i class="icon-add icon"></i>添加</button></a>
						<input type="button" name="" class="btn btn-primary btright" id="edit-operation" value="编辑">
						<div class="pull-right" id="hidde-btn" style="display: none;">
							<input type="button" name="" class="btn btn-primary btright" id="checkall" value="全选">
							<button type="submit" class="btn btn-primary btright" id="del" >删除</button>
						</div>
					</div>
					<c:if test="${not empty filmList}">
						<div class="row rowset" id="node"> 
						<c:forEach items="${filmList}" var="film" varStatus="vs">
				   			<div class="col-sm-6 col-md-3">
				   		     <div class="thumbnail rela">
				   		        <a href="/ttms/film/preUpdateFilm?film_id=${film.film_id}">
				   		        	<img src="${film.film_img}" alt="通用的占位符缩略图">
				   		        	<div class="caption">
				   		        	    <h3 class="name">${film.film_name}</h3>
				   		        	</div>
				   		        	<label for="mbg${vs.index}" class="checkbox-img">
				   		        	  <input type="checkbox" style="display: none;" value="${film.film_id}" id="mbg${vs.index}" name="checkedFilmIds" disabled="disabled" >
				   		        	</label>
				   		        </a>
				   		     </div>    
				   			</div>
						</c:forEach>
						</div>
					</c:if>
					</div>
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
				</form>					
			</div>
		</div>
	</div>

	<script src="/ttms/home/js/jquery-1.12.0.min.js"></script>
	<script src="/ttms/home/js/movies.js"></script>
	<script src="/ttms/home/js/bootstrap.min.js" ></script>
</body>
</html>