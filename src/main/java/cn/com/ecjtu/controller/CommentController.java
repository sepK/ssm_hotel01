package cn.com.ecjtu.controller;

import cn.com.ecjtu.pojo.Comment;
import cn.com.ecjtu.service.CommentService;
import cn.com.ecjtu.utils.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Resource
    private CommentService commentService;

    @RequestMapping("/index05")
    public String toIndex(){
        return "/admin/index05";
    }

    @RequestMapping(value = "/comments",method = RequestMethod.GET)
    @ResponseBody
    public Msg getComments(@RequestParam("pn") Integer pn){
        PageHelper.startPage(pn,10);
        List<Comment> list = commentService.getComments();
        PageInfo pageInfo = new PageInfo(list,5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    @RequestMapping(value = "/comment/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getComment(@PathVariable("id") String id){
        Comment comment = commentService.getComment(id);
        return Msg.success().add("comment",comment);
    }

    @RequestMapping(value = "/comment/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg delComment(@PathVariable("id") String id){
        if(commentService.delComment(id)){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    @RequestMapping(value = "/comment/{id}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg saveComment(Comment comment){
        if(commentService.saveComment(comment)){
            return Msg.success();
        }else{
            return Msg.fail();
        }

    }
    @RequestMapping(value = "/comment",method = RequestMethod.POST)
    @ResponseBody
    public Msg addComment(Comment comment){
        return  commentService.addComment(comment);
    }

    @RequestMapping(value = "/searchComments",method = RequestMethod.GET)
    @ResponseBody
    public Msg searchComments(@RequestParam("cusname") String cusname){
        List<Comment> comments = commentService.searchComments(cusname);
        return Msg.success().add("comments",comments);
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
