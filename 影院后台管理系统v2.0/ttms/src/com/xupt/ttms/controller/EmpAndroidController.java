package com.xupt.ttms.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xupt.ttms.common.Utils;
import com.xupt.ttms.service.EmployeeService;
import com.xupt.ttms.vo.EmployeeInfo;

import net.sf.json.JSONObject;

/**
 * 
 * @author：super_yc
 * @category 员工控制器类
 * 
 **/
@Controller
@RequestMapping(path = "/emp")
public class EmpAndroidController {

	@Resource
	private EmployeeService employeeService;

	/*
	 * 员工登录(账号和密码)
	 */
	@RequestMapping(path="/login",params={"emp_account","emp_pass"})
	public void empLogin(String emp_account, String emp_pass,HttpSession session,HttpServletResponse response) {
        response.setContentType("text/json"); 	
		JSONObject json = new JSONObject();
		
		System.out.println("连接成功!");
		EmployeeInfo empInfo = null;
		if (emp_account != null) {
			// 通过账号获取用户信息
			empInfo = this.employeeService.getEmpInfoByAccount(emp_account);
			//将当前员工对象放入session对象中
			session.setAttribute("currentEmp", empInfo);
		}
		if(empInfo == null){
			json.put("flag", "failure");
			json.put("result", "员工不存在!");
		}else{ 
			if(empInfo.getEmp_pass().equals(emp_pass)){
				//管理员登录成功
				json.put("flag", "success");
				json.put("result", empInfo);
			}else{
				json.put("flag", "failure");
				json.put("result", "密码错误!");
			}
		}
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 添加员工
	 */
	@RequestMapping(path="/addEmp")
	public void addEmp(HttpServletRequest request,EmployeeInfo empInfo,HttpServletResponse response){
		response.setContentType("text/json"); 	
		JSONObject json = new JSONObject();
		if(empInfo != null){
			empInfo.setEmp_flag(0);//代表普通员工
		}
		
		boolean result = this.employeeService.saveEmpInfo(empInfo);
		if(result){
			json.put("flag", "success");
			json.put("result", empInfo);
		}else{
			json.put("flag", "failure");
			json.put("result", "添加失败!");
		}
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 更新员工信息
	 */
	@RequestMapping(path="/update")
	public void updateEmp(HttpServletResponse response,HttpServletRequest request){
		String emp_name = Utils.getParameter(request, "emp_name", String.class);
		String emp_account = Utils.getParameter(request, "account", String.class);
		String emp_email = Utils.getParameter(request, "email", String.class);
		String emp_sex = Utils.getParameter(request, "sex", String.class);
		String emp_dob = Utils.getParameter(request, "dob", String.class);
		String emp_tel = Utils.getParameter(request, "phone", String.class);
		String emp_addr = Utils.getParameter(request, "address", String.class);
		String emp_position = Utils.getParameter(request, "position", String.class);
		Integer emp_age = Utils.getParameter(request, "emp_age", Integer.class);
		//System.out.println(emp_id + emp_name + emp_account + emp_email+emp_sex+emp_dob+emp_addr);
		
		EmployeeInfo empInfo = (EmployeeInfo) request.getSession().getAttribute("currentInfo");
		empInfo.setEmp_addr(emp_addr);
		empInfo.setEmp_account(emp_account);
		empInfo.setEmp_age(emp_age);
		empInfo.setEmp_dob(emp_dob);
		empInfo.setEmp_email(emp_email);
		empInfo.setEmp_img(null);
		empInfo.setEmp_position(emp_position);
		empInfo.setEmp_tel(emp_tel);
		
		response.setContentType("text/json"); 	
		JSONObject json = new JSONObject();
		
		boolean result = false;
		if(empInfo != null){
			result = this.employeeService.updateEmpInfoByEmpId(empInfo);
		}
		if(result){
			json.put("flag", "success");
		}else{
			json.put("flag", "failure");
			json.put("result", "失败!");
		}
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 更新用户信息
	 */
	@RequestMapping(path="/updateEmpInfo")
	public void updateEmpInfo(EmployeeInfo empInfo,HttpServletResponse response){
		response.setContentType("text/json"); 	
		JSONObject json = new JSONObject();
		//
		boolean result = false;
		if(empInfo != null){
			result = this.employeeService.updateEmpInfoByEmpId(empInfo);
		}
		if(result){
			json.put("flag", "success");
		}else{
			json.put("flag", "failure");
			json.put("result", "失败!");
		}
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 获取所有的员工列表
	 */
	@RequestMapping(path = "/getEmployees")
	public void getEmpList(HttpServletResponse response){
		response.setContentType("text/json"); 
		JSONObject json = new JSONObject();
		
		List<EmployeeInfo> employeeList = this.employeeService.getAllEmployees();
		if(employeeList != null){
			json.put("flag", "success");
			json.put("result", employeeList);
		}
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 根据员工编号，获取员工信息
	 */
	@RequestMapping(path="/getEmployee")
	public void getEmpInfoById(Integer emp_account,HttpSession session,HttpServletResponse response){
		response.setContentType("text/json"); 	
		JSONObject json = new JSONObject();
		
		//EmployeeInfo emp = (EmployeeInfo) session.getAttribute("currentEmp");
		EmployeeInfo empInfo = this.employeeService.getEmpInfoByEmpId(emp_account);
		if(empInfo != null){
			json.put("flag", "success");
			json.put("result", empInfo);
		}else{
			json.put("flag", "failure");
			json.put("result", "获取员工失败!");
		}
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 根据用户的编号，获取用户的信息
	 */
	@RequestMapping(path="/getEmpInfo/{emp_id}")
	public void getEmpInfoByEmpId(@PathVariable Integer emp_id,HttpServletResponse response){
		response.setContentType("text/json"); 	
		JSONObject json = new JSONObject();
		
		EmployeeInfo empInfo = this.employeeService.getEmpInfoByEmpId(emp_id);
		if(empInfo != null){
			json.put("flag", "success");
			json.put("result", empInfo);
		}else{
			json.put("flag", "failure");
			json.put("result", "获取员工失败!");
		}
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 根据员工的编号，删除员工信息
	 */
	@RequestMapping(path="/delEmpInfo/{emp_id}")
	public void delEmpInfoByEmpId(@PathVariable Integer emp_id,HttpServletResponse response){
		response.setContentType("text/json"); 	
		JSONObject json = new JSONObject();
		
		boolean result = this.employeeService.delEmpInfoByEmpId(emp_id);
		if(result){
			json.put("flag", "success");
			json.put("result", "删除成功!");
		}else{
			json.put("flag", "failure");
			json.put("result", "删除失败!");
		}
		//写出
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}