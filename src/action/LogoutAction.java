package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String execute()throws Exception{
		ActionContext ctx = ActionContext.getContext();
		System.out.println(ctx.getSession().get("userID"));
		ctx.getSession().remove("userID");
		return SUCCESS;
	}
}
