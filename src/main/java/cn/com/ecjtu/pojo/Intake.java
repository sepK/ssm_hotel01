package cn.com.ecjtu.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Intake {
    private Integer id;

    private Integer roomid;

    private String cusname;

    private Date startTime;

    private Date endTime;

    private Double money;

    public Intake() {
    }

    public Intake(Integer id, Integer roomid, String cusname, Date startTime, Date endTime, Double money) {
        this.id = id;
        this.roomid = roomid;
        this.cusname = cusname;
        this.startTime = startTime;
        this.endTime = endTime;
        this.money = money;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoomid() {
        return roomid;
    }

    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }

    public String getCusname() {
        return cusname;
    }

    public void setCusname(String cusname) {
        this.cusname = cusname == null ? null : cusname.trim();
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }
}