package com.xupt.ttms.service;

import java.util.List;

import com.xupt.ttms.vo.TicketInfo;

/**
 * 
 * @author lenovo
 * @category 票的业务逻辑层接口
 */
public interface TicketService {

	/*
	 * 根据演出厅编号，获取当前演出计划所产生的所有票
	 */
	List<TicketInfo> getAllTicketsByScheId(Integer sche_id);

}
