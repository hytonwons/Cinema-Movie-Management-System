package action;


import java.util.Calendar;

import model.AgePercentage;
import model.CashCardPercentage;
import model.GenderPercentage;
import model.VIPPercentage;
import model.ValidatePercentage;
import service.ConsumeService;
import service.RegisterInfoService;
import service.SessionService;
import service.TicketService;
import service.ValidateService;

import com.opensymphony.xwork2.ActionSupport;

public class Manager_ChartAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String execute()throws Exception{
		setGender(service1.getGenderPercentage());
		System.out.println(gender.getMan());
		age = service1.getAgePercentage();
		vip = service1.getVIPPercentage();
		cc = service2.getCashCardPercentage();
		valid = service3.getValidatePercentage();
		/*
		 * 得到最近30天
		 */
		for(int i=0;i<30;i++){
			thirtydate[i] = getDateSomeDayEalier(29-i);
		}
		thirtyDateString.append("['");
		for(int i=0;i<29;i++){
			thirtyDateString.append(thirtydate[i].toString().substring(5, 10))
			.append("','");
		}
		thirtyDateString.append(thirtydate[29].toString().substring(5, 10)).append("']");
		
		/*
		 * 统计每日总消费
		 */
		consume = service4.getConsumeByDate(thirtydate);
		consumeString.append("[");
		for(int i=0;i<29;i++){
			consumeString.append(consume[i])
			.append(",");
		}
		consumeString.append(consume[29]).append("]");
		/*
		 * 统计每日总人数
		 */
		totalPeople = service5.getTotalPeople(thirtydate);
		totalPeopleString.append("[");
		for(int i=0;i<29;i++){
			totalPeopleString.append(totalPeople[i])
			.append(",");
		}
		totalPeopleString.append(totalPeople[29]).append("]");
		//System.out.println(totalPeopleString);
		/*
		 * 得到最近7天
		 */
		for(int i=0;i<7;i++){
			sevenDate[i] = getDateSomeDayEalier(6-i);
		}
		sevenDateString.append("['");
		for(int i=0;i<6;i++){
			sevenDateString.append(sevenDate[i].toString().substring(5, 10))
			.append("','");
		}
		sevenDateString.append(sevenDate[6].toString().substring(5, 10)).append("']");
		/*
		 * 得到各影厅上座率
		 */
		hall1Rate = service5.getHallRate(sevenDate,1);
		hall2Rate = service5.getHallRate(sevenDate,2);
		hall3Rate = service5.getHallRate(sevenDate,3);
		hall4Rate = service5.getHallRate(sevenDate,4);
		hall5Rate = service5.getHallRate(sevenDate,5);
		
		hall1String.append("[");
		hall2String.append("[");
		hall3String.append("[");
		hall4String.append("[");
		hall5String.append("[");
		for(int i=0;i<6;i++){
			hall1String.append(hall1Rate[i])
			.append(",");
			hall2String.append(hall2Rate[i])
			.append(",");
			hall3String.append(hall3Rate[i])
			.append(",");
			hall4String.append(hall4Rate[i])
			.append(",");
			hall5String.append(hall5Rate[i])
			.append(",");
		}
		hall1String.append(hall1Rate[6]).append("]");
		hall2String.append(hall2Rate[6]).append("]");
		hall3String.append(hall3Rate[6]).append("]");
		hall4String.append(hall4Rate[6]).append("]");
		hall5String.append(hall5Rate[6]).append("]");
		/*
		 * 得到各影片上座率
		 */
		movie1Rate = service5.getMovieRate(sevenDate,"天将雄狮");
		movie2Rate = service5.getMovieRate(sevenDate,"澳门风云2");
		movie3Rate = service5.getMovieRate(sevenDate,"狼图腾");
		movie4Rate = service5.getMovieRate(sevenDate,"冲上云霄");
		movie5Rate = service5.getMovieRate(sevenDate,"钟馗伏魔");
		
		movie1String.append("[");
		movie2String.append("[");
		movie3String.append("[");
		movie4String.append("[");
		movie5String.append("[");
		for(int i=0;i<6;i++){
			movie1String.append(movie1Rate[i])
			.append(",");
			movie2String.append(movie2Rate[i])
			.append(",");
			movie3String.append(movie3Rate[i])
			.append(",");
			movie4String.append(movie4Rate[i])
			.append(",");
			movie5String.append(movie5Rate[i])
			.append(",");
		}
		movie1String.append(movie1Rate[6]).append("]");
		movie2String.append(movie2Rate[6]).append("]");
		movie3String.append(movie3Rate[6]).append("]");
		movie4String.append(movie4Rate[6]).append("]");
		movie5String.append(movie5Rate[6]).append("]");
		return SUCCESS;
	}
	
	public RegisterInfoService getService1() {
		return service1;
	}

	public void setService1(RegisterInfoService service1) {
		this.service1 = service1;
	}

	public GenderPercentage getGender() {
		return gender;
	}

	public void setGender(GenderPercentage gender) {
		this.gender = gender;
	}

	public AgePercentage getAge() {
		return age;
	}

	public void setAge(AgePercentage age) {
		this.age = age;
	}

	public VIPPercentage getVip() {
		return vip;
	}

	public void setVip(VIPPercentage vip) {
		this.vip = vip;
	}

	public TicketService getService2() {
		return service2;
	}

	public void setService2(TicketService service2) {
		this.service2 = service2;
	}

	public CashCardPercentage getCc() {
		return cc;
	}

	public void setCc(CashCardPercentage cc) {
		this.cc = cc;
	}

	public ValidateService getService3() {
		return service3;
	}

	public void setService3(ValidateService service3) {
		this.service3 = service3;
	}

	public ValidatePercentage getValid() {
		return valid;
	}

	public void setValid(ValidatePercentage valid) {
		this.valid = valid;
	}

	public ConsumeService getService4() {
		return service4;
	}

	public void setService4(ConsumeService service4) {
		this.service4 = service4;
	}
	
	private RegisterInfoService service1;
	private GenderPercentage gender;
	private AgePercentage age;
	private VIPPercentage vip;
	private TicketService service2;
	private CashCardPercentage cc;
	private ValidateService service3;
	private ValidatePercentage valid;
	private ConsumeService service4;
	private java.sql.Date[] thirtydate = new java.sql.Date[30];
	private int[] consume = new int[30];
	private StringBuffer consumeString = new StringBuffer();
	private StringBuffer thirtyDateString = new StringBuffer();
	private SessionService service5;
	private int[] totalPeople = new int[30];
	private StringBuffer totalPeopleString = new StringBuffer();
	private java.sql.Date[] sevenDate = new java.sql.Date[7];
	private StringBuffer sevenDateString = new StringBuffer();
	private double[] hall1Rate = new double[7];
	private double[] hall2Rate = new double[7];
	private double[] hall3Rate = new double[7];
	private double[] hall4Rate = new double[7];
	private double[] hall5Rate = new double[7];
	private StringBuffer hall1String = new StringBuffer();
	private StringBuffer hall2String = new StringBuffer();
	private StringBuffer hall3String = new StringBuffer();
	private StringBuffer hall4String = new StringBuffer();
	private StringBuffer hall5String = new StringBuffer();
	private double[] movie1Rate = new double[7];
	private double[] movie2Rate = new double[7];
	private double[] movie3Rate = new double[7];
	private double[] movie4Rate = new double[7];
	private double[] movie5Rate = new double[7];
	private StringBuffer movie1String = new StringBuffer();
	private StringBuffer movie2String = new StringBuffer();
	private StringBuffer movie3String = new StringBuffer();
	private StringBuffer movie4String = new StringBuffer();
	private StringBuffer movie5String = new StringBuffer();
	
	
	private java.sql.Date getDateSomeDayEalier(int i){
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) - i);
		java.sql.Date newDate = new java.sql.Date(calendar.getTimeInMillis());
		return newDate;
	}

	public StringBuffer getConsumeString() {
		return consumeString;
	}

	public void setConsumeString(StringBuffer consumeString) {
		this.consumeString = consumeString;
	}

	public StringBuffer getThirtyDateString() {
		return thirtyDateString;
	}

	public void setThirtyDateString(StringBuffer thirtyDateString) {
		this.thirtyDateString = thirtyDateString;
	}

	public SessionService getService5() {
		return service5;
	}

	public void setService5(SessionService service5) {
		this.service5 = service5;
	}

	public StringBuffer getTotalPeopleString() {
		return totalPeopleString;
	}

	public void setTotalPeopleString(StringBuffer totalPeopleString) {
		this.totalPeopleString = totalPeopleString;
	}

	public StringBuffer getSevenDateString() {
		return sevenDateString;
	}

	public void setSevenDateString(StringBuffer sevenDateString) {
		this.sevenDateString = sevenDateString;
	}

	public StringBuffer getHall1String() {
		return hall1String;
	}

	public void setHall1String(StringBuffer hall1String) {
		this.hall1String = hall1String;
	}

	public StringBuffer getHall2String() {
		return hall2String;
	}

	public void setHall2String(StringBuffer hall2String) {
		this.hall2String = hall2String;
	}

	public StringBuffer getHall3String() {
		return hall3String;
	}

	public void setHall3String(StringBuffer hall3String) {
		this.hall3String = hall3String;
	}

	public StringBuffer getHall4String() {
		return hall4String;
	}

	public void setHall4String(StringBuffer hall4String) {
		this.hall4String = hall4String;
	}

	public StringBuffer getHall5String() {
		return hall5String;
	}

	public void setHall5String(StringBuffer hall5String) {
		this.hall5String = hall5String;
	}

	public StringBuffer getMovie1String() {
		return movie1String;
	}

	public void setMovie1String(StringBuffer movie1String) {
		this.movie1String = movie1String;
	}

	public StringBuffer getMovie2String() {
		return movie2String;
	}

	public void setMovie2String(StringBuffer movie2String) {
		this.movie2String = movie2String;
	}

	public StringBuffer getMovie3String() {
		return movie3String;
	}

	public void setMovie3String(StringBuffer movie3String) {
		this.movie3String = movie3String;
	}

	public StringBuffer getMovie4String() {
		return movie4String;
	}

	public void setMovie4String(StringBuffer movie4String) {
		this.movie4String = movie4String;
	}

	public StringBuffer getMovie5String() {
		return movie5String;
	}

	public void setMovie5String(StringBuffer movie5String) {
		this.movie5String = movie5String;
	}
}
