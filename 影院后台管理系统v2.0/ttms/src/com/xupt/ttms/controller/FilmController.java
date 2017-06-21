package com.xupt.ttms.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.xupt.ttms.common.Constants;
import com.xupt.ttms.common.Utils;
import com.xupt.ttms.service.FilmService;
import com.xupt.ttms.vo.EmployeeInfo;
import com.xupt.ttms.vo.FilmInfo;
import com.xupt.ttms.vo.ScheduleInfo;

/**
 * 
 * @author lenovo
 * @category 影片的控制器
 */
@Controller
@RequestMapping(path = "/film")
public class FilmController {

	@Resource
	private FilmService filmService;

	/*
	 * 预添加影片
	 */
	@RequestMapping(path = "/preAddFilm")
	public String preAddFilm(ModelMap model) {
		// 获取影片上映地区
		List<String> filmAreaList = Utils.getAllFilmAreas();
		// 将其信息放入数据模型中
		model.put("filmAreaList", filmAreaList);
		return "home/addForm";
	}

	/*
	 * 添加影片
	 */
	@RequestMapping(path = "/addFilm")
	public String addFilm(FilmInfo filmInfo, ModelMap model,HttpServletRequest request) {
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
		if (result) {
			return "redirect:/film/getFilmList";
		} else {
			return "film/failure";
		}
	}
	
	/*
	 * 获取影片列表
	 */
	@RequestMapping(path="/getFilmList")
	public String getFilmList(HttpServletRequest request,ModelMap model){
		//获取分页一一页的影片个数
		List<FilmInfo> filmList = this.filmService.getCurrentPageFilms(1);
		
		//获取总页数
		Integer pageCount = this.filmService.getPageCount();
		request.getSession().setAttribute("pageCount", pageCount);
		//将数据放入数据模型中
		model.put("currentPage", 1);
		model.put("pageCount", pageCount);
		model.put("filmList", filmList);
		EmployeeInfo empInfo = (EmployeeInfo) request.getSession().getAttribute("currentEmp");
		if(empInfo.getEmp_flag() == 1){
			return "home/movies";
		}else{
			return "saleTicket/movieChoice";
		}
	}
	
	/*
	 * 影片分页(上下分页)
	 */
	@RequestMapping(path="/filmPagging")
	public String filmPagging(HttpServletRequest request,ModelMap model){
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
		//将数据放入数据模型中
		model.put("filmList", filmList);
		model.put("currentPage", pageNum);
		model.put("pageCount", pageCount);
		return "home/movies";
	}

	/*
	 * 检索影片
	 */
	@RequestMapping(path="/searchFilm")
	public String searchFilm(HttpServletRequest request,ModelMap model){
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
		
		//将其数据放入模型数据当中
		model.put("filmList", filmList);
		model.put("currentPage", 1);
		model.put("searchPageCount", searchPageCount);
		return "film/filmsearch";
	}
	
	/*
	 * 检索影片分页处理(上下翻页)
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(path="/searchFilmPagging")
	public String searchFilmPagging(HttpServletRequest request,ModelMap model){
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
		//将数据放入数据模型中
		model.put("filmList", filmList);
		model.put("currentPage", pageNum);
		model.put("searchPageCount", searchPageCount);
		return "film/filmsearch";
	}
	
	/*
	 * 批量删除影片
	 */
	@RequestMapping(path="/batchDeleteFilms")
	public String batchDeleteFilms(HttpServletRequest request,ModelMap model){
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
		return "redirect:/film/getFilmList";
	}
	
	/*
	 * 根据影片id，获取影片的详情
	 */
	@RequestMapping(path="/preUpdateFilm")
	public String preUpdateFilm(Integer film_id,ModelMap model){
		FilmInfo filmInfo = null;
		if(film_id != null){
			filmInfo = this.filmService.getFilmInfoByFilmId(film_id);
		}
		List<String> filmAreaList = Utils.getAllFilmAreas();
		// 将其信息放入数据模型中
		model.put("filmAreaList", filmAreaList);
		model.put("filmInfo", filmInfo);
		return "home/movdetails";
	}
	
	/*
	 * 更新影片信息
	 */
	@RequestMapping(path="/updateFilm")
	public String updateFilm(@RequestParam("file") MultipartFile file,FilmInfo filmInfo,HttpServletRequest request){
		boolean result = true;
		String flag = Utils.getParameter(request, "boolflag", String.class);
		if(flag.equals("true")){	//图片新上传，修改其路径
			if(file.getSize() > 0){
				File dir = new File(request.getServletContext().getRealPath("/film_img"));
				String filmImgName = Utils.getDistinctImgPath(file.getOriginalFilename());	//获取独一无二的演出厅名称
				String service_path = request.getServletContext().getRealPath("/film_img/")+filmImgName;
				String ttms_path = "E:\\JavaWebEclipse\\WebAppCode\\ttms\\WebContent\\film_img\\" + filmImgName;
				//将其图片保存在项目的根目录下
				String filmImg_path = "/ttms/film_img/" + filmImgName;
				filmInfo.setFilm_img(filmImg_path);
				//将员工图片保存在目标文件中
				try {
					file.transferTo(new File(dir,filmImgName));	//上传服务器
					file.transferTo(new File(ttms_path));	//上传项目根目录下
					} catch (IOException e) {
						e.printStackTrace();
					}
			}
		}
		if(filmInfo != null){
			result = this.filmService.updateFilm(filmInfo);
		}
		System.out.println(result + "=======");
		return "redirect:/film/getFilmList";
	}
	
	/*
	 * 获取影片对象
	 */
	@RequestMapping(path="/getFilmInfo")
	public ResponseEntity<FilmInfo> getFilmInfo(Integer film_id,HttpServletResponse response){
		FilmInfo filmInfo = this.filmService.getFilmInfoByFilmId(film_id);

		//创建应答头对象
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
		//创建应答实体对象
		ResponseEntity<FilmInfo> resp = new ResponseEntity<FilmInfo>(filmInfo,headers,HttpStatus.OK);
		return resp;
	}
}
