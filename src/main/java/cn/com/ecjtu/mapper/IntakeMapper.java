package cn.com.ecjtu.mapper;

import cn.com.ecjtu.pojo.Intake;
import cn.com.ecjtu.pojo.IntakeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface IntakeMapper {
    long countByExample(IntakeExample example);

    int deleteByExample(IntakeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Intake record);

    int insertSelective(Intake record);

    List<Intake> selectByExample(IntakeExample example);

    Intake selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Intake record, @Param("example") IntakeExample example);

    int updateByExample(@Param("record") Intake record, @Param("example") IntakeExample example);

    int updateByPrimaryKeySelective(Intake record);

    int updateByPrimaryKey(Intake record);
}