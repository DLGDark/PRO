package com.xupt.ttms.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.jdbc.StandardSocketFactory;
import com.xupt.ttms.common.Utils;
import com.xupt.ttms.service.FilmService;
import com.xupt.ttms.service.OrderService;
import com.xupt.ttms.vo.FilmInfo;
import com.xupt.ttms.vo.OrderInfo;
import com.xupt.ttms.vo.SeatInfo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 
 * @author lenovo
 * @category 订单的控制器
 */
@Controller
@RequestMapping(path="/order")
public class OrderController {
	
	private int tickets[][] = new int[10][12];
	
	@Resource
	private OrderService orderService;
	@Resource
	private FilmService filmService;

	/*
	 * 获取演出厅座位的分布情况
	 */
	@RequestMapping(path="/getSeatsSpread")
	public String getSeatsSpread(HttpServletRequest request,ModelMap model){
		//获取客户端提交的参数
		Integer studio_id = Utils.getParameter(request, "studio_id", Integer.class);
		Integer film_id = Utils.getParameter(request, "film_id", Integer.class);
		Integer sche_id = Utils.getParameter(request, "sche_id", Integer.class);
		List<SeatInfo> seatList = null;
		FilmInfo filmInfo = null;
		//调用数据库中的数据
		if(studio_id != null){
			seatList = this.orderService.getSeatsSpread(studio_id);
		}
		if(film_id != null){
			filmInfo = this.filmService.getFilmInfoByFilmId(film_id);
		}
		//将其数据放入数据模型中
		if(seatList != null){
			model.put("seatList", seatList);
		}
		if(filmInfo != null){
			model.put("filmInfo", filmInfo);
		}
		model.put("sche_id", sche_id);
		return "order/purchaseTicket";
	}
	
	/*
	 * 提交订
	 */
	@RequestMapping(path="/submitOrder")
	public String submitOrder(HttpServletRequest request){
		String string = request.getParameter("seats");
		System.out.println(string);
				
		
		//获取提交的参数(座位个数，演出计划编号，演出厅编号，影片价格)
		String[] seatRowCols = request.getParameterValues("seatRowCol");
		Integer sche_id = Utils.getParameter(request, "sche_id", Integer.class);
		Integer studio_id = Utils.getParameter(request, "studio_id", Integer.class);
		Float film_price = Utils.getParameter(request, "film_price", Float.class);
		
		int seatRows[] = new int[seatRowCols.length];
		int seatCols[] = new int[seatRowCols.length];
		//将其座位的行列号转换为具体的整型数组
		for (int i = 0; i < seatRowCols.length; i++) {
			String[] str = seatRowCols[i].split("-");
			seatRows[i] = Integer.valueOf(str[0]);
			seatCols[i] = Integer.valueOf(str[1]);
		}
		
		//创建一个订单对象
		OrderInfo orderInfo = new OrderInfo();
		orderInfo.setSche_id(sche_id);
		orderInfo.setOrder_price(film_price * seatRowCols.length);
		orderInfo.setOrder_status(2);
		orderInfo.setOrder_time(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		
		//生成一个订单
		boolean result = this.orderService.saveOrder(seatRows,seatCols,studio_id,orderInfo);
		System.out.println(result);
		return "index";
	}
}
