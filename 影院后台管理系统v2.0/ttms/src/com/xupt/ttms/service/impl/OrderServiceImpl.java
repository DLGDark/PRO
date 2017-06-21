package com.xupt.ttms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xupt.ttms.dao.OrderDao;
import com.xupt.ttms.dao.ScheduleDao;
import com.xupt.ttms.dao.SeatDao;
import com.xupt.ttms.dao.TicketDao;
import com.xupt.ttms.service.OrderService;
import com.xupt.ttms.vo.OrderInfo;
import com.xupt.ttms.vo.SeatInfo;
import com.xupt.ttms.vo.TicketInfo;

/**
 * 
 * @author lenovo
 * @category 订单业务逻辑层接口实现类
 */
@Service(value="orderService")
public class OrderServiceImpl implements OrderService{
	
	@Resource
	private OrderDao orderDao;
	@Resource
	private SeatDao seatDao;
	@Resource
	private TicketDao ticketDao;
	@Resource
	private ScheduleDao scheduleDao;

	@Override
	public List<SeatInfo> getSeatsSpread(Integer studio_id) {
		List<SeatInfo> seatList = null;
		try{
			seatList = this.orderDao.getSeatsSpread(studio_id);
		} catch(Exception e){
			e.printStackTrace();
		}
		return seatList;
	}

	@Override
	public boolean saveOrder(int[] seatRows, int[] seatCols, Integer studio_id,OrderInfo orderInfo) {
		boolean result = true;
		TicketInfo ticketInfo = null;
		try{
			//保存订单中一条记录
			this.orderDao.saveOrder(orderInfo);
			//根据订单编号，生成多张票表记录(一个座位对应一个票表记录)
			for (int i = 0; i < seatCols.length; i++) {
				ticketInfo = new TicketInfo();
				ticketInfo.setOrder_id(orderInfo.getOrder_id());
				ticketInfo.setSeat_row(seatRows[i]);
				ticketInfo.setSeat_col(seatCols[i]);
				ticketInfo.setTicket_date(orderInfo.getOrder_time());
				ticketInfo.setTicket_price(orderInfo.getOrder_price() / seatCols.length);
				//保存票记录
				this.ticketDao.saveTicket(ticketInfo);
			}
		} catch(Exception e){
			//事务回滚，删除记录
			this.orderDao.deleteOrder(orderInfo);
			e.printStackTrace();
			result = false;
		}
		return result;
	}

}
