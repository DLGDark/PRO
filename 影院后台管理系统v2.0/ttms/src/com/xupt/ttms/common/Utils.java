package com.xupt.ttms.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.xupt.ttms.vo.FilmInfo;
import com.xupt.ttms.vo.ScheduleInfo;
import com.xupt.ttms.vo.SeatInfo;
import com.xupt.ttms.vo.TicketInfo;

/**
 * 
 * @author lenovo
 * @category 工具类
 */
public class Utils {

	private final static String emp_positions = "经理,售票员,检票员";
	private final static String film_types = "爱情,喜剧,动作,剧情,科幻,恐怖,动画,惊悚,犯罪,冒险,其他";
	private final static String film_areas = "美国,大陆,香港,台湾,韩国,日本,泰国,英国,法国,其他";
	private final static String studio_types = "1D,2D,3D,极棒,刺激";
	private final static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	
	private static int count = 0;

	/*
	 * 获取影片的图片并将图片的路径保存在服务器及项目中
	 */
	public static String getFilmImgPath(HttpServletRequest request) {
		//获取根路径，生成一个目录文件，在服务器中存放文件
		File dir = new File(request.getServletContext().getRealPath("/film_img"));
		String filmImgName = null;
		String filmImg_path = null;
		if(!dir.exists()){
			dir.mkdirs();
		}
		if(request instanceof MultipartRequest){	//将请求对象转化为实现 MultipartRequest 接口的对象
			MultipartRequest mr = (MultipartRequest) request;
			MultipartFile mf = mr.getFile("filmImg");	//获取客户端提交的图片文件
			
			if(mf.getSize() > 0){
				filmImgName = Utils.getDistinctImgPath(mf.getOriginalFilename());	//获取独一无二的员工头像Id
				String service_path = request.getServletContext().getRealPath("/film_img/")+filmImgName;
				String ttms_path = "E:\\JavaWebEclipse\\WebAppCode\\ttms\\WebContent\\film_img\\" + filmImgName;
				//将其图片保存在项目的根目录下
				filmImg_path = "/ttms/film_img/" + filmImgName;
				//filmInfo.setFilm_img(filmImg_path);
				//将员工图片保存在目标文件中
				try {
					mf.transferTo(new File(dir,filmImgName));	//上传服务器
					mf.transferTo(new File(ttms_path));	//上传项目根目录下
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return filmImg_path;
	}
	
	/*
	 * 获取演出厅图片的路径
	 */
	public static String getStudioImgPath(HttpServletRequest request) {
		//获取根路径，生成一个目录文件，在服务器中存放文件
		File dir = new File(request.getServletContext().getRealPath("/studio_img"));
		String studioImgName = null;
		String studioImg_path = null;
		if(!dir.exists()){
			dir.mkdirs();
		}
		if(request instanceof MultipartRequest){	//将请求对象转化为实现 MultipartRequest 接口的对象
			MultipartRequest mr = (MultipartRequest) request;
			MultipartFile mf = mr.getFile("addImg");	//获取客户端提交的图片文件
			
			if(mf.getSize() > 0){
				studioImgName = Utils.getDistinctImgPath(mf.getOriginalFilename());	//获取独一无二的演出厅名称
				String service_path = request.getServletContext().getRealPath("/studio_img/")+studioImgName;
				String ttms_path = "E:\\JavaWebEclipse\\WebAppCode\\ttms\\WebContent\\studio_img\\" + studioImgName;
				//将其图片保存在项目的根目录下
				studioImg_path = "/ttms/studio_img/" + studioImgName;
				//filmInfo.setFilm_img(filmImg_path);
				//将员工图片保存在目标文件中
				try {
					mf.transferTo(new File(dir,studioImgName));	//上传服务器
					mf.transferTo(new File(ttms_path));	//上传项目根目录下
					} catch (IOException e) {
						e.printStackTrace();
					}
			}
		}
		return studioImg_path;
	}
	
	/*
	 * 泛型方法(获取客户端注册的参数信息)
	 */
	public static <T> T getParameter(HttpServletRequest request, String paraName, Class<T> toClass) {
		T result = null;
		String value = request.getParameter(paraName);
		if (value != null && value.length() > 0) {
			// 字符串类String，Number的子类都有一个接受String类型的构造函数
			try {
				result = toClass.getDeclaredConstructor(String.class).newInstance(value);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	/*
	 * 将年份、月份、天换算成具体的生日日期格式
	 */
	public static String getBirthdayDate(Integer year, Integer month, Integer day) {
		Calendar c = Calendar.getInstance();
		c.set(year, month - 1, day);
		Date newDate = c.getTime();
		return new SimpleDateFormat("yyyy-MM-dd").format(newDate);
	}

	/*
	 * 将其人工的职位进行分割
	 */
	public static List<String> getAllEmpPositions() {
		List<String> empPositionList = new ArrayList<String>();
		String[] strs = emp_positions.split(",");
		for (int i = 0; i < strs.length; i++) {
			empPositionList.add(strs[i]);
		}
		return empPositionList;
	}

	/*
	 * 将影片类型进行分割
	 */
	public static List<String> getAllFilmTypes() {
		List<String> filmTypeList = new ArrayList<String>();
		String[] strs = film_types.split(",");
		for (int i = 0; i < strs.length; i++) {
			filmTypeList.add(strs[i]);
		}
		return filmTypeList;
	}

	/*
	 * 将影片上映的地区分割
	 */
	public static List<String> getAllFilmAreas() {
		List<String> filmAreaList = new ArrayList<String>();
		String[] strs = film_areas.split(",");
		for (int i = 0; i < strs.length; i++) {
			filmAreaList.add(strs[i]);
		}
		return filmAreaList;
	}

	/*
	 * 获取演出厅的类型
	 */
	public static List<String> getAllStudioTypes() {
		List<String> studioList = new ArrayList<String>();
		String[] strs = studio_types.split(",");
		for (int i = 0; i < strs.length; i++) {
			studioList.add(strs[i]);
		}
		return studioList;
	}

	/*
	 * 获取当前的年份
	 */
	public static Integer getCurrentYear() {
		Calendar now = Calendar.getInstance();
		Integer currentYear = now.get(Calendar.YEAR);
		return currentYear;
	}

	/*
	 * 获取独一无二的员工头像名称值
	 */
	public static String getDistinctImgPath(String name) {
		Date date = new Date();
		String fileName = sdf.format(date);
		fileName += (++count) % 100;
		
		//获取图片的后扩展名
		int index = name.lastIndexOf(".");
		String extension = null;
		if(index > 0 ){
			extension = name.substring(index);
		}
		if(extension != null){
			fileName += extension;
		}
		return fileName; // 返回独一无二的文件名称
	}

	/*
	 * 根据影片的开始时间和时长，获取影片的结束时间
	 */
	public static String getFilmEndTime(String film_begintime, Integer film_length) {
		//分割影片开始时间(小时和分钟)
		int[] time = new int[2];
		String[] film_times = film_begintime.split(":");
		//记录小时和分钟数值
		time[0] = Integer.valueOf(film_times[0]);
		time[1] = Integer.valueOf(film_times[1]);
		
		//获取影片时长的小时和分钟
		int hours = film_length / 60;
		int minutes = film_length % 60;
		
		time[0] += hours;
		time[1] += minutes;
		if(time[1] > 60){
			time[0] += 1;
			time[1] -= 60;			
		}
		
		StringBuffer film_endtime = new StringBuffer("");
		film_endtime.append(String.valueOf(time[0]));
		film_endtime.append(":");
		String m = null;
		if(time[1] < 10){
			m = "0" + String.valueOf(time[1]);
		}else{
			m = String.valueOf(time[1]);
		}
		film_endtime.append(m);
		return film_endtime.toString();
	}

	/*
	 * 获取可以放映的影片时间段(两个半小时播放一步电影)
	 * (8:00 - 1) (11:00 - 2) (14:00 - 3) (17:00 - 4) (20:00 - 5) (23:00 - 6)
	 */
	public static List<String> getUseSegTimeList(List<ScheduleInfo> scheList) {
		//保存可选时间数组(并为初始化)
		List<String> timeSegList = new ArrayList<String>();
		timeSegList.add("8:00");timeSegList.add("11:00");timeSegList.add("14:00");
		timeSegList.add("17:00");timeSegList.add("20:00");timeSegList.add("23:00");
		
		for (ScheduleInfo scheInfo : scheList) {
			switch(scheInfo.getFilm_begintime()){
				case "8:00":
					timeSegList.remove("8:00");
					continue;
				case "11:00":
					timeSegList.remove("11:00");
					continue;
				case "14:00":
					timeSegList.remove("14:00");
					continue;
				case "17:00":
					timeSegList.remove("17:00");
					continue;
				case "20:00":
					timeSegList.remove("20:00");
					continue;
				case "23:00":
					timeSegList.remove("23:00");
					continue;
			}
		}
		return timeSegList;
	}

	/*
	 * 创建一个状态数组(保存该演出厅中的座位状态) -1代表空缺，1代表损坏,0代表默认 正常
	 */
	public static int[][] getInitSeatStatusArray(List<SeatInfo> seatList, int rows, int cols) {
		int[][] seatStatus = new int[rows][cols];
		SeatInfo seatInfo = null;
		if(seatList != null){
			for (int i = 0; i < seatList.size(); i++) {
				seatInfo = seatList.get(i);
				if(seatInfo.getSeat_status() == -1){
					seatStatus[seatInfo.getSeat_row()][seatInfo.getSeat_col()] = -1;
				}else{
					seatStatus[seatInfo.getSeat_row()][seatInfo.getSeat_col()] = 1;
				}
			}
		}
		return seatStatus;
	}

	/*
	 * 获取已买过票的演出厅中座位状态(0代表可用，1代表损坏，-1代表空缺，2代表已售)
	 */
	public static int[][] getSeatStatusArray(List<TicketInfo> ticketList, List<SeatInfo> seatList, int rows, int cols) {
		int[][] seatStatus = new int[rows][cols];
		SeatInfo seatInfo = null;
		TicketInfo ticketInfo = null;
		if(seatList != null){
			for (int i = 0; i < seatList.size(); i++) {
				seatInfo = seatList.get(i);
				if(seatInfo.getSeat_status() == -1){
					seatStatus[seatInfo.getSeat_row()][seatInfo.getSeat_col()] = -1;
				}else{
					seatStatus[seatInfo.getSeat_row()][seatInfo.getSeat_col()] = 1;
				}
			}
		}
		if(ticketList != null){
			for (int i = 0; i < ticketList.size(); i++) {
				ticketInfo = ticketList.get(i);
				seatStatus[ticketInfo.getSeat_row()][ticketInfo.getSeat_col()] = 2;
			}
		}
		return seatStatus;
	}

}
