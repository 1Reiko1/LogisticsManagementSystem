package com.soft.cms.entity;

public class Vehicle {
    private int id;
    private String did;
    private String oid;
    private String company;
    private String d_name;
    private String d_phone;
    private int needday;
    private String v_state;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDid() {
        return did;
    }

    public void setDid(String did) {
        this.did = did;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }

    public String getD_phone() {
        return d_phone;
    }

    public void setD_phone(String d_phone) {
        this.d_phone = d_phone;
    }

    public int getNeedday() {
        return needday;
    }

    public void setNeedday(int needday) {
        this.needday = needday;
    }

    public String getV_state() {
        return v_state;
    }

    public void setV_state(String v_state) {
        this.v_state = v_state;
    }
}
