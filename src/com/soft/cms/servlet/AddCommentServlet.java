package com.soft.cms.servlet;

import com.soft.cms.dao.CommentDAO;
import com.soft.cms.entity.Comment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求和响应编码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        // 获取请求参数
        String s=request.getParameter("str");
        String name=request.getParameter("name");
        Comment comment=new Comment();
        comment.setUsername(name);
        comment.setContent(s);
        CommentDAO dao=new CommentDAO();
        if(dao.isAddComment(comment)){
            System.out.println("ok");
            response.sendRedirect("comment.jsp");
            out.write("评论成功");
        }else{
            System.out.println("no");
            out.write("评论失败");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
