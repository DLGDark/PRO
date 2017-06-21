<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <title>影院后台管理系统</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="/ttms/index/css/reset.css">
        <link rel="stylesheet" href="/ttms/index/css/supersized.css">
        <link rel="stylesheet" href="/ttms/index/css/login.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    
    <body>

        <div class="page-container">
            <h1>影院后台管理系统</h1>
            <form action="/ttms/employee/login" method="post">
                <input type="text" name="emp_account" class="username" placeholder="Account">
                <input type="password" name="emp_pass" class="password" placeholder="Password">
                <button type="submit">Sign in</button>
                <div class="error"><span>+</span></div>
            </form>
            <div class="connect">
                <p>Copyright &copy; 2016-2017 西安邮电大学 版权所有</p>
            </div>
        </div>

        <!-- Javascript -->
        <script src="/ttms/index/js/jquery-1.12.0.min.js"></script>
        <script src="/ttms/index/js/supersized.3.2.7.min.js"></script>
        <script src="/ttms/index/js/supersized-init.js"></script>
        <script src="/ttms/index/js/scripts.js"></script>
    </body>

</html>