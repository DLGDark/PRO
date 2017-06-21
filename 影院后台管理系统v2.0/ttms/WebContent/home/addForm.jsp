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
	<script src="/ttms/home/js/jquery-1.12.0.min.js"></script>

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
		        <a class="navbar-brand" href="home.jsp">TTMS</a>
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
				    <li><a href="/ttms/home/movies.jsp">影片列表</a></li>
				    <li class="active">影片添加</li>
				</ol>
				<div class="form-wrap">
					<form action="/ttms/film/addFilm" method="post" accept-charset="utf-8" role="form" class="clearfix" enctype="multipart/form-data">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
								    <label for="name">影片名称</label>
								    <input type="text" class="form-control form-c" id="name" placeholder="请输入影片名称" name="film_name">    
								</div>
								<div class="form-group">
								    <label for="timelength">影片时长</label>
								    <input type="text" class="form-control form-c" id="timelength" placeholder="请输入影片时长" name="film_length">    
								</div>
								<div class="form-group">
								    <label for="type">影片类型</label>
								    <div>
								    	<input type="checkbox" id="type1" name="film_type" class="flat" value="爱情">爱情
								    	<label for="type1"></label>
								    	<input type="checkbox" id="type2" name="film_type" class="flat"  value="喜剧">喜剧
								    	<label for="type2"></label>
								    	<input type="checkbox" id="type3" name="film_type" class="flat" value="动作">动作
								    	<label for="type3"></label>
								    	<input type="checkbox" id="type4" name="film_type" class="flat" value="剧情">剧情
								    	<label for="type4"></label>
								    	<input type="checkbox" id="type5" name="film_type" class="flat" value="科幻">科幻
								    	<label for="type5"></label>
								    	<input type="checkbox" id="type6" name="film_type" class="flat" value="恐怖">恐怖
								    	<label for="type6"></label>
								    </div>
								    <div>
								    	<input type="checkbox" id="type7" name="film_type" class="flat" value="动画">动画
								    	<label for="type7"></label>
								    	<input type="checkbox" id="type8" name="film_type" class="flat" value="惊悚">惊悚
								    	<label for="type8"></label>
								    	<input type="checkbox" id="type9" name="film_type" class="flat" value="犯罪">犯罪
								    	<label for="type9"></label>
								    	<input type="checkbox" id="type10" name="film_type" class="flat" value="冒险">冒险
								    	<label for="type10"></label>
								    	<input type="checkbox" id="type11" name="film_type" class="flat" value="其他">其他
								    	<label for="type11"></label>
								    </div>
								</div>
								<div class="form-group">
								    <label for="primrole">主演</label>
								    <input type="text" class="form-control form-c" id="primrole" placeholder="请输入主演名" name="film_stars">    
								</div>	
								<div class="form-group">
								    <label for="introduce">影片简介</label>
								    <input type="text" class="form-control form-c" id="introduce" placeholder="请输入影片简介" name="film_desc">    
								</div>					
								<div class="form-group">
								    <label for="showdata">上映时间</label>
								    <input type="text" class="form-control form-c" id="showdata" placeholder="请输入上映时间" name="film_datetime">    
								</div>
								<div class="form-group">
								    <label for="area">地区</label>
								    <div>
								    	<c:if test="${not empty filmAreaList}">
											<select name="film_area">
												<option value="0">请选择影片地区</option>
												<c:forEach items="${filmAreaList}" var="filmArea">
													<option value="${filmArea}">${filmArea}</option>
												</c:forEach>
											</select>
									   </c:if>
								    </div>							    
								</div>
								<div class="form-group">
								    <label for="price">价格</label>
								    <input type="text" class="form-control form-c" id="price" placeholder="请输入价格" name="film_price">    
								</div>		
							</div>
							<div class="col-sm-6">
								<div class="form-group">
								    <label for="imagefile">请选择要上传的电影海报(尺从大小最好是270*360)</label>
								    <input type="file" id="imagefile" value="" name="filmImg">    
								</div>	
								<div class="imgdiv">
									<img src="" id="imgsrc" name="imgsrc" > 
								</div>
							</div>
						</div>
						<div class="row commitbtn">
							<div class="col-sm-12">
								<div class="form-group">
								    <button type="submit" class="btn btn-primary add-sub">提交</button>  
								    <button type="reset" class="btn btn-default bg-color">重置</button> 
								</div>
							</div>
						</div>
					</form>					
				</div>					
			</div>
		</div>
	</div>
	
	<script src="/ttms/home/js/addForm.js"></script>
	<script src="/ttms/home/js/bootstrap.min.js" ></script>
</body>
</html>