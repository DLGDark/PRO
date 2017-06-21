package com.xupt.ttms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xupt.ttms.common.Constants;
import com.xupt.ttms.dao.FilmDao;
import com.xupt.ttms.dao.OrderDao;
import com.xupt.ttms.dao.ScheduleDao;
import com.xupt.ttms.dao.TicketDao;
import com.xupt.ttms.service.FilmService;
import com.xupt.ttms.vo.FilmInfo;
import com.xupt.ttms.vo.OrderInfo;
import com.xupt.ttms.vo.ScheduleInfo;

/**
 * 
 * @author lenovo
 * @category 影片业务逻辑层接口实现类
 */
@Service(value = "filmService")
public class FilmServiceImpl implements FilmService {

	@Resource
	private FilmDao filmDao;
	@Resource
	private ScheduleDao scheDao;
	@Resource
	private OrderDao orderDao;
	@Resource
	private TicketDao ticketDao;

	@Override
	public boolean addFilm(FilmInfo filmInfo) {
		boolean result = true;
		try {
			this.filmDao.addFilm(filmInfo);
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Override
	public Integer getSearchPageCount(Map<String, Object> condition) {
		int recordCount = 0;
		try {
			recordCount = this.filmDao.getSearchPageCount(condition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (recordCount + (Constants.WEB_PAGE_FILM_NUM - 1)) / Constants.WEB_PAGE_FILM_NUM;
	}

	@Override
	public List<FilmInfo> searchFilm(Map<String, Object> condition, int pageNum) {
		List<FilmInfo> filmList = null;
		try {
			// 设置起始编号和终止编号
			condition.put("startRownum", (pageNum - 1) * Constants.WEB_PAGE_FILM_NUM);
			condition.put("pageFilmNum", Constants.WEB_PAGE_FILM_NUM);

			filmList = this.filmDao.searchFilm(condition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filmList;
	}

	@Override
	public List<FilmInfo> getFilmList() {
		List<FilmInfo> filmList = null;
		try {
			filmList = this.filmDao.getFilmList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filmList;
	}

	@Override
	public int batchDeleteFilms(int[] films) {
		int count = 0;
		//获取每个影片所在的演出计划列表
		List<ScheduleInfo> scheList = new ArrayList<ScheduleInfo>();
		ScheduleInfo scheInfo = null;
		try{
			for (int i = 0; i < films.length; i++) {
				//删除该影片对应的演出计划列表
				this.scheDao.deleteSchedulesByFilmId(i);
			}
			//批量删除影片
			count = this.filmDao.batchDeleteFilms(films);
		} catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public FilmInfo getFilmInfoByFilmId(Integer film_id) {
		FilmInfo filmInfo = null;
		try{
			filmInfo = this.filmDao.getFilmInfoByFilmId(film_id);
		} catch(Exception e){
			e.printStackTrace();
		}
		return filmInfo;
	}

	@Override
	public boolean updateFilm(FilmInfo filmInfo) {
		boolean result = true;
		try{
			this.filmDao.updateFilm(filmInfo);
		} catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Override
	public Integer getPageCount() {
		int recordCount = 0;
		try {
			recordCount = this.filmDao.getPageCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (recordCount + (Constants.WEB_PAGE_FILM_NUM - 1)) / Constants.WEB_PAGE_FILM_NUM;
	}

	@Override
	public List<FilmInfo> getCurrentPageFilms(int pageNum) {
		List<FilmInfo> filmList = null;
		Map<String,Object> condition = new HashMap<String,Object>();
		try {
			// 设置起始编号和终止编号
			condition.put("startRownum", (pageNum - 1) * Constants.WEB_PAGE_FILM_NUM);
			condition.put("pageFilmNum", Constants.WEB_PAGE_FILM_NUM);

			filmList = this.filmDao.getCurrentPageFilms(condition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filmList;
	}

}
