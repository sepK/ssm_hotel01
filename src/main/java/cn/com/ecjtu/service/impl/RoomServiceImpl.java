package cn.com.ecjtu.service.impl;

import cn.com.ecjtu.mapper.RoomMapper;
import cn.com.ecjtu.pojo.Room;
import cn.com.ecjtu.pojo.RoomExample;
import cn.com.ecjtu.pojo.RoomExample.Criteria;
import cn.com.ecjtu.service.RoomService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RoomServiceImpl implements RoomService{

    @Resource
    private RoomMapper roomMapper;
    public List<Room> getRooms() {
        return roomMapper.selectByExampleWithBLOBs(null);
    }

    public Room getRoom(Integer id) {
        return roomMapper.selectByPrimaryKey(id);
    }

    public boolean saveRoom(Room room) {
        return roomMapper.updateByPrimaryKeyWithBLOBs(room) > 0;
    }

    public boolean addRoom(Room room) {
        return roomMapper.insert(room) > 0;
    }

    public boolean checkRoomNumber(String number) {
        RoomExample example = new RoomExample();
        Criteria criteria = example.createCriteria();
        criteria.andRoomNumberEqualTo(number);
        return roomMapper.selectByExample(example) == null;
    }

    public boolean delRoom(Integer id) {
        return roomMapper.deleteByPrimaryKey(id) > 0;
    }

    public List<Room> searchRoomByRoomNumber(String roomNumber) {
        RoomExample example = new RoomExample();
        Criteria criteria = example.createCriteria();
        criteria.andRoomNumberEqualTo(roomNumber);
        return roomMapper.selectByExampleWithBLOBs(example);
    }

    public List<Room> getRoomByStatus(short status) {
        RoomExample example = new RoomExample();
        Criteria criteria = example.createCriteria();
        criteria.andStatusEqualTo(status);
        return roomMapper.selectByExample(example);
    }
}
