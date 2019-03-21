package com.model;

public class photograph {
    private Long id;
    private String name;
    private int uId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    @Override
    public String toString() {
        return "photograph{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", uId=" + uId +
                '}';
    }
}
