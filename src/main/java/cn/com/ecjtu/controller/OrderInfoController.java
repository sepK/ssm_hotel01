package cn.com.ecjtu.controller;

import cn.com.ecjtu.exception.CustomerNotFoundException;
import cn.com.ecjtu.exception.EmployeeNotFoundException;
import cn.com.ecjtu.exception.RepeatOrderException;
import cn.com.ecjtu.exception.RoomNotFoundException;
import cn.com.ecjtu.pojo.Indent;
import cn.com.ecjtu.pojo.OrderInfo;
import cn.com.ecjtu.service.OrderInfoService;
import cn.com.ecjtu.utils.Msg;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderInfoController {
    @Resource
    private OrderInfoService orderInfoService;

    @RequestMapping("/index04")
    public String toIndex(){
        return "/admin/index04";
    }

    @RequestMapping(value = "/orders",method = RequestMethod.GET)
    @ResponseBody
    public Msg getOrders(@RequestParam("pn") Integer pn){
        PageHelper.startPage(pn,10);
        List<OrderInfo> list = orderInfoService.getOrders();
        PageInfo<OrderInfo> pageInfo = new PageInfo<OrderInfo>(list,5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    @RequestMapping(value = "/order/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getOrder(@PathVariable("id") Integer id){
        OrderInfo orderInfo = orderInfoService.getOrder(id);
        return Msg.success().add("orderInfo", orderInfo);
    }
    @RequestMapping(value = "/order/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg saveOrder(OrderInfo orderInfo){
        String msg = null;
        try {
            if(orderInfoService.saveOrder(orderInfo)){
                return Msg.success();
            }
        }catch (RoomNotFoundException r){
            msg = r.getMessage();
        }catch (RepeatOrderException roe){
            msg = roe.getMessage();
        }catch (Exception e){
            msg = e.getMessage();
        }
        return Msg.fail(msg);
    }
    @RequestMapping(value = "/order", method = RequestMethod.POST)
    @ResponseBody
    public Msg addOrder(OrderInfo orderInfo){
        String msg = null;
        try{
            if(orderInfoService.addOrder(orderInfo)){
                return Msg.success();
            }
        }catch (RoomNotFoundException rnfe){
            msg = rnfe.getMessage();
        }catch (CustomerNotFoundException cnfe){
            msg = cnfe.getMessage();
        }catch (EmployeeNotFoundException enfe){
            msg = enfe.getMessage();
        }catch (Exception e){
            msg = e.getMessage();
        }
        return Msg.fail(msg);
    }
    @RequestMapping(value = "/searchOrders",method = RequestMethod.GET)
    @ResponseBody
    public Msg searchOrders(@RequestParam("roomid") Integer roomid){
        List<OrderInfo> list = orderInfoService.getOrdersByRoomId(roomid);
        return Msg.success().add("list",list);
    }

    @RequestMapping(value = "/order/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg delOrder(@PathVariable("id") Integer id){
        if(orderInfoService.delOrder(id)){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    @RequestMapping(value = "/addIndent/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Msg addIndent(@PathVariable("id") Integer roomId, Indent indent){
        return orderInfoService.addIndent(roomId,indent);
    }

    @RequestMapping(value = "/getIndents",method = RequestMethod.GET)
    @ResponseBody
    public Msg getIndents(@RequestParam("cusname") String cusname){
        List<Indent> indents = orderInfoService.getIndents(cusname);
        return Msg.success().add("indents",indents);
    }

    @RequestMapping(value = "/updateIndent",method = RequestMethod.POST)
    @ResponseBody
    public Msg updateIndent(OrderInfo orderInfo){

        return orderInfoService.updateIndent(orderInfo);
    }
}
