package cn.com.ecjtu.pojo;

import java.io.Serializable;

public class Indent implements Serializable{
    private OrderInfo orderInfo;
    private Intake intake;
    private String picture;

    public Indent() {
    }

    public Indent(OrderInfo orderInfo, Intake intake) {
        this.orderInfo = orderInfo;
        this.intake = intake;
    }

    public OrderInfo getOrderInfo() {
        return orderInfo;
    }

    public void setOrderInfo(OrderInfo orderInfo) {
        this.orderInfo = orderInfo;
    }

    public Intake getIntake() {
        return intake;
    }

    public void setIntake(Intake intake) {
        this.intake = intake;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }
}
