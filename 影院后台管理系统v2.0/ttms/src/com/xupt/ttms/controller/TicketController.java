package com.xupt.ttms.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xupt.ttms.common.Utils;
import com.xupt.ttms.service.ScheduleService;
import com.xupt.ttms.service.SeatService;
import com.xupt.ttms.service.StudioService;
import com.xupt.ttms.service.TicketService;
import com.xupt.ttms.vo.ScheduleInfo;
import com.xupt.ttms.vo.SeatInfo;
import com.xupt.ttms.vo.StudioInfo;
import com.xupt.ttms.vo.TicketInfo;

/**
 * 
 * @author lenovo
 * @category 票的控制器
 */
@Controller
@RequestMapping("/ticket")
public class TicketController {
	
	@Resource
	private TicketService ticketService;
	@Resource
	private ScheduleService scheService;
	@Resource
	private SeatService seatService;
	@Resource
	private StudioService studioService;
	
	/*
	 * 根据演出计划编号，获取当前演出厅中座位的分布
	 */
	@RequestMapping(path="/getSeatsStatus")
	public String getSeats(Integer sche_id,HttpServletRequest request){
		List<TicketInfo> ticketList = null;
		ScheduleInfo scheInfo = null;
		StudioInfo studioInfo = null;
		if(sche_id != null){
			//获取当前演出计划所产生的所有票
			ticketList = this.ticketService.getAllTicketsByScheId(sche_id);
			//根据演出计划编号，获取演出计划对象
			scheInfo = this.scheService.getScheInfoByScheId(sche_id);
			//根据演出厅编号，获取演出厅对象
			studioInfo = this.studioService.getStudioByStudioId(scheInfo.getStudio_id());
			//获取演出厅座位的初始状态
			List<SeatInfo> seatList = this.seatService.getSeatStatusByStudioId(scheInfo.getStudio_id());
			
			//获取演出厅中的行列总数
			int rows = studioInfo.getSeat_rows();
			int cols = studioInfo.getSeat_cols();
			request.setAttribute("rows", rows);
			request.setAttribute("cols", cols);
			request.setAttribute("studio_id", studioInfo.getStudio_id());
			//创建一个数组，保存该演出厅座位状态
			int[][] seatStatus = new int[rows+1][cols+1];
			if(seatList != null){
				seatStatus = Utils.getSeatStatusArray(ticketList,seatList,rows+1,cols+1);
				request.setAttribute("seatStatus", seatStatus);
			}else{
				request.setAttribute("seatStatus", null);
			}
		}
		return "saleTicket/seatChoice";
	}
	
	/*
	 * 
	 */
}
