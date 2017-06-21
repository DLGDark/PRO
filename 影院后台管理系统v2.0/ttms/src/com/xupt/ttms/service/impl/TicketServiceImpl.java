package com.xupt.ttms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xupt.ttms.dao.TicketDao;
import com.xupt.ttms.service.TicketService;
import com.xupt.ttms.vo.TicketInfo;
/**
 * 
 * @author lenovo
 * @category 票的业务逻辑层接口实现类
 */
@Service(value="ticketService")
public class TicketServiceImpl implements TicketService {
	
	@Resource
	private TicketDao ticketDao;

	@Override
	public List<TicketInfo> getAllTicketsByScheId(Integer sche_id) {
		List<TicketInfo> ticketList = null;
		try{
			ticketList = this.ticketDao.getAllTicketsByScheId(sche_id);
		} catch(Exception e){
			e.printStackTrace();
		}
		return ticketList;
	}

}
