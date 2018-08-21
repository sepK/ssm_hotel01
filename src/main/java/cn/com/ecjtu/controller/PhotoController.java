package cn.com.ecjtu.controller;

import cn.com.ecjtu.exception.RoomNotFoundException;
import cn.com.ecjtu.pojo.Photo;
import cn.com.ecjtu.service.PhotoService;
import cn.com.ecjtu.utils.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/photo")
public class PhotoController {
    @Resource
    private PhotoService photoService;

    @RequestMapping(value = "/index07",method = RequestMethod.GET)
    public String toIndex(){
        return "/admin/index07";
    }

    @RequestMapping(value = "/photos",method = RequestMethod.GET)
    @ResponseBody
    public Msg getPhotos(@RequestParam("pn") Integer pn){
        PageHelper.startPage(pn,10);
        List<Photo> list = photoService.getPhotos();
        PageInfo<Photo> pageInfo = new PageInfo<Photo>(list,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping(value = "/photo/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getPhoto(@PathVariable("id") Integer id){
        Photo photo = photoService.getPhoto(id);
        return Msg.success().add("photo",photo);
    }

    @RequestMapping(value = "/photo",method = RequestMethod.POST)
    @ResponseBody
    public Msg savePhoto(Photo photo,MultipartFile file){
        upLoadPhoto(file,photo);
        boolean b = photoService.savePhoto(photo);
        return Msg.success();
    }

    @RequestMapping(value = "/addPhoto",method = RequestMethod.POST)
    @ResponseBody
    public Msg addPhoto(Photo photo,MultipartFile file){
        upLoadPhoto(file,photo);
        String msg = null;
        try {
            boolean b = photoService.addPhoto(photo);
            return Msg.success();
        }catch (RoomNotFoundException e){
            msg = e.getMessage();
        }catch (Exception e){
            msg = e.getMessage();
        }
        return Msg.fail(msg);
    }

    @RequestMapping(value = "/photo/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg delPhoto(@PathVariable("id") Integer id){

        boolean b = photoService.delPhoto(id);
        return Msg.success();
    }

    @RequestMapping(value = "/searchPhotos",method = RequestMethod.GET)
    @ResponseBody
    public Msg searchPhotos(@RequestParam("roomId") Integer roomId){
        List<Photo> photos = photoService.searchPhotos(roomId);
        return Msg.success().add("photos",photos);
    }

    private void upLoadPhoto(MultipartFile file,Photo photo){
        if(!file.isEmpty()) {
            String originalFilename = file.getOriginalFilename();
            String path = "F:\\IntelliJ IDEA 2017.3.4\\WorkSpace\\ssm_hotel01\\src\\main\\webapp\\static\\images\\";

            String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
            File newFile = new File(path + newFileName);
            photo.setPicture("/images/" + newFileName);
            try {
                file.transferTo(newFile);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
