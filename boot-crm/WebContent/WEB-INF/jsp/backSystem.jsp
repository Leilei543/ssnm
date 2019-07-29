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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>客户列表-BootCRM</title>

<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0; position:fixed; width:100%">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand">AimiGi客户管理系统G1.0</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<li>欢迎您：${SysUser.user_name }</li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
					<i class="fa fa-caret-down"></i>
					</a>
			</li>
			<li class="dropdown">
				<a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
				<ul class="dropdown-menu dropdown-user">
					<!-- <li><a href="#"><i class="fa fa-user fa-fw"></i> 用户设置</a></li> -->
					<li><a data-toggle="modal" data-target="#UserEditDialog"><i class="fa fa-gear fa-fw"></i>修改密码</a></li>
					<li class="divider"></li>
					<li><a href="${pageContext.request.contextPath }/loginOut.action"><i class="fa fa-sign-out fa-fw"></i>
							退出登录</a></li>
				</ul>
			</li>
		</ul>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					
					<li><a href="${pageContext.request.contextPath }/myConcern.action"><i
							class="fa fa-dashboard fa-fw"></i>我的关注</a></li>
					<li><a href="${pageContext.request.contextPath }/customer.action" class="active"><i
							class="fa fa-edit fa-fw"></i> 客户管理</a></li>
					<li><a href="${pageContext.request.contextPath }/backSystem.action"><i
							class="fa fa-dashboard fa-fw"></i>后台设置</a></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header" style="margin-top:70px">后台管理</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						
						<div class="panel-heading" style="overflow: auto;vertical-align:middle;font-size: 20px" >内部账号列表<button style="float:right" type="button" class="btn btn-primary" data-toggle="modal"  data-target="#userNewDialog" onclick="newCustomer()">新建</button></div>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>用户名</th>
									<th>密码</th>
									<th>电话</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.user_id}</td>
										<td>${row.user_name}</td>
										<td>${row.user_password}</td>
										<td>${row.user_phone}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="editUser(${row.user_id})">修改</a>
											<a href="#" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="deleteUser(${row.user_id})">删除</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<itcast:page url="${pageContext.request.contextPath }/customer/backSystem.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading" style="overflow: auto;vertical-align:middle;font-size: 20px" >设置地区列表<button style="float:right" type="button" class="btn btn-primary" data-toggle="modal"  data-target="#regionNewDialog" onclick="newCustomer()">新建</button></div>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>地区</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.user_id}</td>
										<td>${row.user_password}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="editUser(${row.user_id})">修改</a>
											<%-- <a href="#" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="deleteUser(${row.user_id})">删除</a> --%>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%-- <div class="col-md-12 text-right">
							<itcast:page url="${pageContext.request.contextPath }/customer/backSystem.action" />
						</div> --%>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading" style="overflow: auto;vertical-align:middle;font-size: 20px" >设置状态列表<button style="float:right" type="button" class="btn btn-primary" data-toggle="modal"  data-target="#statuNewDialog" onclick="newCustomer()">新建</button></div>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.user_id}</td>
										<td>${row.user_password}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="editUser(${row.user_id})">修改</a>
											<%-- <a href="#" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="deleteUser(${row.user_id})">删除</a> --%>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%-- <div class="col-md-12 text-right">
							<itcast:page url="${pageContext.request.contextPath }/customer/backSystem.action" />
						</div> --%>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading" style="overflow: auto;vertical-align:middle;font-size: 20px" >内部级别列表<button style="float:right" type="button" class="btn btn-primary" data-toggle="modal" data-target="#levelNewDialog" onclick="newCustomer()">新建</button></div>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>级别</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.user_id}</td>
										<td>${row.user_password}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="editUser(${row.user_id})">修改</a>
											<%-- <a href="#" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="deleteUser(${row.user_id})">删除</a> --%>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%-- <div class="col-md-12 text-right">
							<itcast:page url="${pageContext.request.contextPath }/customer/backSystem.action" />
						</div> --%>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading" style="overflow: auto;vertical-align:middle;font-size: 20px" >操作记录列表</div>
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>时间</th>
									<th>用户名</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.user_id}</td>
										<td>${row.user_password}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="editUser(${row.user_id})">修改</a>
											<a href="#" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="deleteUser(${row.user_id})">删除</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%-- <div class="col-md-12 text-right">
							<itcast:page url="${pageContext.request.contextPath }/customer/backSystem.action" />
						</div> --%>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			
			
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- 新建用户信息对话框 -->
	<div class="modal fade" id="userNewDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建用户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_customer_form">
						<input type="hidden" id="edit_cust_id" name="cust_id"/>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">用户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="用户名称" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerFrom" style="float:left;padding:7px 15px 0 27px;">用户电话</label> 
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="用户名称" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custIndustry" style="float:left;padding:7px 15px 0 27px;">密码设置</label>
							<div class="col-sm-10"> 
								<input type="text" class="form-control" id="edit_phone" placeholder="密码设置" name="cust_phone">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateCustomer()">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 新建地区列表对话框 -->
	<div class="modal fade" id="regionNewDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建地区列表</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_customer_form">
						
						<div class="form-group">
							<label for="edit_customerFrom" style="float:left;padding:7px 15px 0 27px;">地区名称</label> 
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="地区名称" name="cust_name">
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateCustomer()">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 新建状态列表对话框 -->
	<div class="modal fade" id="statuNewDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建状态</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_customer_form">
						
						<div class="form-group">
							<label for="edit_customerFrom" style="float:left;padding:7px 15px 0 27px;">状态名称</label> 
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="地区名称" name="cust_name">
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateCustomer()">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 新建级别列表对话框 -->
	<div class="modal fade" id="levelNewDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建级别</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_customer_form">
						
						<div class="form-group">
							<label for="edit_customerFrom" style="float:left;padding:7px 15px 0 27px;">级别名称</label> 
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="级别名称" name="cust_name">
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateCustomer()">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改密码对话框 -->
	<div class="modal fade" id="UserEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改密码</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_userPassword_form">
						<input type="hidden" id="edit_cust_id" name="cust_id"/>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">新密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="edit_password" placeholder="新密码" name="user_password" required>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerFrom" style="float:left;padding:7px 15px 0 27px;">确认密码</label> 
							<div class="col-sm-10">
								<input type="password" class="form-control" id="queren_password" placeholder="确认密码" name="user_quepassword" required>
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateUserPassword()">确定</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	
	<script type="text/javascript">
		function editCustomer(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>customer/edit.action",
				data:{"id":id},
				success:function(data) {
					$("#edit_cust_id").val(data.cust_id);
					$("#edit_customerName").val(data.cust_name);
					$("#edit_customerFrom").val(data.cust_source)
					$("#edit_custIndustry").val(data.cust_industry)
					$("#edit_custLevel").val(data.cust_level)
					$("#edit_linkMan").val(data.cust_linkman);//联系人
					$("#edit_phone").val(data.cust_phone);  //移动电话
					$("#edit_dataString").val(data.cust_dataString);   //进店日期
					$("#edit_wangwangID").val(data.cust_wangwangID);
					$("#edit_address").val(data.cust_address);
				}
			});
		}
		function updateUserPassword(){
			//	 var a = $("#edit_userPassword_form").form("validate");
				
					 var v1=$("#edit_password").val();
					 var v2=$("#queren_password").val();
					 if(v1==v2){
						 $.post("<%=basePath%>customer/updateUserPassword.action",{"password":v1},function(data){
								if(data=='1'){
									alert('修改密码成功！');
									
								}else{
									alert('修改密码失败！');
								}
								window.location.reload();
							});
						 //$("#edit_userPassword_form").window("close");
					 }else{
						 alert('两次密码不一致，修改密码失败！');
						 window.location.reload();
						 //$("#edit_userPassword_form").window("close");
					 }
				
				 
				 
				}
		function newCustomer() {
			$.post("<%=basePath%>customer/newCustomer.action",$("#new_customer_form").serialize(),function(data){
				
				window.location.reload();
			});
		}
		function updateCustomer() {
			$.post("<%=basePath%>customer/update.action",$("#edit_customer_form").serialize(),function(data){
				alert("客户信息更新成功！");
				window.location.reload();
			});
		}
		function insertCustomer() {
			$.post("<%=basePath%>customer/insertCustomer.action",$("#new_customer_form").serialize(),function(data){
				alert("客户信息更新成功！");
				window.location.reload();
			});
		}
		
		//function deleteCustomer(id) {
		//	if(confirm('确实要删除该客户吗?')) {
		//		$.post("<//%=basePath%>customer/delete.action",{"id":id},function(data){
		//			alert("客户删除更新成功！");
		//			window.location.reload();
			//	});
			//}
		//}
		function detailsCustomer(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>customer/details.action",
				data:{"id":id},
				success:function(data) {
					
				}
			});
			
			
		}
		
		function updateCustomerStatu(id){
			$.post("<%=basePath%>customer/updateCustomerStatu.action",{"id":id},function(data){
				window.location.reload();
			});
		}
		
		function editUser(id){
			alert("功能待开发，考虑是否有必要！");
			<%-- $.post("<%=basePath%>customer/updateCustomerStatuCancel.action",{"id":id},function(data){
				alert("客户删除更新成功！");
			}); --%>
			
		}
		
	</script>

</body>

</html>
