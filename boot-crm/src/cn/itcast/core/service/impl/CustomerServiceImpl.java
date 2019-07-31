package cn.itcast.core.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.common.utils.Page;
import cn.itcast.core.bean.Customer;
import cn.itcast.core.bean.Message;
import cn.itcast.core.bean.MeterData;
import cn.itcast.core.bean.SysUser;
import cn.itcast.core.dao.BaseDictDao;
import cn.itcast.core.dao.CustomerDao;
import cn.itcast.core.service.CustomerService;
/**
 * 客户管理
 * @author lx
 *
 */

@Service("customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService {

	// 定义dao属性
	@Autowired
	private CustomerDao customerDao;
	@Autowired
	private BaseDictDao baseDictDao;

	
	public Page<Customer> findCustomerList(Integer page, Integer rows, 
			String custName,  String custSource,String custIndustry,String custLevel) {
		Customer customer = new Customer();
		//判断客户名称(公司名称)
		if(StringUtils.isNotBlank(custName)){
			customer.setCust_name(custName);
		}
		//判断客户信息来源
		if(StringUtils.isNotBlank(custSource)){
			customer.setCust_source(custSource);
		}
		//判断客户所属行业
		if(StringUtils.isNotBlank(custIndustry)){
			customer.setCust_industry(custIndustry);
		}
		//判断客户级别
		if(StringUtils.isNotBlank(custLevel)){
			customer.setCust_level(custLevel);
		}
		//当前页
		customer.setStart((page-1) * rows) ;
		//每页数
		customer.setRows(rows);
		//查询客户列表
		List<Customer> customers = customerDao.selectCustomerList(customer);
		//查询客户列表总记录数
		Integer count = customerDao.selectCustomerListCount(customer);
		//创建Page返回对象
		Page<Customer> result = new Page<>();
		result.setPage(page);
		result.setRows(customers);
		result.setSize(rows);
		result.setTotal(count);
		return result;

	}
	//查询客户基本信息
	public Page<Customer> getCustomerList(Long id, String custName,  String custSource,String custIndustry,String custLevel) {
		Customer customer = new Customer();
		//判断客户名称(公司名称)
		if(StringUtils.isNotBlank(custName)){
			customer.setCust_name(custName);
		}
		//判断客户信息来源
		if(StringUtils.isNotBlank(custSource)){
			customer.setCust_source(custSource);
		}
		//判断客户所属行业
		if(StringUtils.isNotBlank(custIndustry)){
			customer.setCust_industry(custIndustry);
		}
		//判断客户级别
		if(StringUtils.isNotBlank(custLevel)){
			customer.setCust_level(custLevel);
		}
		
			customer.setCust_id(id);
		
		//查询客户列表
		List<Customer> customers = customerDao.selectCustomerInform(customer);
		//查询客户列表总记录数
	//	Integer count = customerDao.selectCustomerListCount(customer);
		//创建Page返回对象
		Page<Customer> result = new Page<>();
		
		result.setRows(customers);
	
		
		return result;

	}
	
	public Page<Customer> concernCustomerList(Integer page, Integer rows, 
			String custName,  String custSource,String custIndustry,String custLevel) {
		Customer customer = new Customer();
		//判断客户名称(公司名称)
		if(StringUtils.isNotBlank(custName)){
			customer.setCust_name(custName);
		}
		//判断客户信息来源
		if(StringUtils.isNotBlank(custSource)){
			customer.setCust_source(custSource);
		}
		//判断客户所属行业
		if(StringUtils.isNotBlank(custIndustry)){
			customer.setCust_industry(custIndustry);
		}
		//判断客户级别
		if(StringUtils.isNotBlank(custLevel)){
			customer.setCust_level(custLevel);
		}
		//当前页
		customer.setStart((page-1) * rows) ;
		//每页数
		customer.setRows(rows);
		//查询客户列表
		List<Customer> customers = customerDao.selectConcernCustomerList(customer);
		//查询客户列表总记录数
		Integer count = customerDao.selectConcernCustomerListCount(customer);
		//创建Page返回对象
		Page<Customer> result = new Page<>();
		result.setPage(page);
		result.setRows(customers);
		result.setSize(rows);
		result.setTotal(count);
		return result;

	}
	//查询用户列表
	public Page<SysUser> findUserList(Integer page, Integer rows) {
		Customer customer = new Customer();
		
		//当前页
		customer.setStart((page-1) * rows) ;
		//每页数
		customer.setRows(rows);
		//查询客户列表
		List<SysUser> customers = customerDao.selectUserList(customer);
		//查询客户列表总记录数
		Integer count = customerDao.selectUserListCount(customer);
		//创建Page返回对象
		Page<SysUser> result = new Page<>();
		result.setPage(page);
		result.setRows(customers);
		result.setSize(rows);
		result.setTotal(count);
		return result;

	}


	@Override
	public Customer getCustomerById(Long id) {
		
		Customer customer = customerDao.getCustomerById(id);
		return customer;
		
	}


	@Override
	public void updateCustomer(Customer customer) {
		customerDao.updateCustomer(customer);
	}


	@Override
	public void deleteCustomer(Long id) {
		customerDao.deleteCustomer(id);
	}
	@Override
	public void updateCustomerStatu(Long id) {
		customerDao.updateCustomerStatu(id);
	}
	
	public void updateUserpassword(Long id,String password) {
		SysUser sysUser=new SysUser();
		if(StringUtils.isNotBlank(password)){
			sysUser.setUser_password(password);
		}
		sysUser.setUser_id(id);
		
		
		
		customerDao.updateUserpassword(sysUser);
	}
	
	@Override
	public void updateCustomerStatuCancel(Long id) {
		customerDao.updateCustomerStatuCancel(id);
	}
	@Override
	public SysUser selectUserLogin(String telephone,String password) {
		SysUser sysUser = new SysUser();
		//判断客户名称(公司名称)
		if(StringUtils.isNotBlank(telephone)){
			sysUser.setUser_phone(telephone);
		}
		//判断客户信息来源
		if(StringUtils.isNotBlank(password)){
			sysUser.setUser_password(password);
		}
		//customerDao.selectUserLogin(sysUser);
		return customerDao.selectUserLogin(sysUser);
	}


	@Override
	public void insertCustomer(Customer customer) {
		customerDao.insertCustomer(customer);
		
	}
	@Override
	public void insertUser(SysUser sysUser) {
		customerDao.insertUser(sysUser);
	}
	
	@Override
	public void insetMessage(Message message) {
		customerDao.insetMessage(message);
	}
	
	@Override
	public Page<MeterData> findMeterList( Integer page, Integer rows,Long id) {
		MeterData meterData = new MeterData();
		
		//当前页
		meterData.setCust_id(id);
		
		meterData.setStart((page-1) * rows) ;
		//每页数
		meterData.setRows(rows);
		//查询客户列表
		List<MeterData> meterDatas = customerDao.selectMeterDataList(meterData);
		//查询客户列表总记录数
		Integer count = customerDao.selectMeterDataListCount(meterData);
		//创建Page返回对象
		Page<MeterData> result = new Page<>();
		result.setPage(page);
		result.setRows(meterDatas);
		result.setSize(rows);
		result.setTotal(count);
		return result;

		
		
	
	}


	//@Override
	/*public Customer getCustomerList(Long id) {
		// TODO Auto-generated method stub
		return customerDao.getCustomerList(id);
	}*/

}
