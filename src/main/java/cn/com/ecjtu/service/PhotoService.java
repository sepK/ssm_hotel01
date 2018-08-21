package cn.com.ecjtu.service;

import cn.com.ecjtu.pojo.Photo;

import java.util.List;

public interface PhotoService {
    List<Photo> getPhotos();

    Photo getPhoto(Integer id);

    boolean savePhoto(Photo photo);

    boolean addPhoto(Photo photo);

    boolean delPhoto(Integer id);

    List<Photo> searchPhotos(Integer roomId);
}
