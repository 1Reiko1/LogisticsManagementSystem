package com.soft.cms.entity;

import java.util.Date;

public class Order {
    private int id;
    private String oid;
    private String goods;
    private String sender;
    private String recipients;
    private String sender_phone;
    private String  recipients_phone;
    private String sender_address;
    private String  recipients_address;
    private String state;
    private Date time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getGoods() {
        return goods;
    }

    public void setGoods(String goods) {
        this.goods = goods;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getRecipients() {
        return recipients;
    }

    public void setRecipients(String recipients) {
        this.recipients = recipients;
    }

    public String getSender_phone() {
        return sender_phone;
    }

    public void setSender_phone(String sender_phone) {
        this.sender_phone = sender_phone;
    }

    public String getRecipients_phone() {
        return recipients_phone;
    }

    public void setRecipients_phone(String recipients_phone) {
        this.recipients_phone = recipients_phone;
    }

    public String getSender_address() {
        return sender_address;
    }

    public void setSender_address(String sender_address) {
        this.sender_address = sender_address;
    }

    public String getRecipients_address() {
        return recipients_address;
    }

    public void setRecipients_address(String recipients_address) {
        this.recipients_address = recipients_address;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", oid='" + oid + '\'' +
                ", goods='" + goods + '\'' +
                ", sender='" + sender + '\'' +
                ", recipients='" + recipients + '\'' +
                ", sender_phone='" + sender_phone + '\'' +
                ", recipients_phone='" + recipients_phone + '\'' +
                ", sender_address='" + sender_address + '\'' +
                ", recipients_address='" + recipients_address + '\'' +
                ", state='" + state + '\'' +
                ", time=" + time +
                '}';
    }
}
