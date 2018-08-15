package cn.com.ecjtu.controller;

import cn.com.ecjtu.pojo.Room;
import cn.com.ecjtu.service.RoomService;
import cn.com.ecjtu.utils.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/room")
public class RoomCustomer {
    @Resource
    private RoomService roomService;

    @RequestMapping("/index02")
    public String toIndex(){
        return "/admin/index02";
    }
    @RequestMapping(value="/rooms",method = RequestMethod.GET)
    @ResponseBody
    public Msg getRooms(@RequestParam() Integer pn){
        PageHelper.startPage(pn,10);
        List<Room> list = roomService.getRooms();
        PageInfo<Room> pageInfo = new PageInfo<Room>(list,10);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping(value = "/room/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getRoom(@PathVariable("id") Integer id){
        Room room = roomService.getRoom(id);
        return Msg.success().add("room",room);
    }

    @RequestMapping(value = "/room/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveRoom(Room room){
        if(roomService.saveRoom(room)){
            return Msg.success();
        }else {
            return  Msg.fail();
        }

    }

    @RequestMapping(value = "/room", method = RequestMethod.POST)
    @ResponseBody
    public Msg addRoom(Room room){
        if(roomService.addRoom(room)) {
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    @RequestMapping(value = "/checkRoomNumber", method = RequestMethod.POST)
    @ResponseBody
    public  Msg checkRoomNumber(@RequestParam("roomNumber") String number){
        if(roomService.checkRoomNumber(number)){
            return Msg.success();
        }else {
            return Msg.fail();
        }
    }
}
