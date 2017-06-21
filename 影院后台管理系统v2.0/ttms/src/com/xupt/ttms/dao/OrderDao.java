package com.xupt.ttms.dao;

import java.util.List;

import com.xupt.ttms.vo.OrderInfo;
import com.xupt.ttms.vo.SeatInfo;

/**
 * 
 * @author lenovo
 * @category 订单数据库访问层接口
 */
public interface OrderDao {

	/*
	 * 根据演出厅编号，获取该演出厅座位的分布情况
	 */
	List<SeatInfo> getSeatsSpread(Integer studio_id);

	/*
	 * 提交订单
	 */
	void saveOrder(OrderInfo orderInfo);

	/*
	 * 删除订单记录
	 */
	void deleteOrder(OrderInfo orderInfo);

	/*
	 * 根据演出计划编号，获取所有的订单对象
	 */
	OrderInfo getOrderInfoByScheId(int i);

	/*
	 * 根据订单编号，删除订单信息
	 */
	void deleteOrderInfoByOrderId(Integer order_id);

}
