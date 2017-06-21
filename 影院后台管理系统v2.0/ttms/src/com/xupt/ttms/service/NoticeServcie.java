package com.xupt.ttms.service;

import java.util.List;

import com.xupt.ttms.vo.NoticeInfo;

/**
 * 
 * @author lenovo
 * @category 公告业务逻辑层接口
 */
public interface NoticeServcie {

	/*
	 * 发布公告
	 */
	boolean publishNotice(NoticeInfo noticeInfo);

	/*
	 * 获取公告列表
	 */
	List<NoticeInfo> getNoticeList();

	/*
	 * 根据公告id，获取公告详情
	 */
	NoticeInfo getNoticeByNoticeId(Integer notice_id);

	/*
	 * 更新公告
	 */
	boolean updateNotice(NoticeInfo noticeInfo);

	/*
	 * 批量删除公告
	 */
	int batchDeleteNotices(Integer[] noticeIds);
	
}
