<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<li><a href="/ttms/home/movies.jsp">影片管理</a></li>	   
				    <li class="active">影片信息</li>
				</ol>
				<div class="updamov">
					<form action="/ttms/film/updateFilm" method="post" enctype="multipart/form-data" class="form-horizontal" id="mdform">
						<div class="row">
							<input type="hidden" name="film_id" value="${filmInfo.film_id}">
							<input type="hidden" name="film_img" value="${filmInfo.film_img}">
							<input type="hidden" name="boolflag" id="boolflag" value="false">
							
							<div class="col-md-6">							
							  	<div class="form-group">
							      <label for="mname" class="col-sm-3 control-label">电影名称:</label>
							      <div class="col-sm-9">
							        <input type="text" class="form-control inpbg" id="mname" value="${filmInfo.film_name}" disabled="disabled" name="film_name">
							      </div>
							    </div>
							    <div class="form-group">
							      <label for="mtimelength" class="col-sm-3 control-label">时长:</label>
							      <div class="col-sm-9">
							        <input type="text" class="form-control inpbg" id="mtimelength" disabled="disabled" value="${filmInfo.film_length}" name="film_length">
							      </div>
							    </div>
							    <div class="form-group">
							      <label for="mtype" class="col-sm-3 control-label">类型:</label>
							      <div class="col-sm-9">
							        <input type="text" class="form-control inpbg" id="mtype" disabled="disabled" value="${filmInfo.film_type}" name="film_type">
							      </div>
							    </div>
							    <div class="form-group">
							      <label for="mrole" class="col-sm-3 control-label">主演:</label>
							      <div class="col-sm-9">
							        <input type="text" class="form-control inpbg" id="mrole" disabled="disabled" value="${filmInfo.film_stars}" name="film_stars">
							      </div>
							    </div>
							    <div class="form-group">
							      <label for="mdatatime" class="col-sm-3 control-label">上映时间:</label>
							      <div class="col-sm-9">
							        <input type="text" class="form-control inpbg" id="mdatatime" disabled="disabled" value="${filmInfo.film_datetime}" name="film_datetime">
							      </div>
							    </div>
							    <div class="form-group">
							      <label for="marea" class="col-sm-3 control-label">地区:</label>
							      <div class="col-sm-9">
							        <input type="text" class="form-control inpbg" id="marea" disabled="disabled" value="${filmInfo.film_area}" name="film_area">
							      </div>
							    </div>
							    <div class="form-group">
							      <label for="mprice" class="col-sm-3 control-label">价格:</label>
							      <div class="col-sm-9">
							        <input type="text" class="form-control inpbg" id="mprice" disabled="disabled" value="${filmInfo.film_price}" name="film_price">
							      </div>
							    </div>	
							    <div class="form-group">
							      <label for="mintrodu" class="col-sm-3 control-label">影片简介:</label>
							      <div class="col-sm-9">
							        <textarea class="form-control" id="mintrodu" rows="8" cols="12" disabled="disabled" name="film_desc">${filmInfo.film_desc}</textarea>
							      </div>
							    </div>	
							</div>	
							<div class="col-md-6 lmarg">
								<div class="form-group" style="display: none;" id="filesub">
								    <label for="mdyimgfile">请选择要上传的电影海报(尺从大小最好是270*360)</label>
								    <input type="file" id="mdyimgfile" name="file">   
								</div>
								<div class="rimg">
									<img src="${filmInfo.film_img}" alt="picture" id="mdypic">				
								</div>				
							</div>
						</div>
						<div class="row foot-btn">
							<div class="col-sm-12">
								<div class="form-group">								      
								    <button type="button" class="btn btn-default modifybtn" id="modifymess">修改信息</button>
								    <button type="submit" class="btn btn-primary" style="display: none;" id="submess">提交</button> 
								</div>
							</div>
						</div>	
					</form>
				</div>									
			</div>
		</div>
	</div>

	<script src="/ttms/home/js/jquery-1.12.0.min.js"></script>
	<script src="/ttms/home/js/mdfymov.js"></script>
	<script src="/ttms/home/js/bootstrap.min.js" ></script>
</body>
</html>