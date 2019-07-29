package cn.itcast.core.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.itcast.common.utils.Page;
import cn.itcast.core.bean.BaseDict;
import cn.itcast.core.bean.Customer;
import cn.itcast.core.bean.MeterData;
import cn.itcast.core.bean.SysUser;
import cn.itcast.core.service.CustomerService;
import cn.itcast.core.service.SystemService;


/**
 * 客户管理
 * <p>Title: CustomerController</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.cn</p> 
 * @version 1.0
 */
@Controller
public class CustomerController {

	// 依赖注入
	@Autowired
	private CustomerService customerService;
	@Autowired
	private SystemService systemService;
	@Value("${customer.from.type}")
	private String FROM_TYPE;
	@Value("${customer.industry.type}")
	private String INDUSTRY_TYPE;
	@Value("${customer.level.type}")
	private String LEVEL_TYPE;
	
	@RequestMapping(value = "/customer")
	public String showCumtomer() {
		return "redirect:/customer/list.action";
	}
	@RequestMapping(value = "/myConcern")
	public String myConcernCumtomer() {
		return "redirect:/customer/myConcernList.action";
	}
	@RequestMapping(value = "/login")
	public String showLogin() {
		return "redirect:/login.jsp";
	}
	@RequestMapping(value = "/backSystem")
	public String backSystem() {
		
		return "redirect:/customer/backSystem.action";
	}
	@RequestMapping(value = "/loginOut")
	public String loginOut(HttpServletRequest request) {
		request.getSession().invalidate();
		
		return "redirect:login.jsp";
	}
	// 客户列表
	@RequestMapping(value = "/customer/list")
	public String list(@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="10")Integer rows, 
			String custName, String custSource,	String custIndustry, String custLevel, Model model) {

		Page<Customer> customers = customerService.findCustomerList(page, rows, custName, custSource, custIndustry,
				custLevel);
		List<Customer> customer = customers.getRows();
		for(Customer cust:customer){
		//	SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", java.util.Locale.US);
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		//	Date date = sdf.format(cust.getCust_createtime().toString());
		//System.out.println(cust.getCust_createtime().toString());
		//	Date createtime = Date.valueOf(cust.getCust_createtime().toString());
			if(null!=cust.getCust_createtime()){
				cust.setCust_dataString(simpleDateFormat.format(cust.getCust_createtime()));
			}
		}
		
		model.addAttribute("page", customers);
		//客户来源
		List<BaseDict> fromType = systemService.findBaseDictListByType(FROM_TYPE);
		//客户所属行业
		List<BaseDict> industryType = systemService.findBaseDictListByType(INDUSTRY_TYPE);
		//客户级别
		List<BaseDict> levelType = systemService.findBaseDictListByType(LEVEL_TYPE);
		model.addAttribute("fromType", fromType);
		model.addAttribute("industryType", industryType);
		model.addAttribute("levelType", levelType);
		//参数回显
		model.addAttribute("custName", custName);
		model.addAttribute("custSource", custSource);
		model.addAttribute("custIndustry", custIndustry);
		model.addAttribute("custLevel", custLevel);
		return "customer";
	}
	
	  // 客户后台设置列表
		@RequestMapping(value = "/customer/backSystem")
		public String backSystem(@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="10")Integer rows, Model model) {

			Page<SysUser> sysUsers = customerService.findUserList(page, rows);
			
			model.addAttribute("page", sysUsers);
			return "backSystem";
		}
	// 客户详情列表
		@RequestMapping(value = "/customer/details")
		public String details(Long id,RedirectAttributes  res) {
			
			res.addAttribute("id", id);
			return "redirect:/customer/detailsHtml.action";
		}
	
		// 客户详情列表
		@RequestMapping(value = "/customer/meterData")
		public String meterData(Long id,RedirectAttributes  res) {
			
			res.addAttribute("id", id);
			return "redirect:/customer/meterDataDetails.action";
		}
		
		@RequestMapping(value = "/customer/meterDataDetails")
		public String meterDataDetails(@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="5")Integer rows,Long id, Model model) {

			Page<MeterData> meterDetail = customerService.findMeterList(page, rows,id);
			
			model.addAttribute("pageD", meterDetail);
			return "details";
		}
		
		
		// 客户详情列表
		@RequestMapping(value = "/customer/detailsHtml")
		public String detailsHtml(@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="8")Integer rows,Long id,String custName, String custSource,String custIndustry, String custLevel, Model model) {
			Page<Customer> customers = customerService.getCustomerList(id,custName, custSource, custIndustry,custLevel);
			List<Customer> customer = customers.getRows();
			for(Customer cust:customer){
			//	SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", java.util.Locale.US);
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			//	Date date = sdf.format(cust.getCust_createtime().toString());
			//System.out.println(cust.getCust_createtime().toString());
			//	Date createtime = Date.valueOf(cust.getCust_createtime().toString());
				if(null!=cust.getCust_createtime()){
					cust.setCust_dataString(simpleDateFormat.format(cust.getCust_createtime()));
				}
			}
			model.addAttribute("page", customers);
			Page<MeterData> meterDetail = customerService.findMeterList(page, rows,id);
			model.addAttribute("pageD", meterDetail);
			//客户来源
			List<BaseDict> fromType = systemService.findBaseDictListByType(FROM_TYPE);
			//客户所属行业
			List<BaseDict> industryType = systemService.findBaseDictListByType(INDUSTRY_TYPE);
			//客户级别
			List<BaseDict> levelType = systemService.findBaseDictListByType(LEVEL_TYPE);
			model.addAttribute("fromType", fromType);
			model.addAttribute("industryType", industryType);
			model.addAttribute("levelType", levelType);
			//参数回显
			model.addAttribute("custName", custName);
			model.addAttribute("custSource", custSource);
			model.addAttribute("custIndustry", custIndustry);
			model.addAttribute("custLevel", custLevel);
		//	return "customer";
			//Customer customer = customerService.getCustomerList(id);
		//	model.addAttribute("details", customer);
			return "details";
		}
		
		// 客户关注列表
		@RequestMapping(value = "/customer/myConcernList")
		public String myConcernList(@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="10")Integer rows, 
				String custName, String custSource,	String custIndustry, String custLevel, Model model) {

			Page<Customer> customers = customerService.concernCustomerList(page, rows, custName, custSource, custIndustry,
					custLevel);
			
			List<Customer> customer = customers.getRows();
			for(Customer cust:customer){
			//	SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", java.util.Locale.US);
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			//	Date date = sdf.format(cust.getCust_createtime().toString());
			//System.out.println(cust.getCust_createtime().toString());
			//	Date createtime = Date.valueOf(cust.getCust_createtime().toString());
				cust.setCust_dataString(simpleDateFormat.format(cust.getCust_createtime()));
			}
			
			model.addAttribute("page", customers);
			//客户来源
			List<BaseDict> fromType = systemService.findBaseDictListByType(FROM_TYPE);
			//客户所属行业
			List<BaseDict> industryType = systemService.findBaseDictListByType(INDUSTRY_TYPE);
			//客户级别
			List<BaseDict> levelType = systemService.findBaseDictListByType(LEVEL_TYPE);
			model.addAttribute("fromType", fromType);
			model.addAttribute("industryType", industryType);
			model.addAttribute("levelType", levelType);
			//参数回显
			model.addAttribute("custName", custName);
			model.addAttribute("custSource", custSource);
			model.addAttribute("custIndustry", custIndustry);
			model.addAttribute("custLevel", custLevel);
			return "concernCustomer";
		}
	
	@RequestMapping("/customer/edit")
	@ResponseBody
	public Customer getCustomerById(Long id) {
		Customer customer = customerService.getCustomerById(id);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		customer.setCust_dataString(simpleDateFormat.format(customer.getCust_createtime()));
		return customer;
	}
	
	@RequestMapping("/customer/update")
	@ResponseBody
	public String customerUpdate(Customer customer) {
		Date d =new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	//	if(null!= customer.getCust_createtime()){
	//		customer.setCust_createtime(customer.getCust_createtime);
	//	}
		customerService.updateCustomer(customer);
		return "OK";
	}
	
	@RequestMapping("/customer/insertCustomer")
	@ResponseBody
	public String customerinsert(Customer customer) {
		Date d =new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		customer.setCust_createtime(d);
		customerService.insertCustomer(customer);
		return "OK";
	}
	
	@RequestMapping("/customer/delete")
	@ResponseBody
	public String customerDelete(Long id) {
		customerService.deleteCustomer(id);
		return "OK";
	}
	//前台关注
	@RequestMapping("/customer/updateCustomerStatu")
	@ResponseBody
	public String updateCustomerStatu(Long id) {
		customerService.updateCustomerStatu(id);
		return "OK";
	}
	//前台取消关注
	@RequestMapping("/customer/updateCustomerStatuCancel")
	@ResponseBody
	public String updateCustomerStatuCancel(Long id) {
		customerService.updateCustomerStatuCancel(id);
		return "OK";
	}
	//用户登录
	@RequestMapping(value = "customer_login")
	public String login( HttpServletRequest request ,String password,String telephone) {
		SysUser SysUser = customerService.selectUserLogin(telephone,password);
		if (SysUser == null) {
			// 登录失败
			return "redirect:login.action";
		} else {
			// 登录成功
			request.getSession().setAttribute("SysUser", SysUser);
			return "redirect:/customer/list.action";
		}
	}
	
		//用户修改密码
		@RequestMapping(value = "/customer/updateUserPassword")
		@ResponseBody
		public String updateUserPassword(HttpServletRequest request ,String password) {
			HttpSession  session = request.getSession();
			SysUser sysUser =(SysUser) session.getAttribute("SysUser");
			Long id = sysUser.getUser_id();
			String f="1";
			try{
				customerService.updateUserpassword(id,password);
				return f;
			}catch(Exception e){
				f="0";
				return f;
			}
		}

}
