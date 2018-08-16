package cn.com.ecjtu.service;

import cn.com.ecjtu.pojo.OrderInfo;
import org.springframework.core.annotation.Order;

import java.util.List;

public interface OrderInfoService {
    List<OrderInfo> getOrders();

    OrderInfo getOrder(Integer id);

    boolean saveOrder(OrderInfo orderInfo);

    boolean addOrder(OrderInfo orderInfo);

    List<OrderInfo> getOrdersByRoomId(Integer roomid);
}
