package cn.itcast.core.bean;

import java.io.Serializable;
import java.util.Date;

public class SysUser implements Serializable {
	
	private Long user_id;
	private String user_code;
	private String username;
	private String password;
	private String user_state;
	private String telephone;
	private Date user_createtime;
	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
	public String getUser_code() {
		return user_code;
	}
	public void setUser_code(String user_code) {
		this.user_code = user_code;
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
	public String getUser_state() {
		return user_state;
	}
	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public Date getUser_createtime() {
		return user_createtime;
	}
	public void setUser_createtime(Date user_createtime) {
		this.user_createtime = user_createtime;
	}
	
	
	
}
