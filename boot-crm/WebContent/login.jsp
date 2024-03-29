<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,innitial-scale=1">  
		<title>登陆页面</title>
		<script src="./js/jquery-1.8.3.js" type="text/javascript"></script>
		<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet"type="text/css">
		<link href="<%=basePath%>css/login.css" rel="stylesheet"type="text/css">
	</head>
	
	<body>
		<div class="loginbox">
		<div class="loginnav">
			<nav class="navbar navbar-default">
				<div class="container">
					<div class="navbar-header">
						<!-- <a class="navbar-brand" href="#"><img src="images/logo.png"></a> -->
						<span class="logintitle">团结一心   服务至上  —— AimiGe客户管理系统</span>
					</div>
				</div>
			</nav>
		</div>
		
		<section class="mainlogin">
			<div class="container">
				<div class="col-md-4 col-md-offset-7 logincontent">
					<h4>员工登录</h4>
					<form class="form-horizontal" id="customerForm" name="loginform" method="post" action="customer_login.action">
						<div class="form-group" id="idInputLine">
							<label for="inputPassword3" class="col-sm-3 control-label">账号</label>
							<div class="col-sm-8">
								<!-- <input id="loginform:idInput" type="text" name="username" class="form-control" placeholder="请输入手机号/邮箱/用户名"> -->
								<input id="loginform:idInput" type="text" name="telephone" class="form-control" placeholder="请输入手机号">
							</div>
						</div>
						<div class="form-group" id="pwdInputLine">
							<label id="loginform:pwdInput" class="col-sm-3 control-label">密码</label>
							<div class="col-sm-8">
								<input for="pwdInput" type="password" class="form-control" name="password"id="inputaccount" placeholder="请输入您的密码">
							</div>
						</div>
						<!-- <div class="form-group">
							<label for="inputvalidate" class="col-sm-3 control-label">验证码</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="inputaccount" placeholder="请输入验证码">
							</div>
							<div class="col-sm-4">
								<img id="loginform:vCode" src="validatecode.jsp"  onclick="javascript:document.getElementById('loginform:vCode'). src='validatecode.jsp?'+Math.random();" />
							</div>
						</div> -->
						<!-- <div class="form-group">
							
							<div class="col-sm-offset-3 col-sm-4">
								<input type="checkbox"><span class="size12">　记住用户名</span>
							</div>
							<div class="col-sm-4">
								<a href="#"><span class="size12 forget">忘记密码</span></a>
							</div>
						</div> -->
						<div class="col-md-offset-3 col-md-8">
							<a href="javascript:$('#customerForm').submit();" id="loginform:j_id19" name="loginform:j_id19"
								 class="btn btn-danger" >立即登录</a>
							
						</div>
					</form>
				</div>
			</div>
		</section>

		<footer class="clearfix">
			<div class="container">
			
			<!-- <p  class="text-center">京ICP备08001421号京公网安备110108007702</p> -->
</div>
		</footer>
		</div>
	</body>
</html>