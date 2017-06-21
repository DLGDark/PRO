package com.xupt.ttms.dao;

import java.util.List;

import com.xupt.ttms.vo.FilmInfo;
import com.xupt.ttms.vo.ScheduleInfo;
import com.xupt.ttms.vo.StudioInfo;

/**
 * 
 * @author lenovo
 * @category 演出计划数据库访问层接口
 */
public interface ScheduleDao {

	/*
	 * 获取所有的演出厅列表
	 */
	List<StudioInfo> getAllStudios();

	/*
	 * 获取所有的影片列表
	 */
	List<FilmInfo> getAllFilms();

	/*
	 * 根据影厅的编号，获取电影列表
	 */
	List<ScheduleInfo> getFilmsByStudioId(Integer studio_id);

	/*
	 * 添加一条演出计划
	 */
	void saveFilmPlay(ScheduleInfo scheInfo);

	/*
	 * 获取演出计划中所有要放映的电影列表
	 */
	List<ScheduleInfo> getAllSchedules();

	/*
	 * 根据演出计划的编号，编辑这条记录
	 */
	ScheduleInfo getScheInfoByScheId(Integer sche_id);

	/*
	 * 根据演出计划的编号，更新一条记录
	 */
	void updateScheInfoByScheId(ScheduleInfo scheInfo);

	/*
	 * 批量删除演出计划
	 */
	int batchDeleteSchedules(Integer[] scheduleIds);

	/*
	 * 根据影片编号，获取影片在某演出厅的播放时间
	 */
	List<ScheduleInfo> getFilmPlayByFilmId(Integer film_id);

	/*
	 * 根据电影编号，获取所有的演出计划
	 */
	List<ScheduleInfo> getScheInfoByFilmId(int i);

	/*
	 * 根据影片编号，删除该影片对应的所有演出计划
	 */
	void deleteSchedulesByFilmId(int i);

	/*
	 * 根据演出厅编号，删除该演出厅对应的所有演出计划
	 */
	void deleteSchedulesByStudioId(Integer studio_id);

	/*
	 * 根据演出厅编号，获取所有的演出计划列表
	 */
	List<ScheduleInfo> getSchedulesByStuId(Integer studio_id);

	/*
	 * 根据演出计划编号，删除一条演出计划
	 */
	void deleteScheByScheId(Integer sche_id);

}
