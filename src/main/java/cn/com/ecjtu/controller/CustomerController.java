package cn.com.ecjtu.controller;

import cn.com.ecjtu.pojo.Customer;
import cn.com.ecjtu.service.CustomerService;
import cn.com.ecjtu.utils.GraphicHelper;
import cn.com.ecjtu.utils.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Resource
	private CustomerService customerService;
	@RequestMapping("/index")
	public String toIndex() {
		return "/admin/index";
	}
	
	@RequestMapping(value="/customers",method=RequestMethod.GET)
	@ResponseBody
	public Msg getCustomers(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 10);
		List<Customer> list = customerService.getCustomers();
		PageInfo<Customer> pageInfo = new PageInfo<Customer>(list,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping(value="/customer/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getCustomer(@PathVariable("id") Integer id) {
		Customer customer = customerService.getCustomer(id);
		return Msg.success().add("customer", customer);
	}
	@RequestMapping(value="/customer/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public Msg delCustomer(@PathVariable("id") Integer id) {
		Boolean b = customerService.delCustomer(id);
		return Msg.success();
	}
	@RequestMapping(value="/customer/{id}",method=RequestMethod.POST)
	@ResponseBody
	public Msg updateCustomer(Customer customer) {
		boolean b = customerService.updateCustomer(customer);
		return Msg.success();
	}
	@RequestMapping("/customer")
	@ResponseBody
	public Msg addCustomer(Customer customer) {
		Boolean boolean1 = customerService.addCustomer(customer);
		return Msg.success();
	}
	@RequestMapping("/searchCus")
	@ResponseBody
	public Msg searchCus(@RequestParam("cusName") String cusName) {
		List<Customer> list = customerService.searchCus(cusName);
		return Msg.success().add("list", list);
	}
	@RequestMapping("/checkName")
	@ResponseBody
	public Msg checkName(@RequestParam("cusName") String name) {
		if(customerService.checkName(name)) {
			return Msg.fail();
		}else {
			return Msg.success();
		}
	}
	
	@RequestMapping("/checkVerifyCode")
	@ResponseBody
	public Msg checkVerifyCode(String verifyCode, HttpSession session) {
		if (session.getAttribute("/customer/verifyCode").equals(verifyCode)) {
			return Msg.success();
		} else {
			return Msg.fail();
		}
	}

	@RequestMapping("/verifyCode")
	public void verifyCode(HttpServletRequest request, HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();

		String uri = request.getRequestURI();
		System.out.println(uri);
		final int width = 180; 
		final int height = 40; 
		final String imgType = "jpeg"; 
		final OutputStream output = response.getOutputStream();
		String code = GraphicHelper.create(width, height, imgType, output);

		session.setAttribute(uri, code);

		System.out.println(session.getAttribute(uri));

	}
}

