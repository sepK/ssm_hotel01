package cn.com.ecjtu.mapper;

import cn.com.ecjtu.pojo.OrderInfo;
import cn.com.ecjtu.pojo.OrderInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderInfoMapper {
    long countByExample(OrderInfoExample example);

    int deleteByExample(OrderInfoExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(OrderInfo record);

    int insertSelective(OrderInfo record);

    List<OrderInfo> selectByExampleWithBLOBs(OrderInfoExample example);

    List<OrderInfo> selectByExample(OrderInfoExample example);

    OrderInfo selectByPrimaryKey(Integer id);

    List<OrderInfo> selectByExampleWithBLOBsAndOthers(OrderInfoExample example);

    List<OrderInfo> selectByExampleWithOthers(OrderInfoExample example);

    OrderInfo selectByPrimaryKeyWithOthers(Integer id);

    int updateByExampleSelective(@Param("record") OrderInfo record, @Param("example") OrderInfoExample example);

    int updateByExampleWithBLOBs(@Param("record") OrderInfo record, @Param("example") OrderInfoExample example);

    int updateByExample(@Param("record") OrderInfo record, @Param("example") OrderInfoExample example);

    int updateByPrimaryKeySelective(OrderInfo record);

    int updateByPrimaryKeyWithBLOBs(OrderInfo record);

    int updateByPrimaryKey(OrderInfo record);
}