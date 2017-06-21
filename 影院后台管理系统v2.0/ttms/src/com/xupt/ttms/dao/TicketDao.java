package com.xupt.ttms.dao;

import java.util.List;
import java.util.Map;

import com.xupt.ttms.vo.TicketInfo;

/**
 * 
 * @author lenovo
 * @category 票的数据库访问层
 *  
 */
public interface TicketDao {

	/*
	 * 保存一条票的记录
	 */
	void saveTicket(TicketInfo ticketInfo);

	/*
	 * 根据订单编号，删除该订单中的所有票
	 */
	void delTicketInfoByOrderId(Integer order_id);

	/*
	 * 根据演出厅编号，获取当前演出计划所产生的所有票
	 */
	List<TicketInfo> getAllTicketsByScheId(Integer sche_id);
	
}
