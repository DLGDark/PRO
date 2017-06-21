package com.xupt.ttms.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xupt.ttms.common.Utils;
import com.xupt.ttms.service.EmployeeService;
import com.xupt.ttms.vo.EmployeeInfo;

/**
 * 
 * @author：super_yc
 * @category 员工控制器类
 * 
 **/
@Controller
@RequestMapping(path = "/employee")
public class EmployeeController {

	@Resource
	private EmployeeService employeeService;

	/*
	 * 员工登录(账号和密码)
	 */
	@RequestMapping(path="/login",params={"emp_account","emp_pass"})
	public String empLogin(String emp_account, String emp_pass,ModelMap model,HttpSession session) {
		EmployeeInfo empInfo = null;
		if (emp_account != null) {
			// 通过账号获取用户信息
			empInfo = this.employeeService.getEmpInfoByAccount(emp_account);
			session.setAttribute("currentEmp", empInfo);
		}
		if (empInfo.getEmp_id() == 1) { // 管理员登录
			if(empInfo.getEmp_pass().equals(emp_pass)){
				//管理员登录成功
				return "home/home";
			}else{
				return "employee/failure";
			}
		} else if(empInfo.getEmp_flag() == 2){	//售票员登录
			if(empInfo.getEmp_pass().equals(emp_pass)){
				//普通员工登录成功
				model.put("emp_id", empInfo.getEmp_id());
				return "redirect:/film/getFilmList";
			}else{
				return "employee/failure";
			}
		}else{	//普通员工登录
			if(empInfo.getEmp_pass().equals(emp_pass)){
				//普通员工登录成功
				model.put("emp_id", empInfo.getEmp_id());
				return "user/mdfpass";
			}else{
				return "employee/failure";
			}
		}
	}
	
	/*
	 * 添加员工
	 */
	@RequestMapping(path="/addEmp")
	public String addEmp(HttpServletRequest request,EmployeeInfo empInfo){
		if(empInfo != null){
			if(empInfo.getEmp_position().equals("售票员")){
				empInfo.setEmp_flag(2);
			}else{
				empInfo.setEmp_flag(0);
			}
		}
		boolean result = this.employeeService.saveEmpInfo(empInfo);
		return (result ? "redirect:/employee/getEmployees" : "employee/failure"); 
	}
	
	/*
	 * 预更新员工信息
	 */
	@RequestMapping(path="/preUpdateEmpInfo")
	public String preUpdateEmpInfo(Integer emp_id,ModelMap model){
		EmployeeInfo empInfo = this.employeeService.getEmpInfoByEmpId(emp_id);
		if(empInfo != null){
			model.put("empInfo", empInfo);
		}
		return "home/people";
	}
	
	/*
	 * 更新用户信息
	 */
	@RequestMapping(path="/updateEmpInfo")
	public String updateEmpInfo(HttpServletRequest request,EmployeeInfo empInfo){
		
		//
		boolean result = this.employeeService.updateEmpInfoByEmpId(empInfo);
		if(result){
			return "redirect:/employee/getEmployees";
		}else{
			return "employee/failure";
		}
	}
	/*
	 * 更新员工信息
	 */
	@RequestMapping(path="/update")
	public String update(HttpServletRequest request,EmployeeInfo empInfo){
		boolean result = this.employeeService.updateEmpInfoByEmpId(empInfo);
		if(result){
			return "home/home";
		}else{
			return "employee/failure";
		}
	}
	
	/*
	 * 获取所有的员工列表
	 */
	@RequestMapping(path = "/getEmployees")
	public String getEmpList(HttpServletRequest request,ModelMap model){
		List<EmployeeInfo> employeeList = this.employeeService.getCurrentEmps(1);
		//获取员工的总页数
		Integer pageCount = this.employeeService.getPageCount();
		request.getSession().setAttribute("pageCount", pageCount);
		
		//将员工列表放入模型数据中
		model.put("employeeList", employeeList);
		model.put("pageCount", pageCount);
		model.put("currentPage", 1);
		return "home/people";
	}
	
	/*
	 * 员工分页(上下分页)
	 */
	@RequestMapping(path="/employeePagging")
	public String employeePagging(HttpServletRequest request,ModelMap model){
		//获取用户所选翻页类型、当前页数参数
		String dir = Utils.getParameter(request, "dir", String.class);
		Integer currentPage = Utils.getParameter(request, "currentPage", Integer.class);
		
		int pageNum = 1;	//定义一个当前的页码数
		int pageCount = (int) request.getSession().getAttribute("pageCount");
		if(currentPage != null){
			pageNum = currentPage;
			if(dir.equals("pre")){
				pageNum--;
			}else if(dir.equals("next")){
				pageNum++;
			}
			//边界判断
			if(pageNum < 1){
				pageNum = 1;
			}
			if(pageNum > pageCount){
				pageNum = pageCount;
			}
		}
		//调用业务逻辑层方法
		List<EmployeeInfo> employeeList = this.employeeService.getCurrentEmps(pageNum);
		//将数据放入数据模型中
		model.put("employeeList", employeeList);
		model.put("currentPage", pageNum);
		model.put("pageCount", pageCount);
		return "home/getEmployees";
	}
	
	/*
	 * 根据用户的编号，获取用户的信息
	 */
	@RequestMapping(path="/getEmployee")
	public String getEmpInfo(ModelMap model,HttpSession session){
		EmployeeInfo emp = (EmployeeInfo) session.getAttribute("currentEmp");
		EmployeeInfo empInfo = this.employeeService.getEmpInfoByEmpId(emp.getEmp_id());
		//将数据放入数据模型中
		model.put("empInfo", empInfo);
		return "home/adminModify";
	}
	
	/*
	 * 根据用户的编号，获取用户的信息
	 */
	@RequestMapping(path="/getEmpInfo/{emp_id}")
	public String getEmpInfoByEmpId(@PathVariable Integer emp_id,ModelMap model){
		EmployeeInfo empInfo = this.employeeService.getEmpInfoByEmpId(emp_id);
		//将数据放入数据模型中
		model.put("empInfo", empInfo);
		return "home/people";
	}
	
	/*
	 * 根据员工的编号，删除员工信息
	 */
	@RequestMapping(path="/delEmpInfo/{emp_id}")
	public String delEmpInfoByEmpId(@PathVariable Integer emp_id,ModelMap model){
		boolean result = this.employeeService.delEmpInfoByEmpId(emp_id);
		if(result){
			return "redirect:/employee/getEmployees";
		}else{
			return "employee/failure";
		}
	}
	
	/*
	 * 修改密码
	 */
	@RequestMapping(path="/updatepass")
	public String updatepass(HttpServletRequest request,Integer emp_id){
		String old_pass = Utils.getParameter(request, "old_pass", String.class);
		String new_pass = Utils.getParameter(request, "new_pass", String.class);
		String con_pass = Utils.getParameter(request, "con_pass", String.class);
		this.employeeService.updatepass(emp_id,new_pass);
		return "index";
	}
	
	/*
	 * 检查用户输入密码是否和之前一样
	 */
	@RequestMapping(path="/checkpass")
	public ResponseEntity<String> checkpass(Integer emp_id,String pass){
		String result = "true";
		EmployeeInfo info = null;
		if(emp_id != null){
			info = this.employeeService.getEmpInfoByEmpId(emp_id);
		}
		if(info.getEmp_pass().equals(pass)){
			result = "true";
		}else{
			result = "false";
		}
		//创建应答头对象
		HttpHeaders headers = new HttpHeaders();
		//设置应答头的内容格式(返回JSON格式的数据)
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
		//创建应答实体对象
		ResponseEntity<String> resp = new ResponseEntity<String>(result,headers,HttpStatus.OK);
		return resp;
	}
}