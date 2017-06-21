package com.xupt.ttms.vo;

/**
 * 
 * @author lenovo
 * @category 演出厅信息类
 */
public class StudioInfo {

	private Integer studio_id;// 演出厅编号
	private String studio_name;// 演出厅名称
	private Integer seat_rows;// 座位总行数
	private Integer seat_cols;// 座位总列数
	private String studio_type;// 演出厅类型
	private String studio_desc;// 演出厅描述
	private String studio_img;// 影厅图片

	public Integer getStudio_id() {
		return studio_id;
	}

	public void setStudio_id(Integer studio_id) {
		this.studio_id = studio_id;
	}

	public String getStudio_name() {
		return studio_name;
	}

	public void setStudio_name(String studio_name) {
		this.studio_name = studio_name;
	}

	public Integer getSeat_rows() {
		return seat_rows;
	}

	public void setSeat_rows(Integer seat_rows) {
		this.seat_rows = seat_rows;
	}

	public Integer getSeat_cols() {
		return seat_cols;
	}

	public void setSeat_cols(Integer seat_cols) {
		this.seat_cols = seat_cols;
	}

	public String getStudio_type() {
		return studio_type;
	}

	public void setStudio_type(String studio_type) {
		this.studio_type = studio_type;
	}

	public String getStudio_desc() {
		return studio_desc;
	}

	public void setStudio_desc(String studio_desc) {
		this.studio_desc = studio_desc;
	}

	public String getStudio_img() {
		return studio_img;
	}

	public void setStudio_img(String studio_img) {
		this.studio_img = studio_img;
	}

}
