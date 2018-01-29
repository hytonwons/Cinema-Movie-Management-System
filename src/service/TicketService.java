package service;

import java.util.List;

import model.CashCardPercentage;
import model.Seat;
import model.Ticket;

public interface TicketService {
	public List<Ticket> getTicket(int sessionID);
	public Seat getRowAndCol(String ticket);
	public int insertTicketByCash(int sessionID,Seat s,int per);
	public int insertTicketByCard(int sessionID,String userID,Seat s,int per);
	public CashCardPercentage getCashCardPercentage();
}
