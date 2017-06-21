package com.xupt.ttms.service;

import java.util.List;

import com.xupt.ttms.vo.EmployeeInfo;

/**
 * 
 * @author：super_yc
 * @category 员工业务逻辑层接口
 * 
**/
public interface EmployeeService {

	/*
	 * 通过账号获取用户信息
	 */
	EmployeeInfo getEmpInfoByAccount(String emp_account);

	/*
	 * 获取所有的员工列表
	 */
	List<EmployeeInfo> getCurrentEmps(int pageNum);

	/*
	 * 根据员工的编号，获取用户的信息
	 */
	EmployeeInfo getEmpInfoByEmpId(Integer emp_id);

	/*
	 * 根据员工编号，更新用户信息
	 */
	boolean updateEmpInfoByEmpId(EmployeeInfo empInfo);

	/*
	 * 添加新员工
	 */
	boolean saveEmpInfo(EmployeeInfo empInfo);

	/*
	 * 根据员工的编号，删除员工信息
	 */
	boolean delEmpInfoByEmpId(Integer emp_id);

	/*
	 * 获取人员的总页数
	 */
	Integer getPageCount();

	/*
	 * 获取所有的员工信息
	 */
	List<EmployeeInfo> getAllEmployees();

	void updatepass(Integer emp_id,String new_pass);


}
