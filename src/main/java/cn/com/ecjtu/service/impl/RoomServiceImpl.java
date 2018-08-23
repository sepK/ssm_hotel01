package cn.com.ecjtu.service.impl;

import cn.com.ecjtu.mapper.RoomMapper;
import cn.com.ecjtu.pojo.*;
import cn.com.ecjtu.pojo.RoomExample.Criteria;
import cn.com.ecjtu.service.PhotoService;
import cn.com.ecjtu.service.RoomService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class RoomServiceImpl implements RoomService{

    @Resource
    private RoomMapper roomMapper;
    @Resource
    private PhotoService photoService;

    public List<Room> getRooms() {
        return roomMapper.selectByExampleWithBLOBs(null);
    }

    public Room getRoom(Integer id) {
        return roomMapper.selectByPrimaryKey(id);
    }

    public boolean saveRoom(Room room) {
        return roomMapper.updateByPrimaryKeySelective(room) > 0;
    }

    public boolean addRoom(Room room) {
        return roomMapper.insert(room) > 0;
    }

    public boolean checkRoomNumber(String number) {
        RoomExample example = new RoomExample();
        Criteria criteria = example.createCriteria();
        criteria.andRoomNumberEqualTo(number);
        return roomMapper.selectByExample(example).size() == 0;
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
        return roomMapper.selectByExampleWithBLOBs(example);
    }

    @Transactional
    public List<Picture> getPictures() {
        List<Picture> pictures = new ArrayList<Picture>();
        List<Room> rooms = roomMapper.selectByExampleWithBLOBs(null);
        for (Room room:rooms) {
            List<Photo> photos = photoService.searchPhotos(room.getId());
            Picture picture = new Picture(room,photos);
            pictures.add(picture);
        }
        return pictures;
    }

    @Transactional
    public List<Picture> getEmptyRooms() {
        RoomExample roomExample = new RoomExample();
        Criteria criteria = roomExample.createCriteria();
        criteria.andStatusEqualTo(Short.valueOf("0"));
        List<Picture> pictures = new ArrayList<Picture>();
        List<Room> rooms = roomMapper.selectByExampleWithBLOBs(roomExample);
        for (Room room:rooms) {
            List<Photo> photos = photoService.searchPhotos(room.getId());
            Picture picture = new Picture(room,photos);
            pictures.add(picture);
        }
        return pictures;
    }
}
