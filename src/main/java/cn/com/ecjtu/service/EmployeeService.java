package cn.com.ecjtu.service;

import cn.com.ecjtu.pojo.Employee;

import java.util.List;

public interface EmployeeService {

    List<Employee> getEmps();

    Employee getEmp(Integer id);

    boolean saveEmp(Employee employee);

    boolean addEmp(Employee employee);

    boolean delEmp(Integer id);

    boolean checkEmpName(String empName);

    List<Employee> getEmpsByName(String empName);
}
