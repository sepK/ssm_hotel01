package cn.com.ecjtu.service;

import java.util.List;

import cn.com.ecjtu.pojo.Customer;

public interface CustomerService {

	List<Customer> getCustomers();

	Customer getCustomer(Integer id);

	Boolean delCustomer(Integer id);

	boolean updateCustomer(Customer customer);

	List<Customer> searchCus(String cusName);

	Boolean addCustomer(Customer customer);

	boolean checkName(String name);

}
