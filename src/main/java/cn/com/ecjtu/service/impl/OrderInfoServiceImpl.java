package cn.com.ecjtu.service.impl;

import cn.com.ecjtu.exception.*;
import cn.com.ecjtu.mapper.OrderInfoMapper;
import cn.com.ecjtu.pojo.OrderInfo;
import cn.com.ecjtu.pojo.OrderInfoExample;
import cn.com.ecjtu.pojo.Room;
import cn.com.ecjtu.service.CustomerService;
import cn.com.ecjtu.service.EmployeeService;
import cn.com.ecjtu.service.OrderInfoService;
import cn.com.ecjtu.service.RoomService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderInfoServiceImpl implements OrderInfoService{
    @Resource
    private OrderInfoMapper orderInfoMapper;
    @Resource
    private RoomService roomService;
    @Resource
    private CustomerService customerService;
    @Resource
    private EmployeeService employeeService;
    public List<OrderInfo> getOrders() {
        return orderInfoMapper.selectByExampleWithBLOBs(null);
    }

    public OrderInfo getOrder(Integer id) {
        return orderInfoMapper.selectByPrimaryKey(id);
    }
    @Transactional
    public boolean saveOrder(OrderInfo orderInfo) {
        try {
            Room room = new Room();
            room.setId(orderInfo.getRoomid());
            room.setStatus(Short.valueOf(orderInfo.getOstatus().toString()));
            if(!roomService.saveRoom(room)){
                throw new RoomNotFoundException("找不到房间");
            }else{
                int result = orderInfoMapper.updateByPrimaryKey(orderInfo);
                if(result <= 0){
                    throw new RepeatOrderException();
                }else{
                    return true;
                }
            }
        }catch (RoomNotFoundException r){
            throw r;
        }catch (RepeatOrderException roe){
            throw roe;
        }catch (Exception e){
            throw new OrderException("保存数据异常"+e.getMessage());
        }
    }
    @Transactional
    public boolean addOrder(OrderInfo orderInfo) {
        try {
            Room room = roomService.getRoom(orderInfo.getRoomid());
            if(room == null || room.getStatus() != 0){
                throw new RoomNotFoundException("房间找不到或者房间不是空闲状态");
            }else{
                if(customerService.checkName(orderInfo.getCusname())){
                    throw new CustomerNotFoundException("用户不存在");
                }else{
                    if(employeeService.getEmp(orderInfo.getEmpId())==null){
                        throw new EmployeeNotFoundException("员工不存在");
                    }else{
                        return orderInfoMapper.insertSelective(orderInfo) > 0;
                    }
                }
            }
        }catch (RoomNotFoundException rnfe){
            throw rnfe;
        }catch (CustomerNotFoundException cnfe){
            throw cnfe;
        }catch (EmployeeNotFoundException enfe){
            throw enfe;
        }catch (Exception e){
            throw new OrderException("插入数据异常"+e.getMessage());
        }
    }

    public List<OrderInfo> getOrdersByRoomId(Integer roomid) {
        OrderInfoExample example = new OrderInfoExample();
        OrderInfoExample.Criteria criteria = example.createCriteria();
        criteria.andRoomidEqualTo(roomid);
        return orderInfoMapper.selectByExampleWithBLOBs(example);
    }
}
