<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>People</title>
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
	<link rel="stylesheet" type="text/css" href="/ttms/home/js/dataTables/dataTables.bootstrap.css">
	

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
				<div class="row">
                    <div class="col-md-12">
						<div class="header">
							<div class="page-hd">
							    成员管理
							</div>
						</div>
                    </div>
                </div> 
                 <!-- /. ROW  -->
				               
	            <div class="row">
	                <div class="col-md-12">
	                	<ol class="breadcrumb bg-head">	
	                		<li><a href="/ttms/home/home.jsp">Home</a></li>		   
	                	    <li class="active">成员信息</li>
	                	</ol>
	                    <!-- Advanced Tables -->
	                    <div class="panel panel-default">
	                        <div class="panel-heading">
	                             员工信息表
	                        </div>
	                        <div class="panel-body">
	                            <div class="table-responsive">
	                            	<div class="add-people">
	                            		<button class="btn btn-primary" data-toggle="modal" data-target="#addModal">添加人员</button>
	                            	</div>
	                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
	                                    <thead>
	                                        <tr>
	                                            <th>姓名</th>
	                                            <th>性别</th>
	                                            <th>年龄</th>
	                                            <th>职位</th>
	                                            <th>出生年月</th>
	                                            <th>联系电话</th>
	                                            <th>常驻地址</th>
	                                            <th>邮箱</th>
	                                            <th>账号</th>
	                                            <th>密码</th>
	                                            <th>操作</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <c:if test="${not empty employeeList}">
	                                        	<c:forEach items="${employeeList}" var="emp">
	                                        		<tr>
	                                        			<td>${emp.emp_name}</td>
			                                            <td>${emp.emp_sex}</td>
			                                            <td>${emp.emp_age}</td>
			                                            <td>${emp.emp_position}</td>
			                                            <td>${emp.emp_dob}</td>
			                                            <td>${emp.emp_tel}</td>
			                                            <td>${emp.emp_addr}</td>
			                                            <td>${emp.emp_email}</td>
			                                            <td>${emp.emp_account}</td>
			                                            <td>${emp.emp_pass}</td>
			                                            <td>
			                                            	<a onclick="editInfo(this,${emp.emp_id})" class="pointer"><i class="icon-edit-pencil icon"></i></a>
			                                            	<a class="pointer" onclick="delcfm('/ttms/employee/delEmpInfo/${emp.emp_id}')"><i class="icon-delete-dustbin"></i></a>
			                                            </td>
	                                        		</tr>
	                                        	</c:forEach>
	                                        </c:if>
	                                    </tbody>
	                                </table>
	                            </div>
	                            
	                        </div>
	                    </div>
	                    <!--End Advanced Tables -->
	                </div>
	            </div>
			</div>

			<!-- 模态框（Modal） -->
			<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title" id="modifyModalLabel">人员信息修改</h4>
			            </div>
			            <form action="/ttms/employee/updateEmpInfo" method="post" class="form-horizontal" id="mdyform" role="form">
			            	<div class="modal-body">		            	
			            	  <input type="hidden" id="nameId" name="emp_id"/>
			            	  <div class="form-group">
			            	    <label for="mdyname" class="col-sm-2 control-label">姓名:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="mdyname" name="emp_name" placeholder="请输入姓名">
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="mdysex" class="col-sm-2 control-label">性别:</label>
			            	    <div class="col-sm-10">
			            	      <input type="radio" id="mdysexwomen" value="女" name="emp_sex">女
			            	      <input type="radio" id="mdysexman" value="男" name="emp_sex">男
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="mdyage" class="col-sm-2 control-label">年龄:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="mdyage" name="emp_age" placeholder="请输入年龄">
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="mdyposition" class="col-sm-2 control-label">职位:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="mdyposition" name="emp_position" placeholder="请输入职位">
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="mdybirthday" class="col-sm-2 control-label">出生年月:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="mdybirthday" name="emp_dob" placeholder="请输入出生年月">
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="mdyphone" class="col-sm-2 control-label">联系电话:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="mdyphone" name="emp_tel" placeholder="请输入联系电话">
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="mdyaddr" class="col-sm-2 control-label">地址:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="mdyaddr" name="emp_addr" placeholder="请输入地址">
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="mdyemail" class="col-sm-2 control-label">邮箱:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="mdyemail" name="emp_email" placeholder="请输入邮箱">
			            	    </div>
			            	  </div>       	  			            	
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				                <button type="submit" id="submitmdy" class="btn btn-primary">更新</button>
				            </div>
			            </form>
			        </div>
			    </div>
			</div>

			<!-- 模态框（Modal） -->
			<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title" id="addModalLabel">人员信息添加</h4>
			            </div>
			            <form action="/ttms/employee/addEmp" class="form-horizontal" id="addform" role="form">
			            	<div class="modal-body">
			            	  <div class="form-group">
			            	    <label for="addname" class="col-sm-2 control-label">姓名:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="addname" name="emp_name" placeholder="请输入姓名">
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="addsex" class="col-sm-2 control-label">性别:</label>
			            	    <div class="col-sm-10">
			            	      <input type="radio" id="addsexwomen" value="女" name="emp_sex">女
			            	      <input type="radio" id="addsexman" value="男" name="emp_sex">男
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="addage" class="col-sm-2 control-label">年龄:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="addage" name="emp_age" placeholder="请输入年龄">
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="addposition" class="col-sm-2 control-label">职位:</label>
			            	    <div class="col-sm-10">
									<select name="emp_position">
										<option value="0">请选择职位</option>
										<option value="售票员">售票员</option>
										<option value="普通员工">普通员工</option>
									</select>
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="addbirthday" class="col-sm-2 control-label">出生年月:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="addbirthday" name="emp_dob" placeholder="请输入出生年月">
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="addphone" class="col-sm-2 control-label">联系电话:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="addphone" name="emp_tel" placeholder="请输入联系电话">
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="addaddr" class="col-sm-2 control-label">地址:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="addaddr" name="emp_addr" placeholder="请输入地址">
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="addemail" class="col-sm-2 control-label">邮箱:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="addemail" name="emp_email" placeholder="请输入邮箱">
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="addaccount" class="col-sm-2 control-label">账号:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="addaccount" name="emp_account" placeholder="请输入账号">
			            	    </div>
			            	  </div>			            	
			            	</div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				                <button type="submit" id="submitadd" class="btn btn-primary">添加</button>
				            </div>
			            </form>
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
			        <p>您确认要删除吗？</p>  
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
	<script src="/ttms/home/js/edit.js"></script>
	<script src="/ttms/home/js/delcfm.js"></script>
	<script src="/ttms/home/js/dataTables/jquery.dataTables.js"></script>
	<script src="/ttms/home/js/dataTables/dataTables.bootstrap.js"></script>
	<script src="/ttms/home/js/bootstrap.min.js" ></script>
	<script>
		/*加载dataTable插件*/
        $(document).ready(function () {
            $('#dataTables-example').dataTable();
        });
    </script>

</body>
</html>