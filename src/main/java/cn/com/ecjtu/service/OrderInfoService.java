package cn.com.ecjtu.service;

import cn.com.ecjtu.pojo.Indent;
import cn.com.ecjtu.pojo.OrderInfo;
import cn.com.ecjtu.utils.Msg;

import java.util.List;

public interface OrderInfoService {
    List<OrderInfo> getOrders();

    OrderInfo getOrder(Integer id);

    boolean saveOrder(OrderInfo orderInfo);

    boolean addOrder(OrderInfo orderInfo);

    List<OrderInfo> getOrdersByRoomId(Integer roomid);

    boolean delOrder(Integer id);

    Msg addIndent(Integer roomId, Indent indent);

    List<Indent> getIndents(String cusname);

    Msg updateIndent(OrderInfo orderInfo);
}
