package com.xupt.ttms.vo;

import java.util.List;

/**
 * 
 * @author lenovo
 * @category 影片信息类
 */
public class FilmInfo {

	private Integer film_id; // 影片编号
	private String film_name; // 影片名称
	private Integer film_length;// 影片长度
	private String film_type;// 影片类型
	private String film_stars;// 影片主演
	private String film_desc;// 影片简介
	private Float film_price;// 影片价格
	private String film_datetime;// 影片上映时间
	private String film_area;// 影片上映地区
	private String film_img;// 影片图片
	private Float film_score;// 影片评分

	public Integer getFilm_id() {
		return film_id;
	}

	public void setFilm_id(Integer film_id) {
		this.film_id = film_id;
	}

	public String getFilm_name() {
		return film_name;
	}

	public void setFilm_name(String film_name) {
		this.film_name = film_name;
	}

	public Integer getFilm_length() {
		return film_length;
	}

	public void setFilm_length(Integer film_length) {
		this.film_length = film_length;
	}

	public String getFilm_type() {
		return film_type;
	}

	public void setFilm_type(String film_type) {
		this.film_type = film_type;
	}

	public String getFilm_stars() {
		return film_stars;
	}

	public void setFilm_stars(String film_stars) {
		this.film_stars = film_stars;
	}

	public String getFilm_desc() {
		return film_desc;
	}

	public void setFilm_desc(String film_desc) {
		this.film_desc = film_desc;
	}

	public Float getFilm_price() {
		return film_price;
	}

	public void setFilm_price(Float film_price) {
		this.film_price = film_price;
	}

	public String getFilm_datetime() {
		return film_datetime;
	}

	public void setFilm_datetime(String film_datetime) {
		this.film_datetime = film_datetime;
	}

	public String getFilm_area() {
		return film_area;
	}

	public void setFilm_area(String film_area) {
		this.film_area = film_area;
	}

	public String getFilm_img() {
		return film_img;
	}

	public void setFilm_img(String film_img) {
		this.film_img = film_img;
	}

	public Float getFilm_score() {
		return film_score;
	}

	public void setFilm_score(Float film_score) {
		this.film_score = film_score;
	}

}
