package com.xupt.ttms.vo;

import java.util.Date;

/**
 * 
 * @author lenovo
 * @category 订单信息类
 */
public class TicketInfo {

	private Integer ticket_id;// 票编号
	private Integer order_id;// 订单编号
	private Integer sche_id;// 演出计划编号

	public Integer getSche_id() {
		return sche_id;
	}

	public void setSche_id(Integer sche_id) {
		this.sche_id = sche_id;
	}

	private Integer seat_row;// 座位行号
	private Integer seat_col;// 座位列号
	private String ticket_date;// 买票时间
	private Float ticket_price;// 票价格

	public Integer getTicket_id() {
		return ticket_id;
	}

	public void setTicket_id(Integer ticket_id) {
		this.ticket_id = ticket_id;
	}

	public Integer getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}

	public Integer getSeat_row() {
		return seat_row;
	}

	public void setSeat_row(Integer seat_row) {
		this.seat_row = seat_row;
	}

	public Integer getSeat_col() {
		return seat_col;
	}

	public void setSeat_col(Integer seat_col) {
		this.seat_col = seat_col;
	}

	public String getTicket_date() {
		return ticket_date;
	}

	public void setTicket_date(String ticket_date) {
		this.ticket_date = ticket_date;
	}

	public Float getTicket_price() {
		return ticket_price;
	}

	public void setTicket_price(Float ticket_price) {
		this.ticket_price = ticket_price;
	}

}
