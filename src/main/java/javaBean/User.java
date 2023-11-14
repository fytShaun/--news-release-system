package javaBean;

import java.sql.Date;
import java.util.Objects;

public class User {

	private String username;
	private String password;
	private String favor;
	private String gender;
	private String state;
	private Date joinDate;
	private String identity;


	public User( String identity,String username, String password, String gender, String favor,String state) {
		this.identity = identity;
		this.username = username;
		this.password = password;
		this.gender = gender;
		this.favor = favor;
		this.state = state;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFavor() {
		return favor;
	}

	public void setFavor(String favor) {
		this.favor = favor;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}
}