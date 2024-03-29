package cn.itcast.core.service;

import cn.itcast.common.utils.Page;
import cn.itcast.core.bean.Customer;
import cn.itcast.core.bean.Message;
import cn.itcast.core.bean.MeterData;
import cn.itcast.core.bean.SysUser;



public interface CustomerService {

	// 查询客户列表
	public Page<Customer> findCustomerList(Integer page, Integer rows, 
			String custName,  String custSource,String custIndustry,String custLevel);
	
	// 查询基本信息
	public Page<Customer> getCustomerList(Long id, String custName,  String custSource,String custIndustry,String custLevel);
	//查询测量数据
	public Page<MeterData> findMeterList( Integer page, Integer rows,Long id);
	
	// 关注客户列表
	public Page<Customer> concernCustomerList(Integer page, Integer rows, 
				String custName,  String custSource,String custIndustry,String custLevel);
		
	// 查询数据列表
	public Page<SysUser> findUserList(Integer page, Integer rows);

	public Customer getCustomerById(Long id);
	
	//public Customer getCustomerList(Long id);

	public void updateCustomer(Customer customer);

	public void insertCustomer(Customer customer);
	
	public void insertUser(SysUser sysUser);
	
	public void insetMessage(Message message);
	
	public void deleteCustomer(Long id);
	
	public void updateCustomerStatu(Long id);
	
	public void updateCustomerStatuCancel(Long id);
	public SysUser selectUserLogin(String telephone,String password);
	
	public void updateUserpassword(Long id,String password);
}
