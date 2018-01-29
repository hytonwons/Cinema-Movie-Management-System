package action;

import java.util.List;

import service.PlanService;
import service.SessionService;
import model.MovieSession;
import model.Plan;

import com.opensymphony.xwork2.ActionSupport;

public class Manager_ApproveAjaxAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private PlanService service1;
	private SessionService service2;
	
	public PlanService getService1() {
		return service1;
	}
	public void setService1(PlanService service1) {
		this.service1 = service1;
	}
	public SessionService getService2() {
		return service2;
	}
	public void setService2(SessionService service2) {
		this.service2 = service2;
	}
	
	public String execute()throws Exception{
		List<Plan> plan = service1.getPlan();
		for(int i = 0;i<plan.size();i++){
			//System.out.println(plan.get(i));
			service1.updateState(plan.get(i).getID());
			MovieSession ms = new MovieSession();
			ms.setDate(plan.get(i).getDate());
			ms.setHallNum(plan.get(i).getHallNum());
			ms.setLeftSeat(80);
			ms.setMovieName(plan.get(i).getMovieName());
			ms.setPrice(plan.get(i).getPrice());
			ms.setStartTime(plan.get(i).getTime());
			service2.insert(ms);
		}
		return SUCCESS;
	}
}
