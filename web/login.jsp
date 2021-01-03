<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>物流管理系统</title>
<link rel="stylesheet" href="css/bootstrap.css" />
 
<script type="text/javascript" src="js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
body{ background:#0066A8 url(http://member.wtbds.com/images/Login_bg.jpg) no-repeat center 0px;}
.tit{ margin:auto; margin-top:170px; text-align:center; width:350px; padding-bottom:20px;}
.login-wrap{ width:220px; padding:30px 50px 0 330px; height:220px; background:#fff url(img/20150212154319.jpg) no-repeat 30px 40px; margin:auto; overflow: hidden;position: relative;}
.login_input{ display:block;width:210px;}
.login_user{ background: url(img/input_icon_1.png) no-repeat 200px center; font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif}
.login_password{ background: url(img/input_icon_2.png) no-repeat 200px center; font-family:"Courier New", Courier, monospace}
.btn-login{ background:#40454B; box-shadow:none; text-shadow:none; color:#fff; border:none;height:32px; line-height:26px; font-size:14px; font-family:"microsoft yahei";width: 50px;display: inline-block;}
.btn-login:hover{ background:blue; color:#fff;}
.btn-login{ background:#40454B; box-shadow:none; text-shadow:none; color:#fff; border:none;height:32px; line-height:26px; font-size:14px; font-family:"microsoft yahei";width: 50px;display: inline-block;}
.btn-login:hover{ background:blue; color:#fff;}
.copyright{ margin:auto; margin-top:10px; text-align:center; width:370px; color:#CCC}
.btn-block + .btn-block {
    margin-top: 0px !important;
}
.select{
    width: 100%;
    padding: 0px 0;
}
.login-register{
    bottom: -20px;
    position: absolute;
}
.login-register td{
    display: block;
    width: 100%;
}
.return{
    margin-left: 45px !important; 
    display: inline-block;
    text-decoration: none !important;
}
@media (max-height: 700px) {.tit{ margin:auto; margin-top:100px; }}
@media (max-height: 500px) {.tit{ margin:auto; margin-top:50px; }}
</style>
</head>

<body>
<div class="tit"><img src="img/tit.png" alt="" /></div>
<div class="login-wrap">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <form action="handleLogin.jsp" method="post">
    <tr>
      <td height="25" valign="bottom">用户名：</td>
    </tr>
    <tr>
      <td><input type="text" name="username" class="login_input login_user"/></td>
    </tr>
    <tr>
      <td height="35" valign="bottom">密  码：</td>
    </tr>
    <tr>
      <td><input type="password" name="password" class="login_input login_password"/></td>
    </tr>
    <tr>
      <td height="35" valign="bottom">权限：</td>
    </tr>
    <tr>
      <td>
          <select name="status" id="" class="select">
              <option value="0">用户</option>
              <option value="1">管理员</option>
          </select>
      </td>
    </tr>
    <tr class="login-register">
      <td height="60" valign="bottom">
        <button type="submit" class="btn btn-block btn-login">登录</button>
        <a href="index.jsp" class="return">返回首页</a>
     </td>
    </tr>
    </form>
  </table>
</div>

<div class="copyright">建议使用IE8以上版本或谷歌浏览器</div>
</body>
</html>
