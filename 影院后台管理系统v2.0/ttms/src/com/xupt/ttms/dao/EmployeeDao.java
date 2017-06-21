package com.xupt.ttms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.xupt.ttms.vo.EmployeeInfo;

/**
 * 
 * @author：super_yc
 * @category 员工数据库访问层接口
 * 
**/
public interface EmployeeDao {

	/*
	 * 根据员工的账号，获取员工的详情
	 */
	EmployeeInfo getEmpInfoByAccount(String emp_account);

	/*
	 * 获取所有的员工列表
	 */
	List<EmployeeInfo> getCurrentEmps(Map<String,Object> condition);

	/*
	 * 根据用户的编号，获取用户的信息
	 */
	EmployeeInfo getEmpInfoByEmpId(Integer emp_id);

	/*
	 * 根据员工编号，更新用户信息
	 */
	void updateEmpInfoByEmpId(EmployeeInfo empInfo);

	/*
	 * 添加新员工
	 */
	void saveEmpInfo(EmployeeInfo empInfo);

	/*
	 * 根据员工的编号，删除员工信息
	 */
	void delEmpInfoByEmpId(Integer emp_id);

	/*
	 * 获取员工的总页数
	 */
	int getPageCount();

	/*
	 * 获取所有的员工信息
	 */
	List<EmployeeInfo> getAllEmployees();

	/*
	 * 修改密码
	 */
	void updatepass(HashMap<String, Object> condition);

}
