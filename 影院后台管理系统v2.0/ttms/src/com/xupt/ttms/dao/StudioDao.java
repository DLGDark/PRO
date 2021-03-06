package com.xupt.ttms.dao;

import java.util.List;

import com.xupt.ttms.vo.StudioInfo;

/**
 * 
 * @author lenovo
 * @category 演出厅数据库访问层接口
 */
public interface StudioDao {

	/*
	 * 添加演出厅
	 */
	void addStudio(StudioInfo studioInfo);

	/*
	 * 获取演出厅列表
	 */
	List<StudioInfo> getStudioList();

	/*
	 * 根据演出厅id，获取演出厅详情
	 */
	StudioInfo getStudioByStudioId(Integer studio_id);

	/*
	 * 更新演出厅
	 */
	void updateStudio(StudioInfo studioInfo);

	/*
	 * 批量删除演出厅
	 */
	int deleteStudio(Integer studio_id);

}
