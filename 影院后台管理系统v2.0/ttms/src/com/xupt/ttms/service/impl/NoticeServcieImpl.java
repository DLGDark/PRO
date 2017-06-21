package com.xupt.ttms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xupt.ttms.dao.NoticeDao;
import com.xupt.ttms.service.NoticeServcie;
import com.xupt.ttms.vo.NoticeInfo;
/**
 * 
 * @author lenovo
 * @category 公告业务逻辑层接口实现类
 */
@Service(value="noticeService")
public class NoticeServcieImpl implements NoticeServcie {

	@Resource
	private NoticeDao noticeDao;
	
	@Override
	public boolean publishNotice(NoticeInfo noticeInfo) {
		boolean result = true;
		try{
			this.noticeDao.publishNotice(noticeInfo);
		} catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Override
	public List<NoticeInfo> getNoticeList() {
		List<NoticeInfo> noticeList = null;
		try{
			noticeList = this.noticeDao.getNoticeList();
		} catch(Exception e){
			e.printStackTrace();
		}
		return noticeList;
	}

	@Override
	public NoticeInfo getNoticeByNoticeId(Integer notice_id) {
		NoticeInfo noticeInfo = null;
		try{
			noticeInfo = this.noticeDao.getNoticeByNoticeId(notice_id);
		} catch(Exception e){
			e.printStackTrace();
		}
		return noticeInfo;
	}

	@Override
	public boolean updateNotice(NoticeInfo noticeInfo) {
		boolean result = true;
		try{
			this.noticeDao.updateNotice(noticeInfo);
		} catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Override
	public int batchDeleteNotices(Integer[] noticeIds) {
		int count = 0;
		try{
			count = this.noticeDao.batchDeleteNotices(noticeIds);
		} catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}

}
