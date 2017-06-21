package com.xupt.ttms.vo;

/**
 * 
 * @author lenovo
 * @category 订单实体类
 */
public class OrderInfo {

	private Integer order_id;// 订单编号
	private Integer emp_id;// 员工编号
	private Integer sche_id;// 演出计划编号
	private Integer order_status;// 订单状态
	private String order_time;// 日期
	private Float order_price; // 订单总价格

	public Integer getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}

	public String getOrder_time() {
		return order_time;
	}

	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}

	public Integer getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}

	public Integer getSche_id() {
		return sche_id;
	}

	public void setSche_id(Integer sche_id) {
		this.sche_id = sche_id;
	}

	public Integer getOrder_status() {
		return order_status;
	}

	public void setOrder_status(Integer order_status) {
		this.order_status = order_status;
	}

	public Float getOrder_price() {
		return order_price;
	}

	public void setOrder_price(Float order_price) {
		this.order_price = order_price;
	}

}
