package cn.itcast.core.service;

import cn.itcast.common.utils.Page;
import cn.itcast.core.bean.Customer;
import cn.itcast.core.bean.SysUser;



public interface CustomerService {

	// 查询客户列表
	public Page<Customer> findCustomerList(Integer page, Integer rows, 
			String custName,  String custSource,String custIndustry,String custLevel);
	
	// 查询基本信息
	public Page<Customer> getCustomerList(Long id, String custName,  String custSource,String custIndustry,String custLevel);
	
	// 关注客户列表
	public Page<Customer> concernCustomerList(Integer page, Integer rows, 
				String custName,  String custSource,String custIndustry,String custLevel);
		
	// 查询数据列表
	public Page<SysUser> findUserList(Integer page, Integer rows);

	public Customer getCustomerById(Long id);
	
	//public Customer getCustomerList(Long id);

	public void updateCustomer(Customer customer);

	public void insertCustomer(Customer customer);
	
	public void deleteCustomer(Long id);
	
	public void updateCustomerStatu(Long id);
	
	public void updateCustomerStatuCancel(Long id);
	public SysUser selectUserLogin(String telephone,String password);
}
