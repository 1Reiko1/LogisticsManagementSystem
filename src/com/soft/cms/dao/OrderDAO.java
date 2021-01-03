package com.soft.cms.dao;


import com.soft.cms.entity.Order;
import com.soft.cms.entity.Vehicle;
import com.soft.cms.util.DBUtil;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OrderDAO {
    //添加订单信息
    public boolean isAddOrder(Order order){
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn= DBUtil.getConnection();
            String sql = "insert t_order (oid,goods,sender,sender_phone,sender_address,recipients," +
                    "recipients_phone,recipients_address,state,time) " +
                    "values(?,?,?,?,?,?,?,?,?,?)";
            stmt =conn.prepareStatement(sql);
            stmt.setString(1,order.getOid());
            stmt.setString(2,order.getGoods());
            stmt.setString(3,order.getSender());
            stmt.setString(4,order.getSender_phone());
            stmt.setString(5,order.getSender_address());
            stmt.setString(6,order.getRecipients());
            stmt.setString(7,order.getRecipients_phone());
            stmt.setString(8,order.getRecipients_address());
            stmt.setString(9,order.getState());
            System.out.println("ok");
            java.util.Date utilDate = new java.util.Date();
            Date sqlDate = new Date(utilDate.getTime());
            stmt.setDate(10, sqlDate);
            int result = stmt.executeUpdate();
            if(result==1)
                return true;
            else return false;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }finally{
            if(stmt!=null){
                try{
                    stmt.close();
                    stmt=null;
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
    }

    public boolean updateOrderInfo(Vehicle v, String oid){
        Connection conn = null;
        PreparedStatement stmt = null;
        int result=0;
        try{
            conn = DBUtil.getConnection();
            String sql = "update transport_info set did='"+v.getDid()+"',company='"+v.getCompany()+"',d_name='"+v.getD_name()+"'," +
                    "d_phone='"+v.getD_phone()+"',needday='"+v.getNeedday()+"',v_state='"+v.getV_state()+"' where oid='"+oid+"'";
            stmt = conn.prepareStatement(sql);
            result=stmt.executeUpdate();
            System.out.println("成功");
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(stmt!=null){
                try{
                    stmt.close();
                    stmt=null;
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        return result>0?true:false;
    }

    public boolean updateOrderState(String oid,String state){
        Connection conn = null;
        PreparedStatement stmt = null;
        int result=0;
        try{
            conn = DBUtil.getConnection();
            String sql = "update t_order set state=? where oid=?";
            stmt = conn.prepareStatement(sql);
            if(oid!=null){
                stmt.setString(1,state);
                stmt.setString(2,oid);
                result=stmt.executeUpdate();
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(stmt!=null){
                try{
                    stmt.close();
                    stmt=null;
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        return result>0?true:false;
    }
    //根据订单号查找order信息
    public Order getOrderDetail(String oid){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try{
            conn = DBUtil.getConnection();
            String sql = "select * from t_order where oid =?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,oid);
            rs = stmt.executeQuery();

            if(rs.next()){
                Order order= new Order();
                order.setId(rs.getInt(1));
                order.setOid(rs.getString(2));
                order.setGoods(rs.getString(3));
                order.setSender(rs.getString(4));
                order.setSender_phone(rs.getString(5));
                order.setSender_address(rs.getString(6));
                order.setRecipients(rs.getString(7));
                order.setRecipients_phone(rs.getString(8));
                order.setRecipients_address(rs.getString(9));
                order.setState(rs.getString(10));
                order.setTime(rs.getDate(11));
                return order;
            }
            else{
                return null;
            }
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }finally{
            if(rs!=null){
                try{
                    rs.close();
                    rs = null;
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
            if(stmt!=null){
                try{
                    stmt.close();
                    stmt=null;
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
    }

    //根据用户查找order信息
    public ArrayList<Order> getUserOrder(String username){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Order> newsList = new ArrayList<Order>();   //order集合
        try {
            conn = DBUtil.getConnection();
            String sql = "select * from t_order where sender=? or recipients=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, username);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt(1));
                order.setOid(rs.getString(2));
                order.setGoods(rs.getString(3));
                order.setSender(rs.getString(4));
                order.setSender_phone(rs.getString(5));
                order.setSender_address(rs.getString(6));
                order.setRecipients(rs.getString(7));
                order.setRecipients_phone(rs.getString(8));
                order.setRecipients_address(rs.getString(9));
                order.setState(rs.getString(10));
                order.setTime(rs.getDate(11));
                newsList.add(order); //把一条order信息加入集合
            }
            return newsList; //返回集合
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }finally{
            if(rs!=null){
                try{
                    rs.close();
                    rs = null;
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
            if(stmt!=null){
                try{
                    stmt.close();
                    stmt=null;
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
    }

    //获取所有order信息,返回ArrayList类型
    public ArrayList<Order> getAllOrder(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Order> newsList = new ArrayList<Order>();   //order集合

        try{
            conn=DBUtil.getConnection();
            String sql = "select * from t_order";
            stmt =conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){

                Order order = new Order();
                order.setId(rs.getInt(1));
                order.setOid(rs.getString(2));
                order.setGoods(rs.getString(3));
                order.setSender(rs.getString(4));
                order.setSender_phone(rs.getString(5));
                order.setSender_address(rs.getString(6));
                order.setRecipients(rs.getString(7));
                order.setRecipients_phone(rs.getString(8));
                order.setRecipients_address(rs.getString(9));
                order.setState(rs.getString(10));
                order.setTime(rs.getDate(11));
                newsList.add(order); //把一条order信息加入集合
            }
            return newsList; //返回集合
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }finally{
            //关闭数据集对象
            if(rs!=null){
                try{
                    rs.close();
                    rs=null;
                }catch(Exception e){
                    e.printStackTrace();
                }
            }

            //关闭语句对象
            if(stmt!=null){
                try{
                    stmt.close();
                    stmt=null;
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
    }
    //删除order信息
    public boolean delOrder(int id){
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DBUtil.getConnection();
            String sql="delete from t_order where id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,id);
            if(stmt.executeUpdate()>0){
                flag=true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(stmt!=null)
            DBUtil.close(conn,null,stmt);
        }
        return flag;
    }
}
