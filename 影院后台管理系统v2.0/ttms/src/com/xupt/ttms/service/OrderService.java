package com.xupt.ttms.service;

import java.util.List;

import com.xupt.ttms.vo.OrderInfo;
import com.xupt.ttms.vo.SeatInfo;

/**
 * 
 * @author lenovo
 * @category 订单的业务逻辑层接口
 */
public interface OrderService {

	/*
	 * 根据演出厅编号，获取该演出厅座位的分布情况
	 */
	List<SeatInfo> getSeatsSpread(Integer studio_id);

	/*
	 * 提交订单
	 */
	boolean saveOrder(int[] seatRows, int[] seatCols, Integer studio_id,OrderInfo orderInfo);

}
