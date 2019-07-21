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

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">AimiGi客户管理系统G1.0</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-messages">
					<li><a href="#">
							<div>
								<strong>令狐冲</strong> <span class="pull-right text-muted">
									<em>昨天</em>
								</span>
							</div>
							<div>今天晚上向大哥找我吃饭，讨论一下去梅庄的事...</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看全部消息</strong>
							<i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-messages --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-tasks">
					<li><a href="#">
							<div>
								<p>
									<strong>任务 1</strong> <span class="pull-right text-muted">完成40%</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="40" aria-valuemin="0"
										aria-valuemax="100" style="width: 40%">
										<span class="sr-only">完成40%</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<p>
									<strong>任务 2</strong> <span class="pull-right text-muted">完成20%</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-info" role="progressbar"
										aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
										style="width: 20%">
										<span class="sr-only">完成20%</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看所有任务</strong>
							<i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-tasks --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-alerts">
					<li><a href="#">
							<div>
								<i class="fa fa-comment fa-fw"></i> 新回复 <span
									class="pull-right text-muted small">4分钟之前</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-envelope fa-fw"></i> 新消息 <span
									class="pull-right text-muted small">4分钟之前</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-tasks fa-fw"></i> 新任务 <span
									class="pull-right text-muted small">4分钟之前</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-upload fa-fw"></i> 服务器重启 <span
									class="pull-right text-muted small">4分钟之前</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看所有提醒</strong>
							<i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-alerts --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i> 用户设置</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
					<li class="divider"></li>
					<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
							退出登录</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
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
					<h1 class="page-header">客户详情</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">基础信息</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>进店日期</th>
									<th>旺旺ID</th>
									<th>客户名称</th>
									<th>客户手机</th>
									<th>客户地区</th>
									<th>客户状态</th>
									<th>客户级别</th>
									<th>详细地址</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.cust_id}</td>
										<td>${row.cust_dataString}</td>
										<td>${row.cust_wangwangID}</td>
										<td>${row.cust_name}</td>
										<td>${row.cust_phone}</td>
										<td>${row.cust_source}</td>
										<td>${row.cust_industry}</td>
										<td>${row.cust_level}</td>
										<td>${row.cust_address}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="editCustomer(${row.cust_id})">修改</a>
											<c:if test="${row.cust_statu==1}" >
												<%-- <span><input class="btn btn-danger btn-xs" id="followupdate" type="button" value="" onclick="updateCustomer(${row.cust_id})"></input></span> --%>
												<span><input class="btn btn-danger btn-xs" id="followupdate" type="button" value="关注" onclick="updateCustomerStatu(${row.cust_id})"/></span>
											</c:if>
											<c:if test="${row.cust_statu==0}" >
												<%-- <span><input class="btn btn-danger btn-xs" id="followupdate" type="button" value="" onclick="updateCustomer(${row.cust_id})"></input></span> --%>
												<span><input class="btn btn-danger btn-xs" id="followupdate" type="button" value="取消关注" onclick="updateCustomerStatuCancel(${row.cust_id})"/></span>
										</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- 客户修改对话框 -->
	<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_customer_form">
						<input type="hidden" id="edit_cust_id" name="cust_id"/>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="客户名称" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户地区</label> 
							<div class="col-sm-10">
								<select	class="form-control" id="edit_customerFrom" placeholder="客户地区" name="cust_source">
									<option value="">--请选择--</option>
									<c:forEach items="${fromType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == custSource}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属状态</label>
							<div class="col-sm-10"> 
								<select	class="form-control" id="edit_custIndustry"  name="cust_industry">
									<option value="">--请选择--</option>
									<c:forEach items="${industryType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
							<div class="col-sm-10">
								<select	class="form-control" id="edit_custLevel" name="cust_level">
									<option value="">--请选择--</option>
									<c:forEach items="${levelType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">联系人</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_linkMan" placeholder="联系人" name="cust_linkman">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_phone" class="col-sm-2 control-label">移动电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_phone" placeholder="移动电话" name="cust_phone">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_dataString" class="col-sm-2 control-label">进店日期</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_dataString" placeholder="进店日期" name="cust_dataString">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_wangwangID" class="col-sm-2 control-label">旺旺ID</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_wangwangID" placeholder="旺旺ID" name="cust_wangwangID">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_address" class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_address" placeholder="联系地址" name="cust_address">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 客户新建对话框 -->
	<div class="modal fade" id="customerNewDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建客户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_customer_form">
						<input type="hidden" id="edit_cust_id" name="cust_id"/>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="客户名称" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户地区</label> 
							<div class="col-sm-10">
								<select	class="form-control" id="edit_customerFrom" placeholder="客户地区" name="cust_source">
									<option value="">--请选择--</option>
									<c:forEach items="${fromType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == custSource}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属状态</label>
							<div class="col-sm-10"> 
								<select	class="form-control" id="edit_custIndustry"  name="cust_industry">
									<option value="">--请选择--</option>
									<c:forEach items="${industryType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
							<div class="col-sm-10">
								<select	class="form-control" id="edit_custLevel" name="cust_level">
									<option value="">--请选择--</option>
									<c:forEach items="${levelType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">联系人</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_linkMan" placeholder="联系人" name="cust_linkman">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_phone" class="col-sm-2 control-label">移动电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_phone" placeholder="移动电话" name="cust_phone">
							</div>
						</div>
						<!-- <div class="form-group">
							<label for="edit_mobile" class="col-sm-2 control-label">进店日期</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_mobile" placeholder="进店日期" name="cust_mobile">
							</div>
						</div> -->
						<div class="form-group">
							<label for="edit_wangwangID" class="col-sm-2 control-label">旺旺ID</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_wangwangID" placeholder="旺旺ID" name="cust_wangwangID">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_address" class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_address" placeholder="联系地址" name="cust_address">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="insertCustomer()">保存</button>
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
		
		function updateCustomerStatuCancel(id){
			$.post("<%=basePath%>customer/updateCustomerStatuCancel.action",{"id":id},function(data){
				window.location.reload();
			});
		}
		
	</script>

</body>

</html>
