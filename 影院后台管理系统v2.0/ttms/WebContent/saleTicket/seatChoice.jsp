<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>TTMS</title>
	<meta name="description" content="">
	<meta name="keywords" content="">

	<link rel="stylesheet" type="text/css" href="/ttms/saleTicket/css/reset.css">
	<link rel="stylesheet" type="text/css" href="/ttms/saleTicket/css/movieChoice.css">
	<link rel="stylesheet" type="text/css" href="/ttms/saleTicket/css/fonts.css">

</head>
<body>
	<div id="bgImage" class="bgImage"></div>
	<div class="block">
		<div class="head">
			<div class="title">
				<span class="title-font">TTMS影院</span>

				<span class="titaddr">
					<p>地址:西安长安区子午的大道邮电大学东面300m处</p>
					<p>电话: 029-2564 3352</p>
				</span>
			</div>
		</div>
		<ol class="nav">	
			<li><a href="movieChoice.html">选择电影</a></li>
			<span>/</span>
			<li><a href="moviePlan.html">演出安排</a></li>
			<span>/</span>		   
		    <li class="active">选座购票</li>
		</ol>
		<div class="wrapper">
			<div class="content">
				<form action="" method="get" accept-charset="utf-8">
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
												<%}else if(seatStatus[i][j]==2){%>
													<li class="green"><i class="icon-seat-s"></i></li>
												<%}else{%>
													<li><i class="icon-seat-s"></i></li>
												<%}%>												
											 <%}%>
											</ol>
										<%}
										%>

					</div>	
					
						<div class="labwrap">
							<input type="button" name="" onclick="seatPost()" value="保存">
						</div>					
				</form>
			</div>
		</div>
	</div>
	<script src="/ttms/saleTicket/js/jquery-1.12.0.min.js"></script>
	<script src="/ttms/saleTicket/js/seatpay.js"></script>
</body>
</html>