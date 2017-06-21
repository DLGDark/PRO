package com.xupt.ttms.vo;

/**
 * 
 * @author lenovo
 * @category 演出计划信息类
 */
public class ScheduleInfo {

	private Integer sche_id;// 演出计划编号
	private String film_begintime;// 电影开始时间
	private String film_endtime;// 电影结束时间
	private Integer film_id;// 影片编号
	private Integer studio_id;// 演出厅编号
	private String film_startdate;// 演出开始日期
	private StudioInfo studio;// 演出厅(多对一)
	private FilmInfo film;// 影片(多对一)

	public Integer getSche_id() {
		return sche_id;
	}

	public void setSche_id(Integer sche_id) {
		this.sche_id = sche_id;
	}

	public String getFilm_begintime() {
		return film_begintime;
	}

	public void setFilm_begintime(String film_begintime) {
		this.film_begintime = film_begintime;
	}

	public String getFilm_endtime() {
		return film_endtime;
	}

	public void setFilm_endtime(String film_endtime) {
		this.film_endtime = film_endtime;
	}

	public Integer getFilm_id() {
		return film_id;
	}

	public void setFilm_id(Integer film_id) {
		this.film_id = film_id;
	}

	public Integer getStudio_id() {
		return studio_id;
	}

	public void setStudio_id(Integer studio_id) {
		this.studio_id = studio_id;
	}

	public String getFilm_startdate() {
		return film_startdate;
	}

	public void setFilm_startdate(String film_startdate) {
		this.film_startdate = film_startdate;
	}

	public StudioInfo getStudio() {
		return studio;
	}

	public void setStudio(StudioInfo studio) {
		this.studio = studio;
	}

	public FilmInfo getFilm() {
		return film;
	}

	public void setFilm(FilmInfo film) {
		this.film = film;
	}

}
