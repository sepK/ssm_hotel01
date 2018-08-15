package cn.com.ecjtu.service;

import cn.com.ecjtu.pojo.Room;

import java.util.List;

public interface RoomService {

    List<Room> getRooms();

    Room getRoom(Integer id);

    boolean saveRoom(Room room);

    boolean addRoom(Room room);

    boolean checkRoomNumber(String number);
}
