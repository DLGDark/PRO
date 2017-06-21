package com.xupt.ttms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xupt.ttms.dao.ScheduleDao;
import com.xupt.ttms.service.ScheduleService;
import com.xupt.ttms.vo.FilmInfo;
import com.xupt.ttms.vo.ScheduleInfo;
import com.xupt.ttms.vo.StudioInfo;
/**
 * 
 * @author lenovo
 * @category 演出计划业务逻辑层接口实现类
 */
@Service(value="scheduleService")
public class ScheduleServiceImpl implements ScheduleService {
	
	@Resource
	private ScheduleDao scheduleDao;

	@Override
	public List<StudioInfo> getAllStudios() {
		List<StudioInfo> studioList = null;
		try{
			studioList = this.scheduleDao.getAllStudios();
		} catch(Exception e){
			e.printStackTrace();
		}
		return studioList;
	}

	@Override
	public List<FilmInfo> getAllFilms() {
		List<FilmInfo> filmList = null;
		try{
			filmList = this.scheduleDao.getAllFilms();
		} catch(Exception e){
			e.printStackTrace();
		}
		return filmList;
	}

	@Override
	public List<ScheduleInfo> getFilmsByStudioId(Integer studio_id) {
		List<ScheduleInfo> scheList = null;
		try{
			scheList = this.scheduleDao.getFilmsByStudioId(studio_id);
		} catch(Exception e){
			e.printStackTrace();
		}
		return scheList;
	}

	@Override
	public void saveFilmPlay(ScheduleInfo scheInfo) {
		try{
			this.scheduleDao.saveFilmPlay(scheInfo);
		} catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public List<ScheduleInfo> getAllSchedules() {
		List<ScheduleInfo> scheList  = null;
		try{
			scheList = this.scheduleDao.getAllSchedules();
		} catch(Exception e){
			e.printStackTrace();
		}
		return scheList;
	}

	@Override
	public ScheduleInfo getScheInfoByScheId(Integer sche_id) {
		ScheduleInfo scheInfo = null;
		try{
			scheInfo = this.scheduleDao.getScheInfoByScheId(sche_id);
		} catch(Exception e){
			e.printStackTrace();
		}
		return 	scheInfo;
	}

	@Override
	public boolean updateScheInfoByScheId(ScheduleInfo scheInfo) {
		boolean result = true;
		try{
			this.scheduleDao.updateScheInfoByScheId(scheInfo);
		} catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Override
	public int batchDeleteSchedules(Integer[] scheduleIds) {
		int count = 0;
		try{
			count = this.scheduleDao.batchDeleteSchedules(scheduleIds);
		} catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<ScheduleInfo> getFilmPlayByFilmId(Integer film_id) {
		 List<ScheduleInfo> scheList = null;
		 try{
			 scheList = this.scheduleDao.getFilmPlayByFilmId(film_id);
		 } catch(Exception e){
			 e.printStackTrace();
		 }
		return scheList;
	}

	@Override
	public List<ScheduleInfo> getSchedulesByStuId(Integer studio_id) {
		List<ScheduleInfo> scheList = null;
		try{
			scheList = this.scheduleDao.getSchedulesByStuId(studio_id);
		} catch(Exception e){
			e.printStackTrace();
		}
		return scheList;
	}

	@Override
	public void deleteScheByScheId(Integer sche_id) {
		try{
			this.scheduleDao.deleteScheByScheId(sche_id);
		} catch(Exception e){
			e.printStackTrace();
		}
	}

}
