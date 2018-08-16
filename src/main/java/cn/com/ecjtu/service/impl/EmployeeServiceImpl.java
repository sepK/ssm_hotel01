package cn.com.ecjtu.service.impl;

import cn.com.ecjtu.mapper.EmployeeMapper;
import cn.com.ecjtu.pojo.Employee;
import cn.com.ecjtu.pojo.EmployeeExample;
import cn.com.ecjtu.service.EmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService{
    @Resource
    private EmployeeMapper employeeMapper;

    public List<Employee> getEmps() {
        return employeeMapper.selectByExample(null);
    }

    public Employee getEmp(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    public boolean saveEmp(Employee employee) {
        return employeeMapper.updateByPrimaryKey(employee) > 0;
    }

    public boolean addEmp(Employee employee) {
        return employeeMapper.insert(employee) > 0;
    }

    public boolean delEmp(Integer id) {
        return employeeMapper.deleteByPrimaryKey(id) > 0;
    }

    public boolean checkEmpName(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        return employeeMapper.selectByExample(example).size() == 0;
    }

    public List<Employee> getEmpsByName(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameLike(empName);
        return employeeMapper.selectByExample(example);
    }
}
