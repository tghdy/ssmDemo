package com.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class img {
    private long id;
    private String name;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date date;
    private int user;
    private byte type;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public byte getType() {
        return type;
    }

    public void setType(byte type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "img{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", date='" + date + '\'' +
                ", user=" + user +
                ", type=" + type +
                '}';
    }
}
