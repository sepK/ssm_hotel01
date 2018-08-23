package cn.com.ecjtu.service;

import cn.com.ecjtu.pojo.Picture;
import cn.com.ecjtu.pojo.Room;

import java.util.List;

public interface RoomService {

    List<Room> getRooms();

    Room getRoom(Integer id);

    boolean saveRoom(Room room);

    boolean addRoom(Room room);

    boolean checkRoomNumber(String number);

    boolean delRoom(Integer id);

    List<Room> searchRoomByRoomNumber(String roomNumber);

    List<Room> getRoomByStatus(short status);

    List<Picture> getPictures();

    List<Picture> getEmptyRooms();
}
