package com.xupt.ttms.dao;

import java.util.List;

import com.xupt.ttms.vo.NoticeInfo;

/**
 * 
 * @author lenovo
 * @category 公告数据库访问层接口
 */
public interface NoticeDao {

	/*
	 * 发布公告
	 */
	public void publishNotice(NoticeInfo noticeInfo);

	/*
	 * 获取公告列表
	 */
	public List<NoticeInfo> getNoticeList();

	/*
	 * 根据公告id，获取公告详情
	 */
	public NoticeInfo getNoticeByNoticeId(Integer notice_id);

	/*
	 * 更新公告
	 */
	public void updateNotice(NoticeInfo noticeInfo);

	/*
	 * 批量删除
	 */
	public int batchDeleteNotices(Integer[] noticeIds);
	
}
