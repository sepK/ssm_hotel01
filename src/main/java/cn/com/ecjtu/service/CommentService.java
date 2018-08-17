package cn.com.ecjtu.service;

import cn.com.ecjtu.pojo.Comment;
import cn.com.ecjtu.utils.Msg;

import java.util.List;

public interface CommentService {
    List<Comment> getComments();

    Comment getComment(String id);

    boolean delComment(String id);

    boolean saveComment(Comment comment);

    Msg addComment(Comment comment);

    List<Comment> searchComments(String cusname);
}
