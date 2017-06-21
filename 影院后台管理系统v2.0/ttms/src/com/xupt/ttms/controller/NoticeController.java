package com.xupt.ttms.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xupt.ttms.service.NoticeServcie;
import com.xupt.ttms.vo.NoticeInfo;

/**
 * 
 * @author lenovo
 * @category 公告的控制器类
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Resource
	private NoticeServcie noticeService;

	@RequestMapping(path="/publishNotice")
	public String publishNotice(NoticeInfo noticeInfo){
		boolean result = true;
		noticeInfo.setNotice_time(new SimpleDateFormat("yyyy-MM-dd HH:mmss").format(new Date()));
		if(noticeInfo != null){
			result = this.noticeService.publishNotice(noticeInfo);
		}
		System.out.println(result + "======");
		return "redirect:/notice/getNoticeList";
	}
	
	/*
	 * 获取公告列表
	 */
	@RequestMapping(path="/getNoticeList")
	public String getNoticeList(ModelMap model){
		List<NoticeInfo> noticeList = this.noticeService.getNoticeList();
		if(noticeList != null){
			//将其数据放入数据模型中
			model.put("noticeList", noticeList);
		}
		return "home/inform";
	}
	
	@RequestMapping(path="/preUpdate")
	public String getNoticeByNoticeId(Integer notice_id,ModelMap model){
		NoticeInfo noticeInfo = null;
		if(notice_id != null){
			noticeInfo = this.noticeService.getNoticeByNoticeId(notice_id);
			//将数据放入数据模型中
			model.put("noticeInfo", noticeInfo);
		}
		return "notice/editNotice";
	}
	
	@RequestMapping(path="/updateNotice")
	public String updateNotice(NoticeInfo noticeInfo){
		boolean result = true;
		if(noticeInfo != null){
			result = this.noticeService.updateNotice(noticeInfo);
		}
		//System.out.println(result + "======");
		return "redirect:/notice/getNoticeList";
	}
	
	@RequestMapping(path="/batchDeleteNotices")
	public String batchDeleteNotices(HttpServletRequest request){
		String[] params = request.getParameterValues("checkedNoticeIds");
		int count = 0;
		if(params != null && params.length > 0){
			Integer[] noticeIds = new Integer[params.length];
			for (int i = 0; i < noticeIds.length; i++) {
				noticeIds[i] = Integer.parseInt(params[i]);
			}
			//调用方法
			count = this.noticeService.batchDeleteNotices(noticeIds);
			
		}
		System.out.println(count+"---------");
		return "redirect:/notice/getNoticeList";
	}
}
