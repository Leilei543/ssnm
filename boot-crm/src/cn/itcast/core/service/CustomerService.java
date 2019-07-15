package cn.itcast.core.service;

import cn.itcast.common.utils.Page;
import cn.itcast.core.bean.Customer;
import cn.itcast.core.bean.SysUser;



public interface CustomerService {

	// 查询客户列表
	public Page<Customer> findCustomerList(Integer page, Integer rows, 
			String custName,  String custSource,String custIndustry,String custLevel);

	public Customer getCustomerById(Long id);

	public void updateCustomer(Customer customer);

	public void deleteCustomer(Long id);
	
	public void updateCustomerStatu(Long id);
	
	public void updateCustomerStatuCancel(Long id);
	public SysUser selectUserLogin(String telephone,String password);
}
