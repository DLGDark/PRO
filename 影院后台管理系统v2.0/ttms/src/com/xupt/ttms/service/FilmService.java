package com.xupt.ttms.service;

import java.util.List;
import java.util.Map;

import com.xupt.ttms.vo.FilmInfo;

/**
 * 
 * @author lenovo
 * @category 影片业务逻辑层接口
 */
public interface FilmService {

	/*
	 * 添加影片
	 */
	boolean addFilm(FilmInfo filmInfo);
	
	/*
	 * 根据检索条件获取总页数
	 */
	Integer getSearchPageCount(Map<String, Object> condition);

	/*
	 * 根据检索条件，获取当前分页中的数据
	 */
	List<FilmInfo> searchFilm(Map<String, Object> condition, int i);

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
	boolean updateFilm(FilmInfo filmInfo);

	/*
	 * 获取总页数
	 */
	Integer getPageCount();

	/*
	 * 展示一页影片个数
	 */
	List<FilmInfo> getCurrentPageFilms(int i);

}
