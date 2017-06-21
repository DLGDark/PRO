package com.xupt.ttms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xupt.ttms.dao.SeatDao;
import com.xupt.ttms.service.SeatService;
import com.xupt.ttms.vo.SeatInfo;
import com.xupt.ttms.vo.StudioInfo;
/**
 * 
 * @author lenovo
 * @category 座位的业务逻辑层接口实现类
 */
@Service(value="seatServices")
public class SeatServiceImpl implements SeatService {
	
	@Resource
	private SeatDao seatDao;

	@Override
	public List<StudioInfo> getAllStudios() {
		List<StudioInfo> studioList = null;
		try{
			studioList = this.seatDao.getAllStudios();
		} catch(Exception e){
			e.printStackTrace();
		}
		return studioList;
	}

	@Override
	public boolean saveSeatStatus(int seatStatus, int seatRow, int seatCol,Integer studio_id) {
		boolean result = true;
		Map<String,Object> condition = new HashMap<String,Object>();
		try{
			condition.put("seat_row", seatRow);
			condition.put("seat_col", seatCol);
			if(seatStatus == 0){	//根据座位的行列号，删除该座位
				this.seatDao.deleteSeatStatus(condition);
			}else{	//更新
				condition.put("studio_id", studio_id);
				condition.put("seat_status", seatStatus);
				this.seatDao.saveSeatStatus(condition);
			}
		} catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Override
	public List<SeatInfo> getSeatStatusByStudioId(Integer studio_id) {
		List<SeatInfo> seatList = null;
		try{
			seatList = this.seatDao.getSeatStatusByStudioId(studio_id);
		} catch(Exception e){
			e.printStackTrace();
		}
		return seatList;
	}

	@Override
	public SeatInfo getSeatBySeatId(Integer seat_id) {
		SeatInfo seatInfo = null;
		try{
			seatInfo = this.seatDao.getSeatBySeatId(seat_id);
		} catch(Exception e){
			e.printStackTrace();
		}
		return seatInfo;
	}

	@Override
	public boolean editSeatStausBySeatId(SeatInfo seatInfo) {
		boolean result = true;
		try{
			if(seatInfo.getSeat_status() == '1'){	//座位可用
				this.seatDao.deleteSeatBySeatId(seatInfo);
			}else{
				this.seatDao.updateSeatBySeatId(seatInfo);
			}
		} catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Override
	public StudioInfo getInitSeatsByStudioId(Integer studio_id) {
		StudioInfo studioInfo = null;
		try{
			studioInfo = this.seatDao.getInitSeatsByStudioId(studio_id);
		} catch(Exception e){
			e.printStackTrace();
		}
		return studioInfo;
	}
	
	
}
