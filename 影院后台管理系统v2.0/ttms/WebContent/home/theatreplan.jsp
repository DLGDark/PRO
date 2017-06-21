<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>TheatrePlan</title>
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
					<li><a href="/ttms/home/theatre.jsp">影厅管理</a></li>	   
				    <li class="active">演出计划</li>
				</ol>
				<div class="x_content">
				  <form action="/ttms/schedule/batchDeleteSchedules?studio_id=${studioId}" method="post"> 
					<div class="click-btn clearfix">
						<a onclick="addjup('/ttms/schedule/prePlayFilm')" class="pull-left"><span class="spantxt">添加计划</span></a>
						<input type="submit"  id="delinp" style="display: none;" value="">
						<label for="delinp" class="pull-left mleft"><span  class="spantxt" >批量删除</span></label>
						<a href="/ttms/seat/getInitSeats?studio_id=${studioId}" class="pull-right"><span class="spantxt">座位管理</span></a>
					</div>       
	                <div class="table-responsive">
	                  <table class="table table-striped jambo_table bulk_action">
	                    <thead>
	                      <tr class="headings">
	                        <th>
	                          <input type="checkbox" id="check-all" class="flat">
	                          <label for="check-all"></label>
	                        </th>
	                        <th class="column-title">影厅名称 </th>	
	                        <th class="column-title">片名</th>
	                        <th class="column-title">放映日期</th>
	                        <th class="column-title">放映时间</th>
	                        <th class="column-title">片长</th>
	                        <th class="column-title">价格</th>
	                        <th class="column-title no-link last"><span class="nobr">操作</span></th>		     
	                      </tr>
	                    </thead>

	                    <tbody>
	                    	<c:if test="${not empty scheList}">
	                    		<c:forEach items="${scheList}" var="schedule" varStatus="vs">
			                      <tr class="even pointer">
			                        <td class="a-center ">
			                          <input type="checkbox" class="flat" value="${schedule.sche_id}" name="scheduleIds" id="table_records${vs.index}">
			                          <label for="table_records${vs.index}"></label>
			                        </td>
			                        <td class=" ">${schedule.studio.studio_name}</td>
			                        <td class=" ">${schedule.film.film_name}</td>
			                        <td class=" ">${schedule.film_startdate}</td>
			                        <td class=" ">${schedule.film_begintime}</td>
			                        <td class=" ">${schedule.film.film_length}</td>
			                        <td class="a-right a-right ">${schedule.film.film_price}</td>
			                        <td class=" last">
		                                <a data-toggle="modal" onclick="editsche(this,${schedule.sche_id})"><i class="icon-edit-pencil icon"></i></a>
		                                <a class="pointer" onclick="delcfm('/ttms/schedule/deleteSchedule?sche_id=${schedule.sche_id}&studio_id=${schedule.studio.studio_id}')"><i class="icon-delete-dustbin"></i></a>
			                        </td>
			                      </tr>
		                      	</c:forEach>
	                      	</c:if>
	                    </tbody>
	                  </table>
	                </div>
				  </form>  
										
	            </div>								
			</div>

			<!-- 模态框 -->
			<div class="modal fade" id="addplan" tabindex="-1" role="dialog" aria-labelledby="addplanModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title" id="addplanModalLabel">演出计划信息添加</h4>
			            </div>
			            <form action="/ttms/schedule/saveFilmPlay" method="post" class="form-horizontal" id="addplanform" role="form">
			            	<div class="modal-body">			            	
			            		<input type="hidden" name="studio_id" value="${studioId}">
			            	  <div class="form-group">
			            	    <label for="aplanmname" class="col-sm-2 control-label">片名:</label>
			            	    <div class="col-sm-10">
			            	      <select name="film_id" onchange="funSave(this.value)">
			            	      	<option value="0">请选择放映影片</option>
				            	      	<c:if test="${not empty filmList}">
					            	      	<c:forEach items="${filmList}" var="film">
					            	      		<option value="${film.film_id}">${film.film_name}</option>
					            	      	</c:forEach>
				            	      	</c:if>
			            	      </select>
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="aplandata" class="col-sm-2 control-label">放映日期:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="aplandata" name="film_startdate" onblur="dateRex(this,0)" placeholder="请输入放映日期(格式:2017-01-01)">
			            	      <p id="hintdate" style="color: #ff0000;"></p>
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="aplanplaytime" class="col-sm-2 control-label">放映时间:</label>
			            	    <div class="col-sm-10">
			            	      <select name="film_begintime">
			            	      	<option value="noChooseTime">请选择放映时间</option>
				            	      	<c:if test="${not empty timeSegList}">
					            	      	<c:forEach items="${timeSegList}" var="usetime">
					            	      		<option value="${usetime}">${usetime}</option>
					            	      	</c:forEach>
				            	      	</c:if>
			            	      </select>
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="aplanalltime" class="col-sm-2 control-label">片长:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="aplanalltime" name="film_length" placeholder="片长">
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="aplanprice" class="col-sm-2 control-label">价格:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="aplanprice" name="film_price" placeholder="价格">
			            	    </div>
			            	  </div>       	  
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				                <button type="submit" id="submitplan" class="btn btn-primary">提交更改</button>
				            </div>
			            </form>
			        </div>
			    </div>
			</div>

			<!-- 模态框 -->
			<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title" id="editModalLabel">演出计划信息修改</h4>
			            </div>
			            <form action="/ttms/schedule/updateSchedule" method="post" class="form-horizontal" id="editform" role="form">
			            	<div class="modal-body">			            	
			            	  <input type="hidden" id="sche_id" name="sche_id" value="">
			            	  <input type="hidden" name="studio_id" value="${studioId}">
			            	  <div class="form-group">
			            	    <label for="filmName" class="col-sm-2 control-label">片名:</label>
			            	    <div class="col-sm-10">
			            	      <select id="filmName" name="film_id" onchange="funEdit(this.value)">
			            	      	<option value="0">请选择放映影片</option>
				            	      	<c:if test="${not empty filmList}">
					            	      	<c:forEach items="${filmList}" var="film">
					            	      		<option value="${film.film_id}">${film.film_name}</option>
					            	      	</c:forEach>
				            	      	</c:if>
			            	      </select>
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="editdata" class="col-sm-2 control-label">放映日期:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="editdata" name="film_startdate" onblur="dateRex(this)" placeholder="请输入放映日期">
			            	      <p id="hintde" style="color: #ff0000;"></p>
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="editplaytime" class="col-sm-2 control-label">放映时间:</label>
			            	    <div class="col-sm-10">
			            	       <select id="startTime" name="film_begintime">
			            	      	<option value="noChooseTime">请选择放映时间</option>
				            	      	<c:if test="${not empty timeSegList}">
					            	      	<c:forEach items="${timeSegList}" var="usetime">
					            	      		<option value="${usetime}">${usetime}</option>
					            	      	</c:forEach>
				            	      	</c:if>
			            	      </select>
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="editall" class="col-sm-2 control-label">片长:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="editall" name="film_length" placeholder="请输入片长">
			            	    </div>
			            	  </div>
			            	  <div class="form-group">
			            	    <label for="editprice" class="col-sm-2 control-label">价格:</label>
			            	    <div class="col-sm-10">
			            	      <input type="text" class="form-control" id="editprice" name="film_price" placeholder="请输入价格">
			            	    </div>
			            	  </div>  
			            	     	  
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				                <button type="submit" id="submitedit" class="btn btn-primary">提交更改</button>
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
	<script>
		function addjup(url) {  	
		      $('#url').val(url);					//给会话中的隐藏属性URL赋值  
		      $('#addplan').modal();  
		}  
		function urlSubmit(){  
		   var url=$.trim($("#addurl").val());			//获取会话中的隐藏属性URL  
		   window.location.href=url;    
		}
		function funSave(film_id){	//获取影片对象中的片长和价格
			$.post("/ttms/film/getFilmInfo",{"film_id":film_id},function(result){
				$('#aplanalltime').val(result.film_length);
				$('#aplanprice').val(result.film_price);
			},"json");
		}
		function funEdit(film_id){	//获取影片对象中的片长和价格
			$.post("/ttms/film/getFilmInfo",{"film_id":film_id},function(result){
				$('#editall').val(result.film_length);
				$('#editprice').val(result.film_price);
			},"json");
		}
		function editsche(obj,sche_id) {  
		    var tds= $(obj).parent().parent().find('td');  
		    $('#filmName').val(tds.eq(2).text());  
		    $('#editdata').val(tds.eq(3).text());
		    $('#startTime').val(tds.eq(4).text());
		    $('#editall').val(tds.eq(5).text());
		    $('#editprice').val(tds.eq(6).text());
		    $('#sche_id').val(sche_id);
		    
		    $('#editModal').modal('show');   
		} 
	</script>
	<script src="/ttms/home/js/jquery-1.12.0.min.js"></script>
	<script src="/ttms/home/js/delcfm.js"></script>
	<script src="/ttms/home/js/dateRegexp.js"></script>
	<script src="/ttms/home/js/theatreplan.js"></script>
	<script src="/ttms/home/js/bootstrap.min.js" ></script>
</body>
</html>