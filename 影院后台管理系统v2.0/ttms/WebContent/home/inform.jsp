<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Inform</title>
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
		        <a class="navbar-brand" href="home.html">TTMS</a>
		    </div>
		    <!-- 登录人员信息设置 -->
		    <ul class="nav navbar-nav navbar-right">
		    	<li class="dropdown">
			    	<a href="#" class="dropdown-toggle fli" data-toggle="dropdown">
			    		<img src="/ttms/home/img/1.jpg" alt="humanPhoto">
			    	</a>
			    	<ul class="dropdown-menu">
			    		<li class="ph">
			    			<a href="/ttms/home/adminModify.jsp"><i class="icon-modify icon"></i>修改信息</a>
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
				<form action="/ttms/notice/batchDeleteNotices" method="post">
				<div class="row rowset">
					<div class="col-md-12">
						<input type="button" name="" data-toggle="modal" data-target="#informModal" class="btn btn-primary bright" value="添加公告">
						<input type="button" name="" class="btn btn-primary bright" onclick="delbox()" value="批量操作">
						<button type="submit" id="delete" class="btn btn-danger bright" style="display: none;">删除</button>
					</div>
				</div>
				
				<div class="row rowset">
				<c:if test="${not empty noticeList}">
					<c:forEach items="${noticeList}" var="notice" varStatus="vs">
							<div class="col-md-6">
								<div class="panel relativ">
									<div class="panel-heading head-green">
										通知${vs.index+1}
									</div>
									<div class="panel-body">
										<p>${notice.notice_content}</p>
									</div>
								</div>
								<div class="absol">
									<input type="checkbox" class="flat" style="display: none;" value="${notice.notice_id}" name="checkedNoticeIds" id="informbox${vs.index}">
									<label for="informbox${vs.index}" class="labelchk" style="display: none;"></label>
								</div>						
							</div>
					</c:forEach>
				</c:if>
				</div>	
				</form>
				<!-- <div class="row rowset">
					<div class="col-md-6">
						<div class="panel relativ">
							<div class="panel-heading head-green">
								通知
							</div>
							<div class="panel-body">
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ut ante in sapien blandit luctus sed ut lacus. Phasellus urna est, faucibus nec ultrices placerat, feugiat et ligula. Donec vestibulum magna a dui pharetra molestie. Fusce et dui urna.</p>
							</div>
						</div>
						<div class="absol">
							<input type="checkbox" class="flat" style="display: none;" name="table_records" id="informbox1">
							<label for="informbox1" class="labelchk" style="display: none;"></label>
						</div>						
					</div>
				</div> -->
				<!-- 模态框（Modal） -->
				<div class="modal fade" id="informModal" tabindex="-1" role="dialog" aria-labelledby="informLable" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                <h4 class="modal-title" id="informLable">公告信息添加</h4>
				            </div>
				            <form action="/ttms/notice/publishNotice" method="post" class="form-horizontal" id="addform" role="form">
				            	<div class="modal-body">				            	
				            	  <div class="form-group">
				            	    <label for="addname" class="col-sm-2 control-label">内容 :</label>
				            	    <div class="col-sm-10">
				            	      <textarea name="notice_content" rows="10" cols="60"></textarea>
				            	    </div>
				            	  </div>				              	  
					            </div>
					            <div class="modal-footer">
					                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					                <button type="submit" id="submitinf" class="btn btn-primary">提交</button>
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
	</div>

	<script>
		/*通过封装 getElementsByClassName 来处理兼容性*/
		function getElementsByClassName(className){
			var results=[];
			var tags=document.getElementsByTagName('*');
			for(var item in tags){
				if(tags[item].nodeType==1){
					if(tags[item].getAttribute('class')==className){
						results.push(tags[item]);
					}
				}
			}
			return results;
		}
		function delbox(){
			var del=document.getElementById('delete');
			var lab=document.getElementsByClassName('labelchk');
			var n=lab.length;
			for(var i=0;i<n;i++){
				lab[i].style.display="block";
			}
			del.style.display="inline-block";
		}
		
		function delcfm(url) {  	
		      $('#url').val(url);					//给会话中的隐藏属性URL赋值  
		      $('#delcfmModel').modal();  
		}  
		function urlSubmit(){  
		   var url=$.trim($("#url").val());			//获取会话中的隐藏属性URL  
		   window.location.href=url;    
		}
	</script>
	
	<script src="/ttms/home/js/bootstrap.min.js" ></script>
</body>
</html>