package cn.itcast.core.dao;

import java.util.List;

import cn.itcast.core.bean.Customer;
import cn.itcast.core.bean.SysUser;

public interface CustomerDao {

	List<Customer> selectCustomerList(Customer customer);
	Integer selectCustomerListCount(Customer customer);
	Customer getCustomerById(Long id);
	void updateCustomer(Customer customer);
	void deleteCustomer(Long id);
	void updateCustomerStatu(Long id);
	
	void updateCustomerStatuCancel(Long id);
	SysUser selectUserLogin(SysUser sysUser);
	
}