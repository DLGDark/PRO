<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Theatre</title>
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
					    影厅管理
					</div>
				</div>
				<ol class="breadcrumb bg-head">		
					<li><a href="/ttms/home/home.jsp">Home</a></li>	   
				    <li class="active">影厅管理</li>
				</ol>
				<div class="x_content">
            <div class="add-people">
              <button class="btn btn-primary" data-toggle="modal" data-target="#addModal">添加影厅</button>
            </div>	          
          	<div class="row">   
          		<c:if test="${not empty studioList}">
          			<c:forEach items="${studioList}" var="studio">
          				
	             		<div class="col-sm-6 col-md-3">
	             		    <div class="thumbnail">
	             		        <a href="/ttms/schedule/getSchedules?studio_id=${studio.studio_id}">
	             		        	<img src="${studio.studio_img}" alt="StudioImg">
	                        	</a>
	           		        	<div class="caption stdbg clearfix">
	           		        	  	<h3 class="stdname">${studio.studio_name}</h3>
		                          	<div class="operaicon">
		                          		<span style="display: none;">${studio.studio_name}</span>
		                          		<span style="display: none;">${studio.studio_type}</span>
		                          		<span style="display: none;">${studio.studio_desc}</span>
		                          		<span style="display: none;">${studio.studio_img}</span>									          								        			
		                            	<span onclick="editMdy(this,${studio.studio_id})" class="pointer"><i class="icon-edit-pencil icon"></i></span>
		                            	<span class="pointer" onclick="delcfm('/ttms/studio/deleteStudio?studio_id=${studio.studio_id}')"><i class="icon-delete-dustbin"></i></span>
		                          	</div>
	           		        	</div>                   		        
	             		    </div>
	             		</div>
             		</c:forEach>		
             	</c:if>
          	</div>	

            <!-- 模态框（Modal） -->
            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="addModalLabel">影厅信息添加</h4>
                        </div>
                        <div class="modal-body">
                          <form action="/ttms/studio/addStudio" method="post" class="form-horizontal" id="addform" role="form" enctype="multipart/form-data">
                          	<div class="form-group">
                              <label for="theatrename" class="col-sm-2 control-label">影厅名称:</label>
                              <div class="col-sm-10">
                                <input type="text" class="form-control" id="theatrename" name="studio_name" placeholder="请输入影厅名称">
                              </div>
                            </div>
                            <div class="form-group">
                              <label for="theatretype" class="col-sm-2 control-label">影厅类型:</label>
                              <div class="col-sm-10">
                                <input type="text" class="form-control" id="theatretype" name="studio_type" placeholder="请输入影厅类型">
                              </div>
                            </div>
                            <div class="form-group">
                              <label for="seattype" class="col-sm-2 control-label">座位类型:</label>
                              <div class="col-sm-10">
                                <select name="studio_rowcols">
                                  <option value="0/0">请选择座位类型</option>
                                  <option value="6/8">小型(6*8)</option>
                                  <option value="9/10">中型(9*10)</option>
                                  <option value="10/12">大型(10*12)</option>
                                </select>
                              </div>
                            </div>                     
                            <div class="form-group">
							    <label for="description" class="col-sm-2 control-label">简介:</label>
							    <div class="col-sm-10">
							      <textarea class="form-control" id="description" rows="8" cols="12" name="studio_desc"></textarea>
							    </div>
							</div> 
							<div class="form-group inputfile" id="fileadd">
                               <label for="addimgfile">请选择要上传的影厅照片(尺从大小最好是270*360)</label>                         	
                               <input type="file" id="addimgfile" name="addImg">                             	                               
                            </div>                                                                         
	                        <div class="modal-footer">
	                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	                            <button type="submit" id="submitadd" class="btn btn-primary">添加</button>
	                        </div>
                          </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 模态框（Modal） -->
            <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true" enctype="multipart/form-data">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="addModalLabel">影厅信息修改</h4>
                        </div>
                    	<div class="modal-body">
                        	<form action="/ttms/studio/updateStudio" method="post" enctype="multipart/form-data" class="form-horizontal" id="addform">                    
                            	<input type="hidden" id="studioId" name="studio_id" value="">
                            	<input type="hidden" id="studioImg" name="studio_img" value="">
                            	<div class="form-group">
                                  	<label for="theaname" class="col-sm-2 control-label">影厅名称:</label>
                                  	<div class="col-sm-10">
                                    	<input type="text" class="form-control" id="theaname" name="studio_name" placeholder="请输入影厅名称">
                                  	</div>
                            	</div>
                            	<div class="form-group">
                                  	<label for="theatype" class="col-sm-2 control-label">影厅类型:</label>
                                  	<div class="col-sm-10">
                                    	<input type="text" class="form-control" id="theatype" name="studio_type" placeholder="请输入影厅类型">
                                  	</div>
                            	</div>
                            	<div class="form-group">
                                  	<label for="seate" class="col-sm-2 control-label">座位类型:</label>
                                  	<div class="col-sm-10">
                                    	<select name="studio_rowcols">
                                      		<option value="0/0">请选择座位类型</option>
                                      		<option value="6/8">小型(6*8)</option>
                                      		<option value="9/10">中型(9*10)</option>
                                      		<option value="10/12">大型(10*12)</option>
                                    	</select>
                                  	</div>
                            	</div>
                            	<div class="form-group">
							      	<label for="mintrodu" class="col-sm-2 control-label">简介:</label>
							      	<div class="col-sm-10">
							        	<textarea class="form-control" id="mintrodu" rows="8" cols="12" name="studio_desc"></textarea>
							      	</div>
								</div>                              
                           		<div class="form-group inputfile" id="filesub">
                               <label for="mdyimgfile">请选择要上传的影厅照片(尺从大小最好是270*360)</label>                         	
                               <input type="file" id="mdyimgfile" name="file">                             	                               
                            </div>                                                          
	                        	<div class="modal-footer">
	                            	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	                            	<button type="submit" id="submitmdy" class="btn btn-primary">修改</button>
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
	<script type="text/javascript">
		function editMdy(obj,studio_id) {  
			var tds= $(obj).parent().find('span');
		   	$('#theaname').val(tds.eq(0).text());
		    $('#theatype').val(tds.eq(1).text());
		    $('#mintrodu').val(tds.eq(2).text());		    		   
		    $('#studioImg').val(tds.eq(3).text());
		    
		    $('#nameId').val(studio_id);
		    
		    $('#studioId').val(studio_id);
	
		    
		    $('#modifyModal').modal('show');
		} 
	</script>
	<script src="/ttms/home/js/jquery-1.12.0.min.js"></script>
  	<script src="/ttms/home/js/delcfm.js"></script>
	<script src="/ttms/home/js/bootstrap.min.js" ></script>
</body>
</html>
</html>