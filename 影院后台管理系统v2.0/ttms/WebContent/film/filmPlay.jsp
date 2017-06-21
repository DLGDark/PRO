<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看某影片的放映情况</title>
<script type="text/javascript" src="/ttms/js/jquery-1.11.2.js"></script>
<script type="text/javascript">
	function showPlayFilm(film_id){
 		$.post('/ttms/schedule/getFilmPlay',{"film_id":film_id},function(result){
			var tbody1 = $("#tbody1");
			tbody1.empty();
			var html = "";
			console.log(result);
 			if(result){
 				console.log(232);
 				for (var i = 0; i < result.length; i++) {
					console.log(result[i]);
					for(var item in result[i]) {
						console.log(item, result[i].sche_id);
					}
  					var part = "<tr><td>"+ result[i].sche_id +"</td><td>"+result[i].film_begintime+"</td>"
							+ "<td>"+result[i].film_endtime+"</td><td>"+result[i].film_id+"</td>"
							+ "<td>"+result[i].studio_id+"</td><td><a href='/ttms/order/getSeatsSpread?studio_id="+result[i].studio_id+"&film_id="+result[i].film_id+"&sche_id="+result[i].sche_id+"'>买票</a></td></tr>"; 
					html += part;	 	
				} 
				tbody1.html(html);
			}  
		}, "JSON");  
	}
</script>
</head>
<body>
	请输入观看的影片编号：<input type="text" name="film_id" onchange="showPlayFilm(this.value)"/>
	<table>
		<thead>
			<tr>
				<th>演出计划编号</th>
				<th>影片开始时间</th>
				<th>影片结束时间</th>
				<th>影片编号</th>
				<th>演出厅编号</th>
				<th>操作</th>
			<tr>
		</thead>
		<tbody id="tbody1">
		</tbody>
	</table>
</body>
</html>