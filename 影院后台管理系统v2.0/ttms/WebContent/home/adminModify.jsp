<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Admin</title>
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
			    			<a href="/ttms/employee/getEmpInfo"><i class="icon-modify icon"></i>修改信息</a>
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
					    系统管理员信息修改
					</div>
				</div>
				<div class="row">
					<div class="form-box">
						<form action="/ttms/employee/update" method="post" accept-charset="utf-8" class="form-horizontal" role="form">
							<input type="hidden" name="emp_id" value="${empInfo.emp_id}">
							<div class="form-group">
							   	<label for="adminname" class="col-sm-2 control-label">姓名</label>
							   	<div class="col-sm-8">
							    	<input type="text" class="form-control formbor" id="adminname" name="emp_name" value="${empInfo.emp_name}" placeholder="请输入名字">
								</div>
							</div>
							<div class="form-group">
							  <label for="adminsex" class="col-sm-2 control-label">性别:</label>
							  <div class="col-sm-8">
							    <input type="text" class="form-control formbor" id="adminsex" name="emp_sex" value="${empInfo.emp_sex}" placeholder="请输入性别">
							  </div>
							</div>
							<div class="form-group">
							  <label for="adminage" class="col-sm-2 control-label">年龄:</label>
							  <div class="col-sm-8">
							    <input type="text" class="form-control formbor" id="adminage" name="emp_age" value="${empInfo.emp_age}" placeholder="请输入年龄">
							  </div>
							</div>
							<div class="form-group">
							  <label for="adminposition" class="col-sm-2 control-label">职位:</label>
							  <div class="col-sm-8">
							    <input type="text" class="form-control formbor" id="adminposition" name="emp_position" value="${empInfo.emp_position}" placeholder="请输入职位">
							  </div>
							</div>
							<div class="form-group">
							  <label for="adminbirthday" class="col-sm-2 control-label">出生年月:</label>
							  <div class="col-sm-8">
							    <input type="text" class="form-control formbor" id="adminbirthday" name="emp_dob" value="${empInfo.emp_dob}" placeholder="请输入出生年月">
							  </div>
							</div>
							<div class="form-group">
							  <label for="adminphone" class="col-sm-2 control-label">联系电话:</label>
							  <div class="col-sm-8">
							    <input type="text" class="form-control formbor" id="adminphone" name="emp_tel" value="${empInfo.emp_tel}" placeholder="请输入联系电话">
							  </div>
							</div>
							<div class="form-group">
							  <label for="adminaddr" class="col-sm-2 control-label">地址:</label>
							  <div class="col-sm-8">
							    <input type="text" class="form-control formbor" id="adminaddr" name="emp_addr" value="${empInfo.emp_addr}" placeholder="请输入地址">
							  </div>
							</div>
							<div class="form-group">
							  <label for="adminemail" class="col-sm-2 control-label">邮箱:</label>
							  <div class="col-sm-8">
							    <input type="text" class="form-control formbor" id="adminemail" name="emp_email" value="${empInfo.emp_email}" placeholder="请输入邮箱">
							  </div>
							</div>
							<div class="form-group">
							  <label for="adminaccount" class="col-sm-2 control-label">账号:</label>
							  <div class="col-sm-8">
							    <input type="text" class="form-control formbor" id="adminaccount" name="emp_account" value="${empInfo.emp_account}" placeholder="请输入账号">
							  </div>
							</div>
							<div class="form-group">
							  <label for="adminpasswd" class="col-sm-2 control-label">密码:</label>
							  <div class="col-sm-8">
							    <input type="text" class="form-control formbor" id="adminpasswd" name="emp_pass" value="${empInfo.emp_pass}" placeholder="请输入密码">
							  </div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-8">
							    	<button type="submit" class="btn  btnmdy">提交</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="/ttms/home/js/jquery-1.12.0.min.js"></script>
	<script src="/ttms/home/js/bootstrap.min.js" ></script>
</body>
</html>