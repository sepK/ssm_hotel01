package cn.com.ecjtu.pojo;

import java.util.List;

public class Picture {
    private Room room;
    private List<Photo> photos;

    public Picture() {
    }

    public Picture(Room room, List<Photo> photos) {
        this.room = room;
        this.photos = photos;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public List<Photo> getPhotos() {
        return photos;
    }

    public void setPhotos(List<Photo> photos) {
        this.photos = photos;
    }
}
