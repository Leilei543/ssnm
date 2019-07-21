package cn.itcast.core.dao;

import java.util.List;

import cn.itcast.core.bean.Customer;
import cn.itcast.core.bean.SysUser;

public interface CustomerDao {

	List<Customer> selectCustomerList(Customer customer);
	Integer selectCustomerListCount(Customer customer);
	
	List<Customer> selectConcernCustomerList(Customer customer);
	Integer selectConcernCustomerListCount(Customer customer);
	
	List<Customer> selectCustomerInform(Customer customer);
	
	List<SysUser> selectUserList(Customer customer);
	Integer selectUserListCount(Customer customer);
	
	
	Customer getCustomerById(Long id);
	void updateCustomer(Customer customer);
	void deleteCustomer(Long id);
	void updateCustomerStatu(Long id);
	void insertCustomer(Customer customer);
	
	Customer getCustomerList(Long id);
	void updateCustomerStatuCancel(Long id);
	SysUser selectUserLogin(SysUser sysUser);
	
	
}