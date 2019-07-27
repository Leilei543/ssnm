package cn.itcast.core.bean;

import java.io.Serializable;
import java.util.Date;

public class MeterData implements Serializable {
	
	private Long data_id;   //主键id
	private Long cust_id;  //客户id对应
	private String data_menuname;// 项目名称
	private String data_width;  //宽度
	private String data_higth; //高度 
	private String data_land; //厚度
	private String data_area;  //面积  
	private Date data_createtime;	//创建时间	
	private String data_statu;//状态
	private Integer start;
	private Integer rows;
	private String data_remark; //备注
	
	
	public String getData_remark() {
		return data_remark;
	}
	public void setData_remark(String data_remark) {
		this.data_remark = data_remark;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Long getData_id() {
		return data_id;
	}
	public void setData_id(Long data_id) {
		this.data_id = data_id;
	}
	public Long getCust_id() {
		return cust_id;
	}
	public void setCust_id(Long cust_id) {
		this.cust_id = cust_id;
	}
	public String getData_menuname() {
		return data_menuname;
	}
	public void setData_menuname(String data_menuname) {
		this.data_menuname = data_menuname;
	}
	public String getData_width() {
		return data_width;
	}
	public void setData_width(String data_width) {
		this.data_width = data_width;
	}
	public String getData_higth() {
		return data_higth;
	}
	public void setData_higth(String data_higth) {
		this.data_higth = data_higth;
	}
	public String getData_land() {
		return data_land;
	}
	public void setData_land(String data_land) {
		this.data_land = data_land;
	}
	public String getData_area() {
		return data_area;
	}
	public void setData_area(String data_area) {
		this.data_area = data_area;
	}
	public Date getData_createtime() {
		return data_createtime;
	}
	public void setData_createtime(Date data_createtime) {
		this.data_createtime = data_createtime;
	}
	public String getData_statu() {
		return data_statu;
	}
	public void setData_statu(String data_statu) {
		this.data_statu = data_statu;
	}
	
	
	
}
