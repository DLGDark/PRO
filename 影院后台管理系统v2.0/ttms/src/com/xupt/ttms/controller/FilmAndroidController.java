package com.xupt.ttms.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xupt.ttms.common.Constants;
import com.xupt.ttms.common.Utils;
import com.xupt.ttms.service.FilmService;
import com.xupt.ttms.vo.FilmInfo;

import net.sf.json.JSONObject;

/**
 * 
 * @author lenovo
 * @category 影片的控制器
 */
@Controller
@RequestMapping(path = "/filmAndroid")
public class FilmAndroidController {

	@Resource
	private FilmService filmService;

	/*
	 * 添加影片
	 */
	@RequestMapping(path = "/addFilm")
	public void addFilm(FilmInfo filmInfo,HttpServletResponse response,HttpServletRequest request) {
		response.setContentType("text/json"); 	
		JSONObject json = new JSONObject();
		
		//获取影片的图片在其项目根目录下的路径
		String filmImg_path = Utils.getFilmImgPath(request);
		filmInfo.setFilm_img(filmImg_path);
		
		//获取电影的类型
		String[] params = request.getParameterValues("film_type");
		StringBuffer film_type = new StringBuffer();
		for (int i = 0; i < params.length; i++) {
			if(i == params.length - 1){
				film_type.append(params[i]);
			}else{
				film_type.append(params[i] + ",");
			}
		}
		filmInfo.setFilm_type(film_type.toString());
		
		boolean result = this.filmService.addFilm(filmInfo);
		if(result){
			json.put("flag", "success");
			json.put("result", "添加成功!");
		}else{
			json.put("flag", "failure");
			json.put("result", "添加失败!");
		}
		//写出
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 获取影片列表
	 */
	@RequestMapping(path="/getFilmList")
	public void getFilmList(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/json"); 	
		JSONObject json = new JSONObject();
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		//获取分页一一页的影片个数
		List<FilmInfo> filmList = this.filmService.getCurrentPageFilms(1);
		
		//获取总页数
		Integer pageCount = this.filmService.getPageCount();
		request.getSession().setAttribute("pageCount", pageCount);
		
		if(filmList != null){
			json.put("flag", "success");
			map.put("filmList", filmList);
			map.put("pageCount", pageCount);
			map.put("currentPage", 1);
			json.put("result", map);
		}else{
			json.put("flag", "failure");
			json.put("result", "请求失败!");
		}
		//写出
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 影片分页(上下分页)
	 */
	@RequestMapping(path="/filmPagging")
	public void filmPagging(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/json"); 	
		JSONObject json = new JSONObject();
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		//获取用户所选翻页类型数据,当前页数据
		String dir = Utils.getParameter(request, "dir", String.class);
		Integer currentPage = Utils.getParameter(request, "currentPage", Integer.class);
		
		int pageNum = 1;	//定义一个当前的页码数
		int pageCount = (int) request.getSession().getAttribute("pageCount"); //根据条件获取总页数
		if(currentPage != null){
			pageNum = currentPage;
			if("pre".equals(dir)){	//上一页
				pageNum--;
			}else if("next".equals(dir)){	//下一页
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
		List<FilmInfo> filmList = this.filmService.getCurrentPageFilms(pageNum);
		if(filmList != null){
			json.put("flag", "success");
			map.put("filmList", filmList);
			map.put("pageCount", pageCount);
			map.put("currentPage", pageNum);
			json.put("result", map);
		}else{
			json.put("flag", "failure");
			json.put("result", "请求失败!");
		}
		//写出
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/*
	 * 检索影片
	 */
	@RequestMapping(path="/searchFilm")
	public void searchFilm(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/json"); 	
		JSONObject json = new JSONObject();
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		//获取客户端的数据
		String film_name = Utils.getParameter(request, "film_name", String.class);
		Integer film_length = Utils.getParameter(request, "film_length", Integer.class);
		String film_type = Utils.getParameter(request, "film_type", String.class);
		String film_area = Utils.getParameter(request, "film_area", String.class);
		
		//创建HashMap实例，将其检索的数据放入其中
		Map<String,Object> condition = new HashMap<String,Object>();
		if(film_name != null){
			condition.put("film_name", film_name);
		}
		if(film_length != null && film_length > 0){
			condition.put("film_length", film_length);
		}
		if(film_type != null){
			condition.put("film_type", film_type);
		}
		if(film_area != null){
			condition.put("film_area", film_area);
		}
		
		//提交表单时，将检索的数据放入session当中，以便之后翻页再次使用
		request.getSession().setAttribute(Constants.SESSION_SEARCH_CONDITION_KEY, condition);
		//调用业务逻辑层方法
		List<FilmInfo> filmList = this.filmService.searchFilm(condition,1);
		//获取总页数
		Integer searchPageCount = this.filmService.getSearchPageCount(condition);
		request.getSession().setAttribute("searchPageCount", searchPageCount);
		
		if(filmList != null){
			json.put("flag", "success");
			map.put("filmList", filmList);
			map.put("pageCount", searchPageCount);
			map.put("currentPage", 1);
			json.put("result", map);
		}else{
			json.put("flag", "failure");
			json.put("result", "请求失败!");
		}
		//写出
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 检索影片分页处理(上下翻页)
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(path="/searchFilmPagging")
	public void searchFilmPagging(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/json"); 	
		JSONObject json = new JSONObject();
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		//获取用户所选翻页类型数据,当前页数据,检索条件从session中获取
		String dir = Utils.getParameter(request, "dir", String.class);
		Integer currentPage = Utils.getParameter(request, "currentPage", Integer.class);
		Map<String,Object> condition = (Map<String, Object>) request.getSession().getAttribute(Constants.SESSION_SEARCH_CONDITION_KEY);
		
		int pageNum = 1;	//定义一个当前的页码数
		int searchPageCount = (int) request.getSession().getAttribute("searchPageCount"); //根据条件获取总页数
		if(currentPage != null){
			pageNum = currentPage;
			if("pre".equals(dir)){	//上一页
				pageNum--;
			}else if("next".equals(dir)){	//下一页
				pageNum++;
			}
			//边界判断
			if(pageNum < 1){
				pageNum = 1;
			}
			if(pageNum > searchPageCount){
				pageNum = searchPageCount;
			}
		}
		//调用业务逻辑层方法
		List<FilmInfo> filmList = this.filmService.searchFilm(condition, pageNum);
		if(filmList != null){
			json.put("flag", "success");
			map.put("filmList", filmList);
			map.put("pageCount", searchPageCount);
			map.put("currentPage", pageNum);
			json.put("result", map);
		}else{
			json.put("flag", "failure");
			json.put("result", "请求失败!");
		}
		//写出
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 批量删除影片
	 */
	@RequestMapping(path="/batchDeleteFilms")
	public void batchDeleteFilms(HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/json"); 	
		JSONObject json = new JSONObject();
		
		//获取影片批量删除的film_id编号
		String[] filmIds = request.getParameterValues("checkedFilmIds");
		int count = 0;
		if(filmIds != null && filmIds.length > 0){
			int films[] = new int[filmIds.length];
			for (int i = 0; i < films.length; i++) {
				films[i] = Integer.valueOf(filmIds[i]);
			}
			//调用业务逻辑层方法
			count = this.filmService.batchDeleteFilms(films);
			//将删除的数据放入数据模型中
			System.out.println(count + "个影片删除成功！");
		}
		if(count > 0){
			json.put("flag", "success");
			json.put("result", "批量删除成功");
		}else{
			json.put("flag", "failure");
			json.put("result", "批量删除失败!");
		}
		//写出
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 根据影片id，获取影片的详情
	 */
	@RequestMapping(path="/preUpdateFilm")
	public void preUpdateFilm(Integer film_id,HttpServletResponse response){
		response.setContentType("text/json"); 	
		JSONObject json = new JSONObject();
		
		FilmInfo filmInfo = null;
		if(film_id != null){
			filmInfo = this.filmService.getFilmInfoByFilmId(film_id);
		}
		if(filmInfo != null){
			json.put("flag", "success");
			json.put("result", filmInfo);
		}else{
			json.put("flag", "failure");
			json.put("result", filmInfo);
		}
		//写出
		try {
			response.getWriter().write(json.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 更新影片信息
	 */
	@RequestMapping(path="/updateFilm")
	public void updateFilm(FilmInfo filmInfo,HttpServletRequest request,HttpServletResponse response){
		response.setContentType("text/json"); 	
		JSONObject json = new JSONObject();
		
		boolean result = true;
		String flag = Utils.getParameter(request, "boolflag", String.class);
		if(flag.equals("true")){	//图片新上传，修改其路径
			//获取影片的图片在其项目根目录下的路径
			String filmImg_path = Utils.getFilmImgPath(request);
			filmInfo.setFilm_img(filmImg_path);
		}
		if(filmInfo != null){
			result = this.filmService.updateFilm(filmInfo);
		}
		
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
