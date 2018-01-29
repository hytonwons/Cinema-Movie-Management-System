package action;

import service.ConsumeService;
import service.RegisterInfoService;
import service.RemainderService;
import service.SessionService;
import service.TicketService;
import service.ValidateService;
import model.Seat;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Member_TicketAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String ID;
	//从jsp页面得到的数据
	private int sessionID;
	private String ticket1;
	private String ticket2;
	private String ticket3;
	private int leftMoney;
	private int per;
	private int total;
	private String movieName;
	//即将传给jsp页面的数据
	private String message;
	private int ticket1ID;
	private int ticket2ID;
	private int ticket3ID;
	
	private TicketService service1;
    private ConsumeService service2;
    private RemainderService service3;
    private SessionService service4;
    private RegisterInfoService service5;
    private ValidateService service6;
    
	public String getTicket1() {
		return ticket1;
	}
	public void setTicket1(String ticket1) {
		this.ticket1 = ticket1;
	}
	public int getSessionID() {
		return sessionID;
	}
	public void setSessionID(int sessionID) {
		this.sessionID = sessionID;
	}
	public String getTicket2() {
		return ticket2;
	}
	public void setTicket2(String ticket2) {
		this.ticket2 = ticket2;
	}
	public String getTicket3() {
		return ticket3;
	}
	public void setTicket3(String ticket3) {
		this.ticket3 = ticket3;
	}
	public int getLeftMoney() {
		return leftMoney;
	}
	public void setLeftMoney(int leftMoney) {
		this.leftMoney = leftMoney;
	}
	public int getPer() {
		return per;
	}
	public void setPer(int per) {
		this.per = per;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getTicket1ID() {
		return ticket1ID;
	}
	public void setTicket1ID(int ticket1id) {
		ticket1ID = ticket1id;
	}
	public int getTicket2ID() {
		return ticket2ID;
	}
	public void setTicket2ID(int ticket2id) {
		ticket2ID = ticket2id;
	}
	public int getTicket3ID() {
		return ticket3ID;
	}
	public void setTicket3ID(int ticket3id) {
		ticket3ID = ticket3id;
	}
	public TicketService getService1() {
		return service1;
	}
	public void setService1(TicketService service1) {
		this.service1 = service1;
	}
	public ConsumeService getService2() {
		return service2;
	}
	public void setService2(ConsumeService service2) {
		this.service2 = service2;
	}
	public RemainderService getService3() {
		return service3;
	}
	public void setService3(RemainderService service3) {
		this.service3 = service3;
	}
	public SessionService getService4() {
		return service4;
	}
	public void setService4(SessionService service4) {
		this.service4 = service4;
	}
	public RegisterInfoService getService5() {
		return service5;
	}
	public void setService5(RegisterInfoService service5) {
		this.service5 = service5;
	}
	
	public String execute() throws Exception{
		message="";
		ActionContext ctx = ActionContext.getContext();
		ID = (String)ctx.getSession().get("userID");  
		if(total==0){
			setMessage("您尚未选座！");
			System.out.println(message);
			return SUCCESS;
		}
		if(leftMoney<total){
			setMessage("余额不足！");
			System.out.println(message);
			return SUCCESS;
		}
		if(service6.isCancled(ID)){
			setMessage("您已取消资格，请注册新账号来购票！");
			return SUCCESS;
		}
		if(service6.isPaused(ID)){
			setMessage("您的会员资格已暂停，请尽快充值来购票！");
			return SUCCESS;
		}
		if(service6.isStoped(ID)){
			setMessage("您的会员资格已停止，请注册新账号来购票！");
			return SUCCESS;
		}
		if(!ticket1.isEmpty()){
			setTicket1ID(cardProcess(ticket1));
		}
		if(!ticket2.isEmpty()){
			setTicket2ID(cardProcess(ticket2));
		}
		if(!ticket3.isEmpty()){
			setTicket3ID(cardProcess(ticket3));
		}
		service2.insertNewConsume(ID, total,movieName);
		service3.subRemainder(ID, total);
		service5.addPoint(ID, total);
		System.out.println("i am here");
		return SUCCESS;
	}
	
	private int cardProcess(String ticket){
		Seat s = new Seat();
		s = service1.getRowAndCol(ticket);
		int ticketID = service1.insertTicketByCard(sessionID, ID, s, per);
		service4.updateLeftSeat(sessionID);
		return ticketID;
	}
	public ValidateService getService6() {
		return service6;
	}
	public void setService6(ValidateService service6) {
		this.service6 = service6;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
}
