package cn.com.ecjtu.service.impl;

import cn.com.ecjtu.exception.ExtraException;
import cn.com.ecjtu.exception.RoomNotFoundException;
import cn.com.ecjtu.mapper.PhotoMapper;
import cn.com.ecjtu.pojo.Photo;
import cn.com.ecjtu.pojo.PhotoExample;
import cn.com.ecjtu.service.PhotoService;
import cn.com.ecjtu.service.RoomService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PhotoServiceImpl implements PhotoService{
    @Resource
    private PhotoMapper photoMapper;
    @Resource
    private RoomService roomService;
    public List<Photo> getPhotos() {
        return photoMapper.selectByExample(null);
    }

    public Photo getPhoto(Integer id) {
        return photoMapper.selectByPrimaryKey(id);
    }

    public boolean savePhoto(Photo photo) {
        return photoMapper.updateByPrimaryKey(photo) > 0;
    }

    public boolean addPhoto(Photo photo) {
        try {
            if(roomService.getRoom(photo.getRoomId())==null){
                throw new RoomNotFoundException("房间找不到");
            }else{
                photoMapper.insert(photo);
                return true;
            }
        }catch (RoomNotFoundException e){
            throw e;
        }catch (Exception e){
            throw new ExtraException(e.getMessage());
        }
    }

    public List<Photo> searchPhotos(Integer roomId) {
        PhotoExample example = new PhotoExample();
        PhotoExample.Criteria criteria = example.createCriteria();
        criteria.andRoomIdEqualTo(roomId);
        return photoMapper.selectByExample(example);
    }

    public boolean delPhoto(Integer id) {
        return photoMapper.deleteByPrimaryKey(id) > 0;
    }
}
