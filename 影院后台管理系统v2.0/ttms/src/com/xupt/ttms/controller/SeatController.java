package com.xupt.ttms.controller;

import java.util.List;
import com.xupt.ttms.vo.SeatInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xupt.ttms.common.Utils;
import com.xupt.ttms.service.SeatService;
import com.xupt.ttms.vo.SeatInfo;
import com.xupt.ttms.vo.StudioInfo;

/**
 * 
 * @author lenovo
 * @category 座位的控制器
 */
@Controller
@RequestMapping(path="/seat")
public class SeatController {
	
	@Resource
	private SeatService seatService;

	/*
	 * 获取所有的演出厅
	 */
	@RequestMapping(path="/getAllStudios")
	public String getAllStudios(ModelMap model,HttpServletRequest request){
		Integer flag = Utils.getParameter(request, "flag", Integer.class);
		List<StudioInfo> studioList = this.seatService.getAllStudios();
		
		//将其数据放入数据模型中
		model.put("studioList", studioList);
		if(flag == 1){
			return "seat/setSeatStatus";
		}else if(flag == 2){
			return "seat/seatStatuList"; 
		}
		return "";
	}
	
	/*
	 * 获取当前演出厅中座位的状态
	 */
	@RequestMapping(path="/getAllSeatStatus")
	public String getAllSeatStatus(HttpServletRequest request,ModelMap model){
		Integer studio_id = Utils.getParameter(request, "studio_id", Integer.class);
		List<SeatInfo> seatList = this.seatService.getSeatStatusByStudioId(studio_id);
		//查询所有演出厅
		List<StudioInfo> studioList = this.seatService.getAllStudios();
		if(seatList != null){
			//将其数据放入数据模型中
			model.put("seatList", seatList);
			model.put("studioList", studioList);
		}
		return "seat/seatStatuList";
	}
	
	/*
	 * 保存当前演出厅中座位的状态
	 */
	@RequestMapping(path="/saveSeatSatus")
	public void saveSeatStatus(HttpServletRequest request,ModelMap model){
		//获取用户提交的参数
		Integer studio_id = Utils.getParameter(request, "studio_id", Integer.class);
		Integer seatRow = Utils.getParameter(request, "row", Integer.class);
		Integer seatCol = Utils.getParameter(request, "col", Integer.class);
		Integer seatStatus = Utils.getParameter(request, "flag", Integer.class);
			
		//保存当前演出厅中组座位的状态
		@SuppressWarnings("unused")
		boolean result = this.seatService.saveSeatStatus(seatStatus,seatRow,seatCol,studio_id);
	}
	
	/*
	 * 保存
	 */
	@RequestMapping(path="/save")
	public String save(HttpServletRequest request){
		Integer studio_id = Utils.getParameter(request, "studio_id", Integer.class);
		return "redirect:/schedule/getSchedules?studio_id=" + studio_id;
	}
	
	/*
	 * 获取座位的信息
	 */
	@RequestMapping(path="/getSeat")
	public String getSeat(Integer seat_id,ModelMap model){
		SeatInfo seatInfo = this.seatService.getSeatBySeatId(seat_id);
		if(seatInfo != null){
			//将其数据放入数据模型中
			model.put("seatInfo", seatInfo);
		}
		return "seat/editSeat";
	}
	
	/*
	 * 编辑演出厅座位的状态
	 */
	@RequestMapping(path="/editSeat")
	public String editSeatStaus(SeatInfo seatInfo){
		boolean result = false;
		if(seatInfo != null){
			result = this.seatService.editSeatStausBySeatId(seatInfo);
		}
		System.out.println(result);
		return "redirect:/seat/getAllSeatStatus?studio_id=" + seatInfo.getStudio_id();
	}
	
	/*
	 * 根据演出厅编号，初始化座位表
	 */
	@RequestMapping(path="/getInitSeats")
	public String getInitSeatsByStudioId(Integer studio_id,ModelMap model,HttpServletRequest request){
		StudioInfo studioInfo = null;
		List<SeatInfo> seatList = null;
		if(studio_id != null){
			//根据演出厅编号，获取演出厅信息(包含了行列总数)
			studioInfo = this.seatService.getInitSeatsByStudioId(studio_id);
			//根据演出厅编号，获取座位状态集合
			seatList = this.seatService.getSeatStatusByStudioId(studio_id);
			//将其数据放入数据模型中
			int rows = studioInfo.getSeat_rows();
			int cols = studioInfo.getSeat_cols();
			request.setAttribute("rows", rows);
			request.setAttribute("cols", cols);
			request.setAttribute("studio_id", studio_id);
			//创建一个数组，保存该演出厅座位状态
			int[][] seatStatus = new int[rows+1][cols+1];
			if(seatList != null){
				seatStatus = Utils.getInitSeatStatusArray(seatList,rows+1,cols+1);
				request.setAttribute("seatStatus", seatStatus);
			}else{
				request.setAttribute("seatStatus", null);
			}
		}
		return "home/seat";
	}
}
