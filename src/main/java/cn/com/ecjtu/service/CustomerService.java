package cn.com.ecjtu.service;

import cn.com.ecjtu.pojo.Customer;

import java.util.List;

public interface CustomerService {

	List<Customer> getCustomers();

	Customer getCustomer(Integer id);

	Boolean delCustomer(Integer id);

	boolean updateCustomer(Customer customer);

	List<Customer> searchCus(String cusName);

	Boolean addCustomer(Customer customer);

	boolean checkName(String name);

}
