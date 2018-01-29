package service.impl;

import java.math.BigDecimal;
import java.util.List;

import dao.TicketDao;
import model.CashCardPercentage;
import model.Seat;
import model.Ticket;
import service.TicketService;

public class TicketServiceImpl implements TicketService{

	private TicketDao dao;
	
	public TicketDao getDao() {
		return dao;
	}

	public void setDao(TicketDao dao) {
		this.dao = dao;
	}
	
	private TicketServiceImpl(){
		
	}
	
	@Override
	public List<Ticket> getTicket(int sessionID) {
		// TODO Auto-generated method stub
		return dao.getTicket(sessionID);
	}

	@Override
	public Seat getRowAndCol(String ticket) {
		// TODO Auto-generated method stub
		Seat s = new Seat();
		int l = ticket.length();
		s.setRow(Integer.parseInt(ticket.substring(0, 1)));
		if(l==4){
			s.setCol(Integer.parseInt(ticket.substring(2, 3)));
		}else{
			s.setCol(Integer.parseInt(ticket.substring(2, 4)));
		}
		return s;
	}

	@Override
	public int insertTicketByCash(int sessionID, Seat s, int per) {
		// TODO Auto-generated method stub
		Ticket t = new Ticket();
		t.setSessionID(sessionID);
		t.setUserID("");
		t.setRow(s.getRow());
		t.setColumn(s.getCol());
		t.setPrice(per);
		return dao.insert(t);
	}

	@Override
	public int insertTicketByCard(int sessionID, String userID, Seat s,
			int per) {
		// TODO Auto-generated method stub
		Ticket t = new Ticket();
		t.setSessionID(sessionID);
		t.setUserID(userID);
		t.setRow(s.getRow());
		t.setColumn(s.getCol());
		t.setPrice(per);
		return dao.insert(t);
	}

	@Override
	public CashCardPercentage getCashCardPercentage() {
		// TODO Auto-generated method stub
		int cash = dao.getCashPrice();
		int total = dao.getTotalPrice();
		int card = total-cash;
		BigDecimal b1 = new BigDecimal((double)cash*100/total);
		double cashp = b1.setScale(3, BigDecimal.ROUND_HALF_UP).doubleValue();
		BigDecimal b2 = new BigDecimal((double)card*100/total);
		double cardp = b2.setScale(3, BigDecimal.ROUND_HALF_UP).doubleValue();
		CashCardPercentage cp = new CashCardPercentage();
		cp.setCard(cardp);
		cp.setCash(cashp);
		return cp;
	}
}
