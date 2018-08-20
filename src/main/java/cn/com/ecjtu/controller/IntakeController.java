package cn.com.ecjtu.controller;

import cn.com.ecjtu.exception.ExtraException;
import cn.com.ecjtu.exception.OverTimeException;
import cn.com.ecjtu.pojo.Intake;
import cn.com.ecjtu.service.IntakeService;
import cn.com.ecjtu.utils.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import sun.nio.cs.MS1250;

import javax.annotation.Resource;
import javax.crypto.MacSpi;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/intake")
public class IntakeController {

    @Resource
    private IntakeService intakeService;

    @RequestMapping("/index06")
    public String toIndex(){
        return "/admin/index06";
    }

    @RequestMapping(value = "/intakes",method = RequestMethod.GET)
    @ResponseBody
    public Msg getIntakes(@RequestParam("pn") Integer pn){
        PageHelper.startPage(pn,10);
        List<Intake> list = intakeService.getIntakes();
        PageInfo<Intake> pageInfo = new PageInfo<Intake>(list,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping(value = "/intake/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getIntake(@PathVariable("id") Integer id){
        Intake intake = intakeService.getIntake(id);
        return Msg.success().add("intake", intake);
    }

    @RequestMapping(value = "/intake/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg saveIntake(Intake intake){
        try{
            return intakeService.saveIntake(intake);
        }catch (OverTimeException ote){
            return Msg.fail(ote.getMessage());
        }catch (Exception e){
            return Msg.fail(e.getMessage());
        }
    }

    @RequestMapping(value = "/intake", method = RequestMethod.POST)
    @ResponseBody
    public Msg addIntake(Intake intake){
        try {
            return intakeService.addIntake(intake);
        }catch (ExtraException ee){
            return Msg.fail(ee.getMessage());
        }

    }

    @RequestMapping(value = "/intake/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg delIntake(@PathVariable("id") Integer id){
        if(intakeService.delIntake(id)){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    @RequestMapping(value = "/searchIntakes", method = RequestMethod.GET)
    @ResponseBody
    public Msg searchIntakes(@RequestParam("cusname") String cusName){
        List<Intake> intakes = intakeService.searchIntakes(cusName);
        return Msg.success().add("intakes",intakes);
    }


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
