package com.xupt.ttms.dao;

import java.util.List;
import java.util.Map;

import com.xupt.ttms.vo.SeatInfo;
import com.xupt.ttms.vo.StudioInfo;

/**
 * 
 * @author lenovo
 * @category 座位数据库访问层接口
 */
public interface SeatDao {

	/*
	 * 获取所有的演出厅
	 */
	List<StudioInfo> getAllStudios();

	/*
	 * 保存当前演出厅中座位的状态
	 */
	void saveSeatStatus(Map<String, Object> condition);

	/*
	 * 根据演出厅编号，获取其座位的状态
	 */
	List<SeatInfo> getSeatStatusByStudioId(Integer studio_id);

	/*
	 * 根据座位的编号，获取座位的信息
	 */
	SeatInfo getSeatBySeatId(Integer seat_id);

	/*
	 * 若座位状态为1可用，就删除
	 */
	void deleteSeatBySeatId(SeatInfo seatInfo);

	/*
	 * 否则更新
	 */
	void updateSeatBySeatId(SeatInfo seatInfo);

	/*
	 * 根据演出厅编号，删除该影厅所对应的全部座位
	 */
	void deleteSeatByStudioId(Integer studio_id);

	/*
	 * 根据演出厅编号，初始化座位表
	 */
	StudioInfo getInitSeatsByStudioId(Integer studio_id);

	/*
	 * 根据座位的行列号，删除该座位
	 */
	void deleteSeatStatus(Map<String, Object> condition);

}
