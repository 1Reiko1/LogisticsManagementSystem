package com.soft.cms.dao;

import com.soft.cms.entity.Manager;
import com.soft.cms.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ManagerDAO {
    //用户逻辑类:通过用户名获取用户信息
    public Manager getManagerByName(String name){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try{
            conn = DBUtil.getConnection();
            String sql = "select * from manager where m_name = binary ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            rs = stmt.executeQuery();
            if(rs.next()){
                Manager m = new Manager();
                m.setId(rs.getInt(1));
                m.setName(rs.getString(2)) ;
                m.setPassword(rs.getString(3));
                return m;
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
                    stmt = null;
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
    }
}
