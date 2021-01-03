package com.soft.cms.filter;

import javax.servlet.*;
import javax.servlet.DispatcherType;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
/**
 * 登录访问权限过滤器
 *
 */
@WebFilter(
        urlPatterns={"/*"},
        dispatcherTypes={DispatcherType.ASYNC,DispatcherType.FORWARD,DispatcherType.INCLUDE,DispatcherType.REQUEST,DispatcherType.ERROR}
)
//@WebFilter("/*")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //强制转换
        HttpServletRequest request=(HttpServletRequest)req ;
        //获取请求资源路径
        String url=request.getServletPath();
        System.out.println(url);
        //判断是否跟登录有关的请求资源
        if(url.contains("/index.jsp")||url.contains("/login.jsp")||url.contains("/register.jsp")||url.contains("/css/")
                ||url.contains("/index1.jsp")||url.contains("/index2.jsp")   ||url.contains("/js/")||url.contains("/img/")
                ||url.contains("/handleLogin.jsp"))
        {
            chain.doFilter(req, resp);
        }
        else
        {
            //不包含
            HttpSession httpSession=request.getSession();
            System.out.println(httpSession.getAttribute("username"));
            if(httpSession.getAttribute("username")!=null)
            {
                //登录了，放行
                chain.doFilter(req, resp);
            }
            else{
                //request.setAttribute("loginMsg","您尚未登录，请先登录");
                request.getRequestDispatcher("login.jsp").forward(request,resp);
            }
        }

    }

    public void init(FilterConfig config) throws ServletException {
    }
}
