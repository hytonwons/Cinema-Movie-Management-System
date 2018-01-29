package action;

import java.util.ArrayList;
import java.util.List;

import service.RegisterInfoService;
import service.RemainderService;
import service.SessionService;
import service.TicketService;
import model.MovieSession;
import model.Ticket;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Member_SeatAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int sessionID;
	
	private List<Ticket> ticketList = new ArrayList<Ticket>();
	private MovieSession ms;
	private int remainder;
	private int per;
	
	private RegisterInfoService service1;
	private TicketService service2;
	private SessionService service3;
	private RemainderService service4;
	public int getSessionID() {
		return sessionID;
	}
	public void setSessionID(int sessionID) {
		this.sessionID = sessionID;
	}
	public List<Ticket> getTicketList() {
		return ticketList;
	}
	public void setTicketList(List<Ticket> ticketList) {
		this.ticketList = ticketList;
	}
	public MovieSession getMs() {
		return ms;
	}
	public void setMs(MovieSession ms) {
		this.ms = ms;
	}
	public int getRemainder() {
		return remainder;
	}
	public void setRemainder(int remainder) {
		this.remainder = remainder;
	}
	public int getPer() {
		return per;
	}
	public void setPer(int per) {
		this.per = per;
	}
	public RegisterInfoService getService1() {
		return service1;
	}
	public void setService1(RegisterInfoService service1) {
		this.service1 = service1;
	}
	public TicketService getService2() {
		return service2;
	}
	public void setService2(TicketService service2) {
		this.service2 = service2;
	}
	public SessionService getService3() {
		return service3;
	}
	public void setService3(SessionService service3) {
		this.service3 = service3;
	}
	public RemainderService getService4() {
		return service4;
	}
	public void setService4(RemainderService service4) {
		this.service4 = service4;
	}
	
	public String execute()throws Exception{
		ActionContext ctx = ActionContext.getContext();
		String userID = (String)ctx.getSession().get("userID");
		double discount = service1.getDiscount(userID);
		ticketList = service2.getTicket(sessionID);
		ms = service3.getSessionByID(sessionID);
		per = (int) (ms.getPrice()*discount);
		remainder = service4.getRemainder(userID);
		return SUCCESS;
	}
}
