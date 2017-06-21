package com.xupt.ttms.service;

import java.util.List;

import com.xupt.ttms.vo.SeatInfo;
import com.xupt.ttms.vo.StudioInfo;

/**
 * 
 * @author lenovo
 * @category 座位的业务逻辑层接口
 */
public interface SeatService {

	/*
	 * 获取所有的演出厅
	 */
	List<StudioInfo> getAllStudios();

	/*
	 * 保存当前演出厅中座位的状态
	 */
	boolean saveSeatStatus(int seatStatus, int seatRow, int seatCol,Integer studio_id);

	/*
	 * 根据演出厅编号，获取其座位的状态
	 */
	List<SeatInfo> getSeatStatusByStudioId(Integer studio_id);

	/*
	 * 根据座位的编号，获取座位的信息
	 */
	SeatInfo getSeatBySeatId(Integer seat_id);

	/*
	 * 根据座位编号，编辑演出厅座位的状态
	 */
	boolean editSeatStausBySeatId(SeatInfo seatInfo);

	/*
	 * 根据演出厅编号，初始化座位表
	 */
	StudioInfo getInitSeatsByStudioId(Integer studio_id);

}
