package cn.itcast.core.bean;

import java.io.Serializable;
import java.util.Date;

public class Message implements Serializable{
	private Long wor_id;
	private String user_name;
	private String wor_remark;
	private Date wor_createtime;
	public Long getWor_id() {
		return wor_id;
	}
	public void setWor_id(Long wor_id) {
		this.wor_id = wor_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getWor_remark() {
		return wor_remark;
	}
	public void setWor_remark(String wor_remark) {
		this.wor_remark = wor_remark;
	}
	public Date getWor_createtime() {
		return wor_createtime;
	}
	public void setWor_createtime(Date wor_createtime) {
		this.wor_createtime = wor_createtime;
	}
	
	
	
	
}
