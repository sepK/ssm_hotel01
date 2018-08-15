package cn.com.ecjtu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.com.ecjtu.mapper.CustomerMapper;
import cn.com.ecjtu.pojo.Customer;
import cn.com.ecjtu.pojo.CustomerExample;
import cn.com.ecjtu.pojo.CustomerExample.Criteria;
import cn.com.ecjtu.service.CustomerService;
@Service
public class CustomerServiceImpl implements CustomerService{
	@Resource
	private CustomerMapper customerMapper;

	public List<Customer> getCustomers() {

		return customerMapper.selectByExample(null);
	}

	public Customer getCustomer(Integer id) {
		return customerMapper.selectByPrimaryKey(id);
	}

	public Boolean delCustomer(Integer id) {
		return customerMapper.deleteByPrimaryKey(id) > 0;
	}

	public boolean updateCustomer(Customer customer) {
		return customerMapper.updateByPrimaryKeySelective(customer) > 0;
	}

	public List<Customer> searchCus(String cusName) {
		CustomerExample customerExample = new CustomerExample();
		Criteria criteria = customerExample.createCriteria();
		criteria.andCustomerNameLike("%"+cusName+"%");
		return customerMapper.selectByExample(customerExample);
	}

	public Boolean addCustomer(Customer customer) {
		return customerMapper.insert(customer) > 0;
	}

	public boolean checkName(String name) {
		CustomerExample example = new CustomerExample();
		Criteria criteria = example.createCriteria();
		criteria.andCustomerNameEqualTo(name);
		return customerMapper.selectByExample(example)!=null;
	}

}
