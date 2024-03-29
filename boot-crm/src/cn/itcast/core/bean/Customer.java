package cn.itcast.core.bean;

import java.io.Serializable;
import java.util.Date;

public class Customer implements Serializable {
	private Long cust_id;   //客户编号(主键)
	private String cust_name;  //客户名称(公司名称)
	private Long cust_user_id;  //负责人id
	private Long cust_create_id;  //创建人id
	private String cust_source;  //客户信息地区
	private String cust_industry; //客户所属状态
	private String cust_level;    //客户级别
	private String cust_linkman;  //联系人
	private String cust_phone;		//固定电话
	private String cust_mobile;
	private String cust_zipcode;
	private String cust_address;
	private Date cust_createtime;
	private String cust_dataString;
	
	private String cust_wangwangID;  //
	private Integer start;
	private Integer rows;
	private String cust_statu;
	public String getCust_dataString() {
		return cust_dataString;
	}
	public void setCust_dataString(String cust_dataString) {
		this.cust_dataString = cust_dataString;
	}
	public String getCust_statu() {
		return cust_statu;
	}
	public void setCust_statu(String cust_statu) {
		this.cust_statu = cust_statu;
	}
	public String getCust_zipcode() {
		return cust_zipcode;
	}
	public void setCust_zipcode(String cust_zipcode) {
		this.cust_zipcode = cust_zipcode;
	}
	public String getCust_address() {
		return cust_address;
	}
	public void setCust_address(String cust_address) {
		this.cust_address = cust_address;
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
	public Long getCust_id() {
		return cust_id;
	}
	public void setCust_id(Long cust_id) {
		this.cust_id = cust_id;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public Long getCust_user_id() {
		return cust_user_id;
	}
	public void setCust_user_id(Long cust_user_id) {
		this.cust_user_id = cust_user_id;
	}
	public Long getCust_create_id() {
		return cust_create_id;
	}
	public void setCust_create_id(Long cust_create_id) {
		this.cust_create_id = cust_create_id;
	}
	public String getCust_source() {
		return cust_source;
	}
	public void setCust_source(String cust_source) {
		this.cust_source = cust_source;
	}
	public String getCust_industry() {
		return cust_industry;
	}
	public void setCust_industry(String cust_industry) {
		this.cust_industry = cust_industry;
	}
	public String getCust_level() {
		return cust_level;
	}
	public void setCust_level(String cust_level) {
		this.cust_level = cust_level;
	}
	public String getCust_linkman() {
		return cust_linkman;
	}
	public void setCust_linkman(String cust_linkman) {
		this.cust_linkman = cust_linkman;
	}
	public String getCust_phone() {
		return cust_phone;
	}
	public void setCust_phone(String cust_phone) {
		this.cust_phone = cust_phone;
	}
	public String getCust_mobile() {
		return cust_mobile;
	}
	public void setCust_mobile(String cust_mobile) {
		this.cust_mobile = cust_mobile;
	}
	public Date getCust_createtime() {
		return cust_createtime;
	}
	public void setCust_createtime(Date cust_createtime) {
		this.cust_createtime = cust_createtime;
	}
	public String getCust_wangwangID() {
		return cust_wangwangID;
	}
	public void setCust_wangwangID(String cust_wangwangID) {
		this.cust_wangwangID = cust_wangwangID;
	}
}