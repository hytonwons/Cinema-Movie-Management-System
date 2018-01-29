package model;

import java.io.Serializable;

public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String ID;
	private String password;
	
	public void setID(String ID){
		this.ID = ID;
	}
	
	public String getID(){
		return ID;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public String getPassword(){
		return password;
	}

}
