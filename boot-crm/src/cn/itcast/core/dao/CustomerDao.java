package cn.itcast.core.dao;

import java.util.List;

import cn.itcast.core.bean.Customer;
import cn.itcast.core.bean.Message;
import cn.itcast.core.bean.MeterData;
import cn.itcast.core.bean.SysUser;

public interface CustomerDao {

	List<Customer> selectCustomerList(Customer customer);
	Integer selectCustomerListCount(Customer customer);
	
	List<Customer> selectConcernCustomerList(Customer customer);
	Integer selectConcernCustomerListCount(Customer customer);
	
	List<Customer> selectCustomerInform(Customer customer);
	
	List<MeterData> selectMeterDataList(MeterData meterData);
	Integer selectMeterDataListCount(MeterData meterData);
	
	List<SysUser> selectUserList(Customer customer);
	Integer selectUserListCount(Customer customer);
	
	
	Customer getCustomerById(Long id);
	void updateCustomer(Customer customer);
	void deleteCustomer(Long id);
	void updateCustomerStatu(Long id);
	void insertCustomer(Customer customer);
	
	void insertUser(SysUser sysUser);
	
	void insetMessage(Message message);
	
	void updateUserpassword(SysUser sysUser);
	
	Customer getCustomerList(Long id);
	void updateCustomerStatuCancel(Long id);
	SysUser selectUserLogin(SysUser sysUser);
	
	
}