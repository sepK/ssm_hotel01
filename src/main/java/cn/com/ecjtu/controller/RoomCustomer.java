package cn.com.ecjtu.controller;

import cn.com.ecjtu.service.RoomService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class RoomCustomer {
    @Resource
    private RoomService roomService;

}
