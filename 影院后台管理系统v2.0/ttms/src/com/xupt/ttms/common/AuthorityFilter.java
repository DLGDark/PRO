package com.xupt.ttms.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xupt.ttms.vo.EmployeeInfo;
/**
 * 
 * @author lenovo
 * @category 权限过滤器
 */
//@WebFilter(urlPatterns="/*")
public class AuthorityFilter implements Filter {

	@Override
	public void destroy() {
		System.out.println("权限过滤器销毁");
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		//转换操作
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		
		//从session中获取当前员工对象
		EmployeeInfo empInfo = (EmployeeInfo) request.getSession().getAttribute("currentEmp");
		if(empInfo != null){	//管理员登录
			chain.doFilter(request, response);
		}else{	//跳到登录界面(登录)
			response.sendRedirect("/ttms/index.jsp");
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("权限过滤器初始化");
	}

}
