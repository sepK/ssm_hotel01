package cn.com.ecjtu.mapper;

import cn.com.ecjtu.pojo.Photo;
import cn.com.ecjtu.pojo.PhotoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PhotoMapper {
    long countByExample(PhotoExample example);

    int deleteByExample(PhotoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Photo record);

    int insertSelective(Photo record);

    List<Photo> selectByExample(PhotoExample example);

    Photo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Photo record, @Param("example") PhotoExample example);

    int updateByExample(@Param("record") Photo record, @Param("example") PhotoExample example);

    int updateByPrimaryKeySelective(Photo record);

    int updateByPrimaryKey(Photo record);
}