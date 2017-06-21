package com.xupt.ttms.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.xupt.ttms.common.Utils;
import com.xupt.ttms.service.StudioService;
import com.xupt.ttms.vo.StudioInfo;

/**
 * 
 * @author lenovo
 * @category 演出厅控制器
 */
@Controller
@RequestMapping(path = "/studio")
public class StudioController {
	
	@Resource
	private StudioService studioService;

	/*
	 * 与添加影厅 
	 */
	@RequestMapping(path = "/preAddStudio")
	public String getAllStudioType(ModelMap model) {
		// 获取所有演出厅的类型
		List<String> studioList = Utils.getAllStudioTypes();
		// 将数据放入数据模型中
		model.put("studioList", studioList);
		return "studio/addStudio";
	}
	
	/*
	 * 添加影厅
	 */
	@RequestMapping(path="/addStudio")
	public String addStudio(StudioInfo studioInfo,ModelMap model,HttpServletRequest request){
		boolean result = false;
		//获取演出厅中座位的行列总数
		String rowCols = Utils.getParameter(request, "studio_rowcols", String.class);
		if(studioInfo != null){
			if(!rowCols.equals("0/0")){	//已选择座位的行列总数
				String[] values = rowCols.split("/");
				//将其行列总数设置到演出厅中
				studioInfo.setSeat_rows(Integer.valueOf(values[0]));
				studioInfo.setSeat_cols(Integer.valueOf(values[1]));
			}
			//获取演出厅图片的路径
			String studio_img = Utils.getStudioImgPath(request);
			studioInfo.setStudio_img(studio_img);
			
			result = this.studioService.addStudio(studioInfo);
		}
		return "redirect:/studio/studioList";
	}
	
	/*
	 * 获取影厅列表
	 */
	@RequestMapping(path="/studioList")
	public String getStudioList(ModelMap model){
		List<StudioInfo> studioList = this.studioService.getStudioList();
		if(studioList != null){
			//将其数据放入数据模型中
			model.put("studioList", studioList);
		}
		return "home/theatre";
	}
	
	/*
	 * 预编辑影厅
	 */
	@RequestMapping(path="/preUpdateStudio")
	public String preUpdateStudio(Integer studio_id,ModelMap model){
		StudioInfo studioInfo = null;
		if(studio_id != null){
			studioInfo = this.studioService.getStudioByStudioId(studio_id);
			// 获取所有演出厅的类型
			List<String> studioList = Utils.getAllStudioTypes();
			//将其数据放入数据模型中
			model.put("studioList", studioList);
			model.put("studioInfo", studioInfo);
		}
		return "studio/editStudio";
	}
	
	/*
	 * 更新影厅
	 */
	@RequestMapping(path="/updateStudio")
	public String updateStudio(@RequestParam("file") MultipartFile file,HttpServletRequest request,StudioInfo studioInfo){
		boolean result = false;
		//获取根路径，生成一个目录文件，在服务器中存放文件
		File dir = new File(request.getServletContext().getRealPath("/studio_img"));
		if(file.getSize() > 0){
			String studioImgName = Utils.getDistinctImgPath(file.getOriginalFilename());	//获取独一无二的演出厅名称
			String service_path = request.getServletContext().getRealPath("/studio_img/")+studioImgName;
			String ttms_path = "E:\\JavaWebEclipse\\WebAppCode\\ttms\\WebContent\\studio_img\\" + studioImgName;
			//将其图片保存在项目的根目录下
			String studioImg_path = "/ttms/studio_img/" + studioImgName;
			studioInfo.setStudio_img(studioImg_path);
			//将员工图片保存在目标文件中
			try {
				file.transferTo(new File(dir,studioImgName));	//上传服务器
				file.transferTo(new File(ttms_path));	//上传项目根目录下
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		
		//获取演出厅中座位的行列总数
		String rowCols = Utils.getParameter(request, "studio_rowcols", String.class);
		if(studioInfo != null){
			if(!rowCols.equals("0/0")){	//已选择座位的行列总数
				String[] values = rowCols.split("/");
				//将其行列总数设置到演出厅中
				studioInfo.setSeat_rows(Integer.valueOf(values[0]));
				studioInfo.setSeat_cols(Integer.valueOf(values[1]));
			}
			if(studioInfo != null){
				result = this.studioService.updateStudio(studioInfo);
			}
		}
		return "redirect:/studio/studioList";
	}
	
	/*
	 * 批量删除影厅
	 */
	@RequestMapping(path="/deleteStudio")
	public String deleteStudios(HttpServletRequest request,Integer studio_id){
		int count = 0;
		if(studio_id != null){
			//调用方法
			count = this.studioService.deleteStudio(studio_id);
		}
		return "redirect:/studio/studioList";
	}
}
