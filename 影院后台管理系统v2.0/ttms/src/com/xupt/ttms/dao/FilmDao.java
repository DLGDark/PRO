package com.xupt.ttms.dao;

import java.util.List;
import java.util.Map;

import com.xupt.ttms.vo.FilmInfo;

/**
 * 
 * @author lenovo
 * @category 影片数据库访问层接口
 */
public interface FilmDao {

	/*
	 * 添加影片
	 */
	void addFilm(FilmInfo filmInfo);

	/*
	 * 根据检索条件获取总页数
	 */
	int getSearchPageCount(Map<String, Object> condition);

	/*
	 * 根据检索条件，获取当前分页中的数据
	 */
	List<FilmInfo> searchFilm(Map<String, Object> condition);

	/*
	 * 获取影片列表
	 */
	List<FilmInfo> getFilmList();

	/*
	 * 批量删除影片
	 */
	int batchDeleteFilms(int[] films);

	/*
	 * 根据影片id，获取影片的详情
	 */
	FilmInfo getFilmInfoByFilmId(Integer film_id);

	/*
	 * 更新影片信息
	 */
	void updateFilm(FilmInfo filmInfo);

	/*
	 * 获取总页数
	 */
	int getPageCount();

	/*
	 * 获取当前页的影片个数
	 */
	List<FilmInfo> getCurrentPageFilms(Map<String, Object> condition);

	/*
	 * 根据影片编号，删除影片信息
	 */
	void deleteFilmByFilmId(int i);

}
