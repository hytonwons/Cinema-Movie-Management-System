package dao;

import java.util.List;

import model.Ticket;


public interface TicketDao {
	public List<Ticket> getTicket(int sessionID);
	public int insert(Ticket t);
	public int getCashPrice();
	public int getTotalPrice();
}
