package com.soft.cms.util;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class DBUtil {
        private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
        private static final String URL = "jdbc:mysql://localhost:3306/logistics?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=UTF-8&useSSL=false";
        private static final String USER = "root";
        private static final String PWD = "123456";
        private static Connection conn;

        private DBUtil() {}


    /**
     * 该方法用于加载JDBC驱动程序
     *
     * @return 返回数据库连接
     */
    public static Connection getConnection() {
        try {
            // 加载驱动程序
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USER, PWD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    //保存对象方法
    public static boolean save(String sql, Object...args){
        Connection conn=null;
        PreparedStatement ps=null;
        Integer count=null;

        try{
            conn= DBUtil.getConnection();
            ps = conn.prepareStatement(sql);

            if(args!=null&&args.length>0) {
                for (int i = 0; i < args.length; i++) {
                    ps.setObject(i + 1, args[i]);

                }
            }
            //返回更新的记录数
            count= ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            close(conn, null,ps);
        }
        return  count!=null&&count>0?true:false;
    }

    public static void close(Connection connection, ResultSet rs, Statement ps) {
        if(rs!=null){
            try {
                rs.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        if(ps!=null){
            try {
                ps.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        if(connection!=null){
            try {
                connection.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
    }
    //查询记录数量
    public static Integer getCount(String sql, Object...args) {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        Integer count=null;

        try{
            conn= DBUtil.getConnection();
            ps = conn.prepareStatement(sql);

            if(args!=null&&args.length>0) {
                for (int i = 0; i < args.length; i++) {
                    ps.setObject(i + 1, args[i]);

                }
            }
            rs = ps.executeQuery();

            while (rs.next()){

                count = rs.getInt(1);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            close(conn, rs, ps);
        }
        return count;
    }
}
