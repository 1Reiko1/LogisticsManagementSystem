package com.soft.cms.dao;

import com.soft.cms.entity.Comment;
import com.soft.cms.util.DBUtil;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommentDAO {
    //上传用户评论信息
    public boolean isAddComment(Comment comment){
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            conn= DBUtil.getConnection();
            String sql = "insert comment (username,content,c_time) values(?,?,?)";
            stmt =conn.prepareStatement(sql);
            stmt.setString(1, comment.getUsername());
            stmt.setString(2, comment.getContent());
            System.out.println("ok");
            java.util.Date utilDate = new java.util.Date();
            Date sqlDate = new Date(utilDate.getTime());
            stmt.setDate(3, sqlDate);
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
    //删除评论信息
    public boolean delComment(int id){
        boolean flag=false;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            String sql="delete from comment where id=?";
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
    //获取所有comment信息,返回ArrayList类型
    public ArrayList<Comment> getAllComment(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Comment> newsList = new ArrayList<Comment>();   //comment集合

        try{
            conn=DBUtil.getConnection();
            String sql = "select * from comment";
            stmt =conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while(rs.next()){

                Comment comment = new Comment();
                comment.setId(rs.getInt(1));
                comment.setUsername(rs.getString(2));
                comment.setContent(rs.getString(3));
                comment.setC_time(rs.getDate(4));
                newsList.add(comment); //把一条comment信息加入集合
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
    //根据用户查找评论信息
    public ArrayList<Comment> getUsernameComment(String username){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Comment> newsList = new ArrayList<Comment>();   //order集合
        try {
            conn = DBUtil.getConnection();
            String sql = "select * from comment where username=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Comment c = new Comment();
                c.setId(rs.getInt(1));
                c.setUsername(rs.getString(2));
                c.setContent(rs.getString(3));
                c.setC_time(rs.getDate(4));
                newsList.add(c); //把一条评论信息加入集合
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
}
