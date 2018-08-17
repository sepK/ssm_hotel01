package cn.com.ecjtu.service.impl;

import cn.com.ecjtu.exception.CustomerNotFoundException;
import cn.com.ecjtu.exception.RoomNotFoundException;
import cn.com.ecjtu.mapper.CommentMapper;
import cn.com.ecjtu.pojo.Comment;
import cn.com.ecjtu.pojo.CommentExample;
import cn.com.ecjtu.service.CommentService;
import cn.com.ecjtu.service.CustomerService;
import cn.com.ecjtu.service.RoomService;
import cn.com.ecjtu.utils.Msg;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@Service
public class CommentServiceImpl implements CommentService {
    @Resource
    private CommentMapper commentMapper;
    @Resource
    private CustomerService customerService;
    @Resource
    private RoomService roomService;

    public List<Comment> getComments() {
        return commentMapper.selectByExampleWithBLOBs(null);
    }

    public Comment getComment(String id) {
        return commentMapper.selectByPrimaryKey(id);
    }

    public boolean delComment(String id) {
        return commentMapper.deleteByPrimaryKey(id) > 0;
    }

    public boolean saveComment(Comment comment) {
        return commentMapper.updateByPrimaryKeySelective(comment) > 0;
    }

    public Msg addComment(Comment comment) {
        String msg = null;
        comment.setId(UUID.randomUUID().toString().substring(0,10));
        try {
            if(roomService.checkRoomNumber(comment.getRoomNumber())){
               throw new RoomNotFoundException("房间不存在");
            }else{
                if(customerService.checkName(comment.getCusname())){
                  throw new CustomerNotFoundException("用户不存在");
                }else{
                    commentMapper.insert(comment);
                    return Msg.success();
                }
            }
        }catch (RoomNotFoundException rnfe){
            msg = rnfe.getMessage();
        }catch (CustomerNotFoundException cnfe){
            msg = cnfe.getMessage();
        }catch (Exception e){
            msg = e.getMessage();
        }
        return Msg.fail(msg);
    }

    public List<Comment> searchComments(String cusname) {
        CommentExample example = new CommentExample();
        CommentExample.Criteria criteria = example.createCriteria();
        criteria.andCusnameLike(cusname);
        return commentMapper.selectByExampleWithBLOBs(example);
    }
}
