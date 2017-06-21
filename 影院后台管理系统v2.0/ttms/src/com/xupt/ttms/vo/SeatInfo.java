package com.xupt.ttms.vo;

/**
 * 
 * @author lenovo
 * @category 座位信息类
 */
public class SeatInfo {

	private Integer seat_id; // 座位编号
	private Integer seat_status;// 座位状态
	private Integer seat_row;// 座位行号
	private Integer seat_col;// 座位列号
	private Integer studio_id;// 演出厅编号
	private StudioInfo studio;	//演出厅对象(多对一)

	public Integer getSeat_id() {
		return seat_id;
	}

	public void setSeat_id(Integer seat_id) {
		this.seat_id = seat_id;
	}

	public Integer getSeat_status() {
		return seat_status;
	}

	public void setSeat_status(Integer seat_status) {
		this.seat_status = seat_status;
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

	public Integer getStudio_id() {
		return studio_id;
	}

	public void setStudio_id(Integer studio_id) {
		this.studio_id = studio_id;
	}

	public StudioInfo getStudio() {
		return studio;
	}

	public void setStudio(StudioInfo studio) {
		this.studio = studio;
	}
	
	

}
