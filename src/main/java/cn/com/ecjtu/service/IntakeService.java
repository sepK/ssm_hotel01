package cn.com.ecjtu.service;

import cn.com.ecjtu.pojo.Intake;
import cn.com.ecjtu.utils.Msg;

import java.util.List;

public interface IntakeService {
    List<Intake> getIntakes();

    Intake getIntake(Integer id);

    Msg saveIntake(Intake intake);

    Msg addIntake(Intake intake);

    boolean delIntake(Integer id);

    List<Intake> searchIntakes(String cusName);
}
