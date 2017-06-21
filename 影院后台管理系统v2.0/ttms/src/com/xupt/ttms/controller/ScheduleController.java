package com.xupt.ttms.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xupt.ttms.common.Utils;
import com.xupt.ttms.service.ScheduleService;
import com.xupt.ttms.vo.FilmInfo;
import com.xupt.ttms.vo.ScheduleInfo;

/**
 * 
 * @author lenovo
 * @category 演出计划控制器
 */
@Controller
@RequestMapping(path="/schedule")
public class ScheduleController {
	
	@Resource
	private ScheduleService scheduleService; 
	
	/*
	 * 预放映影片
	 */
	@RequestMapping(path="/prePlayFilm")
	public String prePlayFilm(ModelMap model,Integer studio_id){
		//获取所有的影片列表
		List<FilmInfo> filmList = this.scheduleService.getAllFilms();
		//获取影片的详细演出计划
		List<ScheduleInfo> scheList = this.scheduleService.getFilmsByStudioId(studio_id);
		List<String> timeSegList = null;
		if(scheList != null){
			//获取可以放映的影片时间段
			timeSegList = Utils.getUseSegTimeList(scheList);
		}	
		//将数据放入数据模型中
		if(filmList != null){
			model.put("filmList", filmList);
			model.put("timeSegList", timeSegList);
		}
		return "schedule/playFilm";
	}
	
	/*
	 * 获取当前演出厅中安排的全部电影
	 */
	@RequestMapping(path="/showTimeSegment",params={"studio_id"})
	public ResponseEntity<List<String>> showTimeSegment(Integer studio_id){
		//获取影片的详细演出计划
		List<ScheduleInfo> scheList = this.scheduleService.getFilmsByStudioId(studio_id);
		List<String> timeSegList = null;
		if(scheList != null){
			//获取可以放映的影片时间段
			timeSegList = Utils.getUseSegTimeList(scheList);
		}
		
		//创建应答头对象
		HttpHeaders headers = new HttpHeaders();
		//设置应答头的内容格式(返回JSON格式的数据)
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
		//创建应答实体对象
		ResponseEntity<List<String>> resp = new ResponseEntity<List<String>>(timeSegList,headers,HttpStatus.OK);
		return resp;
	}
	
	/*
	 * 保存电影在演出厅播放的时间(保存演出计划)
	 */
	@RequestMapping(path="/saveFilmPlay")
	public String saveFilmPlay(HttpServletRequest request,ModelMap model){
			//获取电影时长
			Integer film_length = Utils.getParameter(request, "film_length", Integer.class);
			Integer studio_id = Utils.getParameter(request, "studio_id", Integer.class);
			String film_begintime = Utils.getParameter(request, "film_begintime", String.class);
			Integer film_id = Utils.getParameter(request, "film_id", Integer.class);
			String film_startdate = Utils.getParameter(request, "film_startdate", String.class);
			//获取影片的结束时间
			String film_endtime = Utils.getFilmEndTime(film_begintime,film_length);
			
			ScheduleInfo scheInfo = new ScheduleInfo();
			scheInfo.setFilm_begintime(film_begintime);
			scheInfo.setFilm_endtime(film_endtime);
			scheInfo.setFilm_id(film_id);
			scheInfo.setStudio_id(studio_id);
			scheInfo.setFilm_startdate(film_startdate);
			
			//调用业务逻辑层方法
			this.scheduleService.saveFilmPlay(scheInfo);
		return "redirect:/schedule/getSchedules?studio_id=" + studio_id;
	}
	
	/*
	 * 获取所有要放映的电影列表
	 */
	@RequestMapping(path="/getPrePlayFilmList")
	public String getPrePlayFilmList(ModelMap model){
		//获取演出计划中所有要放映的电影列表
		List<ScheduleInfo> scheList = this.scheduleService.getAllSchedules();
		if(scheList != null){
			//将其数据放入数据模型中
			model.put("scheList", scheList);
		}
		return "schedule/playFilmList";
	}
	
	/*
	 * 根据演出计划的编号，获取记录详情(预编辑)
	 */
	@RequestMapping(path="/preUpdate")
	public String preUpdate(@RequestParam Integer sche_id,ModelMap model){
		ScheduleInfo scheInfo = null;
		if(sche_id != null){
			scheInfo = this.scheduleService.getScheInfoByScheId(sche_id);
			//获取所有的影片列表
			List<FilmInfo> filmList = this.scheduleService.getAllFilms();
			//获取影片的详细演出计划
			List<ScheduleInfo> scheList = this.scheduleService.getFilmsByStudioId(scheInfo.getStudio_id());
			List<String> timeSegList = null;
			if(scheList != null){
				//获取可以放映的影片时间段
				timeSegList = Utils.getUseSegTimeList(scheList);
			}
			//将其数据放入数据模型中
			model.put("scheInfo", scheInfo);
			model.put("filmList", filmList);
			model.put("timeSegList", timeSegList);
		}
		return "schedule/editSchedule";
	}
	
	/*
	 * 根据演出计划的编号，更新一条记录
	 */
	@RequestMapping(path="/updateSchedule")
	public String updateScheInfoByScheId(HttpServletRequest request,ScheduleInfo scheInfo){
		//获取影片时长
		Integer film_length = Utils.getParameter(request, "film_length", Integer.class);
		//获取影片的结束时间
		String film_endtime = Utils.getFilmEndTime(scheInfo.getFilm_begintime(),film_length);
		scheInfo.setFilm_endtime(film_endtime);
		
		boolean result = false;
		if(scheInfo != null){
			result = this.scheduleService.updateScheInfoByScheId(scheInfo);
			System.out.println(result);
		}
		return "redirect:/schedule/getSchedules?studio_id=" + scheInfo.getStudio_id();
	}
	
	/*
	 * 批量删除演出计划
	 */
	@RequestMapping(path="/batchDeleteSchedules")
	public String batchDeleteSchedules(HttpServletRequest request,Integer studio_id){
		//获取演出计划编号列表
		String[] params = request.getParameterValues("scheduleIds");
		int count = 0;
		if(params != null && params.length > 0){
			Integer[] scheduleIds = new Integer[params.length];
			for (int i = 0; i < scheduleIds.length; i++) {
				scheduleIds[i] = Integer.valueOf(params[i]);
			}
			//调用方法
			count = this.scheduleService.batchDeleteSchedules(scheduleIds);
		}
		System.out.println(count+"---------");
		return "redirect:/schedule/getSchedules?studio_id=" + studio_id;
	}
	
	/*
	 * 根据影片编号，获取影片在某演出厅的播放时间
	 */
	@RequestMapping(path="/getFilmPlay")
	public String getFilmPlay(Integer film_id,ModelMap model){
		List<ScheduleInfo> scheList = null;
		if(film_id != null){
			scheList  = this.scheduleService.getFilmPlayByFilmId(film_id);
		}
		//将数据放入数据模型当中
		model.put("scheList", scheList);
		return "saleTicket/moviePlan";
	}
	
	/*
	 * 删除一条演出计划
	 */
	@RequestMapping(path="/deleteSchedule")
	public String deleteSchedule(Integer sche_id,Integer studio_id){
		if(sche_id != null){
			this.scheduleService.deleteScheByScheId(sche_id);
		}
		return "redirect:/schedule/getSchedules?studio_id=" + studio_id;
	}
	
	/*
	 * 根据演出厅编号，获取所有的演出计划列表
	 */
	@RequestMapping(path="/getSchedules")
	public String getSchedulesByStuId(Integer studio_id,ModelMap model){
		List<ScheduleInfo> scheList = null;
		List<FilmInfo> filmList = null;
		List<String> timeSegList = null;
		
		if(studio_id != null){
			//获取当前影厅中所有的演出计划列表
			scheList = this.scheduleService.getSchedulesByStuId(studio_id);
			//获取所有的影片列表
			filmList = this.scheduleService.getAllFilms();

			if(scheList != null){
				//获取可以放映的影片时间段
				timeSegList = Utils.getUseSegTimeList(scheList);
			}	
		}
		model.put("scheList", scheList);
		//将其影厅编号放入数据模型中，供座位管理使用
		model.put("studioId", studio_id);
		model.put("filmList", filmList);
		model.put("timeSegList", timeSegList);
		return "home/theatreplan";
	}
}
