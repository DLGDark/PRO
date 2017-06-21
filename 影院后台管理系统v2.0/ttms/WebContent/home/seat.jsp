<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="java.util.List" %>
<%@ page import="com.xupt.ttms.vo.SeatInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Seat</title>
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
                       <!--  <li><a href="/ttms/home/finance.jsp"><i class="icon-finance icon"></i>财务报表</a></li> -->
                        <li><a href="/ttms/notice/getNoticeList"><i class="icon-notice icon"></i>公告</a></li>                        
                    </ul>
    			</div>
            </div>	
		</nav>
		<div id="page-wrapper" class="pa-wrp">
			<div class="grap">				
				<div class="header">
					<div class="page-hd">
					    座位管理
					</div>
				</div>
				<div class="row rowset">
					<div class="seat-wrap">
						<div class="screen">
							荧幕
						</div>
						<div class="row">
							<div class="col-md-2">
								
							</div>
							<div class="col-md-10">								
								<form action="" method="post" accept-charset="utf-8">
									<input type="hidden" name="studioId" id="stuHidden" value="${studio_id}">
									<div class="allseat" id="seatid">
					
										<% 
											int rows = (int)(request.getAttribute("rows"));
											int cols = (int)(request.getAttribute("cols"));
											int[][] seatStatus = (int[][])request.getAttribute("seatStatus");
											for(int i=1;i<=rows;i++){%>
												<ol class="clearfix ol">
												<% for(int j=1;j<=cols;j++){
													if(seatStatus[i][j]==-1){%>
														<li class="trans"><i class="icon-seat-s"></i></li>
													<% }else if(seatStatus[i][j]==1){%>
														<li class="redcolor"><i class="icon-seat-s"></i></li>
													<%}else{%>
														<li><i class="icon-seat-s"></i></li>
													<%}%>												
												 <%}%>
												</ol>
											<%}
										%>
									</div>	
									<div class="radiodiv">
										<div class="labwrap">
											<input type="radio" class="seatchoice" name="seatstatus" id="avaliable" value="可用">可用
											<label for="avaliable"></label>
										</div>
										<div  class="labwrap">
											<input type="radio" class="seatchoice" name="seatstatus" id="damage" value="损坏">损坏
											<label for="damage"></label>
										</div>
										<div class="labwrap">
											<input type="radio" class="seatchoice" name="seatstatus" id="vacancy" value="空缺">空缺
											<label for="vacancy"></label>
										</div>
										<div class="labwrap">
											<input type="button" name="" onclick="delcfm('/ttms/seat/save?studio_id=${studio_id}')" value="保存">
										</div>
									</div>					
								</form>						
							</div>
						</div>											
					</div>
				</div>
			<!-- 信息删除确认 -->  
			<div class="modal fade" id="delcfmModel">  
			  <div class="modal-dialog">  
			    <div class="modal-content message_align">  
			      <div class="modal-header">  
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
			        <h4 class="modal-title">提示信息</h4>  
			      </div>  
			      <div class="modal-body">  
			        <p>已保存成功！</p>  
			      </div>  
			      <div class="modal-footer">  
			         <input type="hidden" id="url"/>  
			         <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  
			         <a  onclick="urlSubmit()" class="btn btn-success" data-dismiss="modal">确定</a>  
			      </div>  
			    </div>
			  </div> 
			</div>				
		</div>
	</div>

	<script src="/ttms/home/js/jquery-1.12.0.min.js"></script>
	<script src="/ttms/home/js/seat.js"></script>
	<script src="/ttms/home/js/delcfm.js"></script>
	<script src="/ttms/home/js/bootstrap.min.js" ></script>
</body>
</html>