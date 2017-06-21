package com.xupt.ttms.vo;

import java.util.Date;

/**
 * 
 * @author lenovo
 * @category 公告信息类
 */
public class NoticeInfo {

	private Integer notice_id;// 公告编号
	private String notice_name;// 公告名称
	private String notice_time;// 公告发布时间
	private String notice_title;// 公告标题
	private String notice_content;// 公告内容

	public Integer getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(Integer notice_id) {
		this.notice_id = notice_id;
	}

	public String getNotice_name() {
		return notice_name;
	}

	public void setNotice_name(String notice_name) {
		this.notice_name = notice_name;
	}

	public String getNotice_time() {
		return notice_time;
	}

	public void setNotice_time(String notice_time) {
		this.notice_time = notice_time;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

}
