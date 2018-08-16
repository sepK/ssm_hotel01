package cn.com.ecjtu.controller;

import cn.com.ecjtu.exception.*;
import cn.com.ecjtu.pojo.OrderInfo;
import cn.com.ecjtu.pojo.Room;
import cn.com.ecjtu.service.OrderInfoService;
import cn.com.ecjtu.utils.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import sun.misc.Request;

import javax.annotation.Resource;
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
        PageInfo<OrderInfo> pageInfo = new PageInfo<OrderInfo>(list,10);
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
}
