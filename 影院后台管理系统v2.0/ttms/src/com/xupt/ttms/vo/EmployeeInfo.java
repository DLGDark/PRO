package com.xupt.ttms.vo;

import java.util.Date;

/**
 *
 * @author：super_yc
 * @category ：员工信息类
 *
 **/
public class EmployeeInfo {
	private Integer emp_id; // 编号(主键)
	private String emp_account; // 账号
	private String emp_pass; // 密码
	private String emp_name; // 姓名
	private String emp_position;// 员工职位
	private String emp_sex; // 性别
	private String emp_dob; // 出生日期
	private Integer emp_age; // 年龄
	private String emp_tel; // 电话
	private String emp_email; // 邮箱
	private String emp_addr; // 地址
	private String emp_img; // 员工头像
	private Integer emp_flag;// 员工职位标志

	public Integer getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmp_account() {
		return emp_account;
	}

	public void setEmp_account(String emp_account) {
		this.emp_account = emp_account;
	}

	public String getEmp_pass() {
		return emp_pass;
	}

	public void setEmp_pass(String emp_pass) {
		this.emp_pass = emp_pass;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getEmp_position() {
		return emp_position;
	}

	public void setEmp_position(String emp_position) {
		this.emp_position = emp_position;
	}

	public String getEmp_sex() {
		return emp_sex;
	}

	public void setEmp_sex(String emp_sex) {
		this.emp_sex = emp_sex;
	}

	public String getEmp_dob() {
		return emp_dob;
	}

	public void setEmp_dob(String emp_dob) {
		this.emp_dob = emp_dob;
	}

	public Integer getEmp_age() {
		return emp_age;
	}

	public void setEmp_age(Integer emp_age) {
		this.emp_age = emp_age;
	}

	public String getEmp_tel() {
		return emp_tel;
	}

	public void setEmp_tel(String emp_tel) {
		this.emp_tel = emp_tel;
	}

	public String getEmp_email() {
		return emp_email;
	}

	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}

	public String getEmp_addr() {
		return emp_addr;
	}

	public void setEmp_addr(String emp_addr) {
		this.emp_addr = emp_addr;
	}

	public String getEmp_img() {
		return emp_img;
	}

	public void setEmp_img(String emp_img) {
		this.emp_img = emp_img;
	}

	public Integer getEmp_flag() {
		return emp_flag;
	}

	public void setEmp_flag(Integer emp_flag) {
		this.emp_flag = emp_flag;
	}

}
