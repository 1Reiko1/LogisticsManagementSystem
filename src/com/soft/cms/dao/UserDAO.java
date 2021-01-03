package com.soft.cms.dao;

import com.soft.cms.entity.User;
import com.soft.cms.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;

public class UserDAO {
	
	//用户逻辑类:通过用户名获取用户信息
	public User getUserByUsername(String username){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try{
			conn = DBUtil.getConnection();
			String sql = "select * from t_user where username = binary ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			if(rs.next()){
				User user = new User();
				user.setId(rs.getInt(1));
				user.setUsername(rs.getString(2)) ;
				user.setPassword(rs.getString(3));
				return user;
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
	


//注册或者添加用户信息
	public boolean isAddUser(String username,String password){
		if(username.equals("")||password.equals("")) return false;
		Connection conn = null;
		PreparedStatement stmt = null;
		try{
			conn= DBUtil.getConnection();
			String sql = "insert t_user (username,password,createtime) values(?,?,?)";
			stmt =conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);
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
	
	//获取所有user信息,返回ArrayList类型
		public ArrayList<User> getAllUser(){
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			ArrayList<User> newsList = new ArrayList<User>();   //user集合
			
			try{
				conn=DBUtil.getConnection();
				String sql = "select * from t_user";
				stmt =conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				
				while(rs.next()){
					
					User user = new User();
					user.setId(rs.getInt(1));
					user.setUsername(rs.getString(2));
					user.setPassword(rs.getString(3));
					user.setCreatetime(rs.getDate(4));
					newsList.add(user); //把一条user信息加入集合
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

	public Integer selectUsernameCount(String name) {
		String sql = "select count(*) from t_user u where u.username =?";
		Integer count = DBUtil.getCount(sql,name);
		return count;
	}
		public boolean isUpdateUser(String id,String username,String password){
			if(username.equals("")&&password.equals("")) return false;
			Connection conn = null;
			PreparedStatement stmt = null;
			try{
				conn=DBUtil.getConnection();
				String sql = "update t_user set username='"+username+"',password='"+password+"' where id='"+id+"'";
				stmt =conn.prepareStatement(sql);
				
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
	//删除user信息
	public boolean delUser(int id){
		boolean flag=false;
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = DBUtil.getConnection();
			String sql="delete from t_user where id=?";
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
		//查找user信息
		public User getUserDetail(int id){
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try{
				conn = DBUtil.getConnection();
				String sql = "select * from t_user where id =?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1,id);
				rs = stmt.executeQuery();
				
				if(rs.next()){
					User user = new User();
					user.setId(rs.getInt(1));
					user.setUsername(rs.getString(2));
					user.setPassword(rs.getString(3));
					user.setCreatetime(rs.getDate(4));
					return user;
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
}
