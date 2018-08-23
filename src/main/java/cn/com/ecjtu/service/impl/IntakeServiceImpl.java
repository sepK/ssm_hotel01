package cn.com.ecjtu.service.impl;

import cn.com.ecjtu.exception.CustomerNotFoundException;
import cn.com.ecjtu.exception.ExtraException;
import cn.com.ecjtu.exception.OverTimeException;
import cn.com.ecjtu.exception.RoomNotFoundException;
import cn.com.ecjtu.mapper.IntakeMapper;
import cn.com.ecjtu.pojo.Customer;
import cn.com.ecjtu.pojo.Intake;
import cn.com.ecjtu.pojo.IntakeExample;
import cn.com.ecjtu.service.CustomerService;
import cn.com.ecjtu.service.IntakeService;
import cn.com.ecjtu.service.RoomService;
import cn.com.ecjtu.utils.Msg;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class IntakeServiceImpl implements IntakeService{
    @Resource
    private IntakeMapper intakeMapper;
    @Resource
    private RoomService roomService;
    @Resource
    private CustomerService customerService;

    public List<Intake> getIntakes() {
        return intakeMapper.selectByExample(null);
    }

    public Intake getIntake(Integer id) {
        return intakeMapper.selectByPrimaryKey(id);
    }

    public Msg saveIntake(Intake intake) {
        String msg = "";
        try {
            if(intake.getEndTime().compareTo(intake.getStartTime()) <= 0){
                throw new OverTimeException("结束时间小于开始时间");
            }else{
                intakeMapper.updateByPrimaryKeySelective(intake);
                return Msg.success();
            }
        }catch (OverTimeException e) {
            msg += e.getMessage();
        }catch (Exception e){
            msg += e.toString();
        }
        return Msg.fail(msg);
    }

    @Transactional
    public Msg addIntake(Intake intake) {
        String msg = "";
        try{
            if(roomService.getRoom(intake.getRoomid()) == null) {
                throw new RoomNotFoundException("房间找不到");
            }else{
                if(customerService.checkName(intake.getCusname())){
                    throw new CustomerNotFoundException("用户不存在");
                }else{
                    if(intake.getEndTime().compareTo(intake.getStartTime()) <= 0){
                        throw new OverTimeException("结束时间小于开始时间");
                    }else{
                        String uid = String.valueOf((Math.random() * 9 + 1) * 1000000).substring(0, 7);
                        intake.setId(Integer.parseInt(uid));
                        intakeMapper.insert(intake);
                        return Msg.success();
                    }
                }
            }
        }catch (RoomNotFoundException rnfe){
            msg += rnfe.getMessage();
        }catch (CustomerNotFoundException cnfe){
            msg += cnfe.getMessage();
        }catch (OverTimeException ote){
            msg += ote.getMessage();
        }catch (Exception e){
            throw new ExtraException("保存数据失败" + e.toString());
        }
        return Msg.fail(msg);
    }

    public List<Intake> searchIntakes(String cusName) {
        IntakeExample example = new IntakeExample();
        IntakeExample.Criteria criteria = example.createCriteria();
        criteria.andCusnameLike(cusName);
        return intakeMapper.selectByExample(example);
    }

    public Intake getIntakeByCusNameAndRoomId(Integer roomid, String cusname) {
        IntakeExample example = new IntakeExample();
        IntakeExample.Criteria criteria = example.createCriteria();
        criteria.andCusnameEqualTo(cusname);
        criteria.andRoomidEqualTo(roomid);
        return intakeMapper.selectByExample(example).get(0);
    }

    public boolean delIntake(Integer id) {
        return intakeMapper.deleteByPrimaryKey(id) > 0;
    }

}
