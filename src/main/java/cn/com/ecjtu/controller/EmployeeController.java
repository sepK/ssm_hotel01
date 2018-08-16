package cn.com.ecjtu.controller;

import cn.com.ecjtu.pojo.Employee;
import cn.com.ecjtu.service.EmployeeService;
import cn.com.ecjtu.utils.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Resource
    private EmployeeService employeeService;

    @RequestMapping("/index03")
    public  String toIndex(){
        return "/admin/index03";
    }

    @RequestMapping(value = "/employees", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmployee(@RequestParam("pn") Integer pn){
        PageHelper.startPage(pn,10);
        List<Employee> list = employeeService.getEmps();
        PageInfo<Employee> pageInfo = new PageInfo<Employee>(list,10);
        return  Msg.success().add("pageInfo",pageInfo);
    }
    @RequestMapping(value = "/employee/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee employee = employeeService.getEmp(id);
        return  Msg.success().add("emp",employee);
    }
    @RequestMapping(value = "/employee/{id}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg saveEmp(Employee employee){
        if(employeeService.saveEmp(employee)){
            return  Msg.success();
        }else {
            return  Msg.fail();
        }

    }
    @RequestMapping(value = "/employee",method = RequestMethod.POST)
    @ResponseBody
    public Msg addEmp(Employee employee){
        if(employeeService.addEmp(employee)){
            return  Msg.success();
        }else {
            return  Msg.fail();
        }
    }
    @RequestMapping(value = "/employee/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg delEmp(@PathVariable("id") Integer id){
        if(employeeService.delEmp(id)){
            return  Msg.success();
        }else {
            return  Msg.fail();
        }
    }
    @RequestMapping(value = "/checkEmpName",method = RequestMethod.GET)
    @ResponseBody
    public Msg checkEmpName(@RequestParam("empName") String empName){
        if(employeeService.checkEmpName(empName)){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    @RequestMapping(value = "/searchEmps")
    @ResponseBody
    public Msg searchEmps(@RequestParam("empName") String empName){
        List<Employee> list = employeeService.getEmpsByName(empName);
        return  Msg.success().add("list",list);
    }
}
