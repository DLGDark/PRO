
package com.xupt.ttms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xupt.ttms.common.Constants;
import com.xupt.ttms.dao.EmployeeDao;
import com.xupt.ttms.service.EmployeeService;
import com.xupt.ttms.vo.EmployeeInfo;

/**
 * 
 * @author：super_yc
 * @category 员工业务逻辑层接口实现类
 * 
 **/
@Service(value = "employeeService")
public class EmployeeServiceImpl implements EmployeeService {

	@Resource
	private EmployeeDao employeeDao;

	@Override
	public EmployeeInfo getEmpInfoByAccount(String emp_account) {
		EmployeeInfo empInfo = null;
		try {
			empInfo = this.employeeDao.getEmpInfoByAccount(emp_account);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return empInfo;
	}

	@Override
	public List<EmployeeInfo> getCurrentEmps(int pageNum) {
		List<EmployeeInfo> empList = null;
		Map<String,Object> condition = new HashMap<String,Object>();
		try {
			//设置起始编号，以及每页的数量
			condition.put("startRownum", (pageNum - 1) * Constants.PAGE_EMPLOYEE_NUM);
			condition.put("pageEmpNum", Constants.PAGE_EMPLOYEE_NUM);
			
			empList = this.employeeDao.getCurrentEmps(condition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return empList;
	}

	@Override
	public EmployeeInfo getEmpInfoByEmpId(Integer emp_id) {
		EmployeeInfo empInfo = null;
		try {
			empInfo = this.employeeDao.getEmpInfoByEmpId(emp_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return empInfo;
	}

	@Override
	public boolean updateEmpInfoByEmpId(EmployeeInfo empInfo) {
		boolean result = true;
		try {
			this.employeeDao.updateEmpInfoByEmpId(empInfo);
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Override
	public boolean saveEmpInfo(EmployeeInfo empInfo) {
		boolean result = true;
		try {
			this.employeeDao.saveEmpInfo(empInfo);
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Override
	public boolean delEmpInfoByEmpId(Integer emp_id) {
		boolean result = true;
		try {
			this.employeeDao.delEmpInfoByEmpId(emp_id);
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Override
	public Integer getPageCount() {
		int recordCount = 0;
		try {
			recordCount = this.employeeDao.getPageCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (recordCount + (Constants.PAGE_EMPLOYEE_NUM - 1)) / Constants.PAGE_EMPLOYEE_NUM;
	}

	@Override
	public List<EmployeeInfo> getAllEmployees() {
		List<EmployeeInfo> empList = null;
		try{
			empList = this.employeeDao.getAllEmployees();
		} catch(Exception e){
			e.printStackTrace();
		}
		return empList;
	}

	@Override
	public void updatepass(Integer emp_id, String new_pass) {
		HashMap<String,Object> condition = new HashMap<String,Object>();
		try{
			condition.put("emp_id", emp_id);
			condition.put("new_pass", new_pass);
			this.employeeDao.updatepass(condition);
		} catch(Exception e){
			e.printStackTrace();
		}
	}

}
