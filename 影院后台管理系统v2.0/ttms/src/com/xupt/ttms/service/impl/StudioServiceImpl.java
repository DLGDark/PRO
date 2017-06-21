package com.xupt.ttms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xupt.ttms.dao.ScheduleDao;
import com.xupt.ttms.dao.SeatDao;
import com.xupt.ttms.dao.StudioDao;
import com.xupt.ttms.service.StudioService;
import com.xupt.ttms.vo.StudioInfo;
/**
 * 
 * @author lenovo
 * @category 演出厅业务逻辑层接口实现类
 */
@Service(value="studioService")
public class StudioServiceImpl implements StudioService {
	
	@Resource
	private StudioDao studioDao;
	@Resource
	private SeatDao seatDao;
	@Resource
	private ScheduleDao scheduleDao;

	@Override
	public boolean addStudio(StudioInfo studioInfo) {
		boolean result = true;
		try{
			this.studioDao.addStudio(studioInfo);
		} catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Override
	public List<StudioInfo> getStudioList() {
		List<StudioInfo> studioList = null;
		try{
			studioList = this.studioDao.getStudioList();
		} catch(Exception e){
			e.printStackTrace();
		}
		return studioList;
	}

	@Override
	public StudioInfo getStudioByStudioId(Integer studio_id) {
		StudioInfo studioInfo = null;
		try{
			studioInfo = this.studioDao.getStudioByStudioId(studio_id);
		} catch(Exception e){
			e.printStackTrace();
		}
		return studioInfo;
	}

	@Override
	public boolean updateStudio(StudioInfo studioInfo) {
		boolean result = true;
		try{
			this.studioDao.updateStudio(studioInfo);
		} catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Override
	public int deleteStudio(Integer studio_id) {
		int count = 0;
		try{
			//删除该影厅所对应的全部座位
			this.seatDao.deleteSeatByStudioId(studio_id);
			//删除该演出厅对应的所有演出计划
			this.scheduleDao.deleteSchedulesByStudioId(studio_id);
			count = this.studioDao.deleteStudio(studio_id);
		} catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}

}
