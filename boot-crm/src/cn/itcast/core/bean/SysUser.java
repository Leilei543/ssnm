package cn.itcast.core.bean;

import java.io.Serializable;
import java.util.Date;

public class SysUser implements Serializable {
	
	private Long user_id;
	private String user_code;
	private String user_name;
	private String user_password;
	private String user_state;
	private String user_phone;
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
	
	
	public String getUser_state() {
		return user_state;
	}
	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}
	
	public Date getUser_createtime() {
		return user_createtime;
	}
	public void setUser_createtime(Date user_createtime) {
		this.user_createtime = user_createtime;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	
	
	
}
