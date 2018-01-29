package action;

import java.util.ArrayList;
import java.util.List;

import service.SessionService;
import service.TicketService;
import model.MovieSession;
import model.Ticket;

import com.opensymphony.xwork2.ActionSupport;

public class Salesman_ShowSeatAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int sessionID;
	private Ticket ticket;
	private SessionService service1;
	private TicketService service2;
	private List<Ticket> ticketList = new ArrayList<Ticket>();
	private MovieSession ms;
	
	public int getSessionID() {
		return sessionID;
	}

	public void setSessionID(int sessionID) {
		this.sessionID = sessionID;
	}
	
	public Ticket getTicket() {
		return ticket;
	}

	public void setTicket(Ticket ticket) {
		this.ticket = ticket;
	}
	
	public SessionService getService1() {
		return service1;
	}

	public void setService1(SessionService service1) {
		this.service1 = service1;
	}

	public TicketService getService2() {
		return service2;
	}

	public void setService2(TicketService service2) {
		this.service2 = service2;
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
	
	public String execute()throws Exception{
		//System.out.println("SessionID is "+sessionID);
		setMs(service1.getSessionByID(sessionID));
//		HttpServletRequest request = ServletActionContext.getRequest(); 
//		request.setAttribute("ms",ms); 
		setTicketList(service2.getTicket(sessionID));
		return SUCCESS;
	}
}
