package cn.itcast.core.web.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
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

import cn.itcast.common.utils.Page;
import cn.itcast.core.bean.BaseDict;
import cn.itcast.core.bean.Customer;
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
	@RequestMapping(value = "/customer/details")
	public String details() {
		return "redirect:/login.jsp";
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
		return "customer";
	}
	// 客户关注列表
		@RequestMapping(value = "/customer/myConcernList")
		public String myConcernList(@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="10")Integer rows, 
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
			return "customer";
		}
	
	@RequestMapping("/customer/edit")
	@ResponseBody
	public Customer getCustomerById(Long id) {
		Customer customer = customerService.getCustomerById(id);
		return customer;
	}
	
	@RequestMapping("/customer/update")
	@ResponseBody
	public String customerUpdate(Customer customer) {
		customerService.updateCustomer(customer);
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
			/*ServletActionContext.getRequest().getSession()
					.setAttribute("SysUser", SysUser);*/
			HttpSession session = request.getSession();  
			session.getAttribute("SysUser");
			return "redirect:/customer/list.action";
		}
	}

}
