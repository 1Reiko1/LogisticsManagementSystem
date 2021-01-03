package com.soft.cms.dao;

import com.soft.cms.entity.Vehicle;
import com.soft.cms.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class VehicleDAO {
    //添加车辆信息
    public boolean isAddVehicle(Vehicle v){
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn= DBUtil.getConnection();
            String sql = "insert transport_info (did,oid,company,d_name,d_phone,needday,v_state) " +
                    "values(?,?,?,?,?,?,?)";
            stmt =conn.prepareStatement(sql);
            stmt.setString(1,v.getDid());
            stmt.setString(2,v.getOid());
            stmt.setString(3,v.getCompany());
            stmt.setString(4,v.getD_name());
            stmt.setString(5,v.getD_phone());
            stmt.setInt(6,  v.getNeedday());
            stmt.setString(7,v.getV_state());
            System.out.println("ok");
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
    public boolean updateVehicleState(String oid,String state){
        Connection conn = null;
        PreparedStatement stmt = null;
        int result=0;
        try{
            conn = DBUtil.getConnection();
            String sql = "update transport_info set v_state=? where oid=?";
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

    //获取所有vehicle信息,返回ArrayList类型
    public ArrayList<Vehicle> getAllVehicle(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Vehicle> newsList = new ArrayList<Vehicle>();   //vehicle集合

        try{
            conn=DBUtil.getConnection();
            String sql = "select * from transport_info";
            stmt =conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){

                Vehicle v = new Vehicle();
                v.setId(rs.getInt(1));
                v.setDid(rs.getString(2));
                v.setOid(rs.getString(3));
                v.setCompany(rs.getString(4));
                v.setD_name(rs.getString(5));
                v.setD_phone(rs.getString(6));
                v.setNeedday(rs.getInt(7));
                v.setV_state(rs.getString(8));
                newsList.add(v); //把一条vehicle信息加入集合
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
    //根据订单编号查找运输天数
    public Integer getNumByOid(String oid){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int num=30;//默认
        try{
            conn = DBUtil.getConnection();
            String sql = "select * from transport_info where oid=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, oid);
            rs = stmt.executeQuery();
            if(rs.next()){
                num=rs.getInt(7);
            }
        }catch(Exception e){
            e.printStackTrace();
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
                    stmt = null;
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        return num;
    }
}
