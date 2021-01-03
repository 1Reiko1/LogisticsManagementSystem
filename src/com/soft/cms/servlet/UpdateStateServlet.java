package com.soft.cms.servlet;

import com.soft.cms.dao.OrderDAO;
import com.soft.cms.dao.VehicleDAO;
import com.soft.cms.entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import java.text.*;

@WebServlet(urlPatterns= "/UpdateStateServlet")
public class UpdateStateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        //获取当前日期
        String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());

        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        OrderDAO dao = new OrderDAO();
        ArrayList<Order> orders = dao.getAllOrder();
        for(Order o:orders){
            String oid=o.getOid();
            Date c_time=o.getTime();
            VehicleDAO dao1=new VehicleDAO();
            Integer num=dao1.getNumByOid(oid);//使用天数
            System.out.println(oid+"，"+num+"，"+c_time);
            Calendar ca = Calendar.getInstance();
            ca.setTime(c_time);
            ca.add(Calendar.DATE,num);
            String enddate=format.format(ca.getTime());
            System.out.println("送达日期："+enddate);
            if(datetime.compareTo(enddate)>=0){
                if(o.getState().equals("已完成")){
                    System.out.println("用户已签收！");
                }else{
                    System.out.println("当前日期在送达日期之后");
                    String state="已送达";
                    if(dao.updateOrderState(oid,state)&&dao1.updateVehicleState(oid,state)){
                        System.out.println("订单状态更新成功！");
                    }
                }
            }else{
                System.out.println("状态不用更新！");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
