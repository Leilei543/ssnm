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

<body onload="queryDetails()">


	<div id="wrapper">

		<!-- Navigation -->
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
					<h1 class="page-header" style="margin-top:70px">客户详情</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading" style="overflow: auto;vertical-align:middle;font-size: 20px">基础信息</div>
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
										<td id="custID" value="${row.cust_id}">${row.cust_id}</td>
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
			
			<!-- 测量数据 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						
						<div class="panel-heading" style="overflow: auto;vertical-align:middle;font-size: 20px" >测量数据<button style="float:right" type="button" class="btn btn-primary" data-toggle="modal"  data-target="#meterNewDialog" onclick="newceliangCustomer()">新建</button></div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>项目名称</th>
									<th>高</th>
									<th>宽</th>
									<th>厚度</th>
									<th>实际面积</th>
									<th>备注</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody_meterData">
								<c:forEach items="${pageD.rows}" var="row">
									<tr>
										<td>${row.cust_id}</td>
										<td>${row.data_menuname}</td>
										<td>${row.data_width}</td>
										<td>${row.data_higth}</td>
										<td>${row.data_land}</td>
										<td>${row.data_area}</td>
										<td>${row.data_remark}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#editmeterdataEditDialog" onclick="editmeterdataCustomer(${row.data_id})">修改</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						 <div class="col-md-12 text-right" id="nav_meterData">
							<!-- 测量数据查询 -->
							<%--<itcast:page url="${pageContext.request.contextPath }/customer/meterData.action?id=${row.cust_id}" />--%>
						</div> 
					</div>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			
			
			
			<!-- 订单报价 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading" style="overflow: auto;vertical-align:middle;font-size: 20px" >订单报价<button style="float:right" type="button" class="btn btn-primary" data-toggle="modal"  data-target="#orderNewDialog" onclick="newOrderCustomer()">新建</button></div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>项目名称</th>
									<th>面积</th>
									<th>门扇</th>
									<th>玻璃</th>
									<th>开关</th>
									<th>其他</th>
									<th>金额</th>
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
										<td>${row.cust_source}</td>
										<td>${row.cust_address}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#orderEditDialog" onclick="editCustomer(${row.cust_id})">修改</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- /.panel-body -->
					</div>
				</div>
			</div>
			
			
			
			<!-- 货款结算 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						
					 	<div class="panel-heading" style="overflow: auto;vertical-align:middle;font-size: 20px" >货款结算<button style="float:right" type="button" class="btn btn-primary" data-toggle="modal"  data-target="#accountNewDialog" onclick="newOrderCustomer()">新建</button></div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>总金额</th>
									<th>线上支付</th>
									<th>线下支付</th>
									<th>未结算</th>
									<th>金额</th>
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
										<td>${row.cust_address}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#accountEditDialog" onclick="editCustomer(${row.cust_id})">修改</a>
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
			
			<!-- 公共留言 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
				
						<div class="panel-heading" style="overflow: auto;vertical-align:middle;font-size: 20px" >公共留言<button style="float:right" type="button" class="btn btn-primary" data-toggle="modal"  data-target="#publicMessageNewDialog" onclick="newCustomer()">留言</button></div>
						
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>时间</th>
									<th>用户</th>
									<th>留言</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.cust_id}</td>
										<td>${row.cust_dataString}</td>
										<td>${row.cust_wangwangID}</td>
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
			
			
		 <!-- 操作记录 -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">操作记录</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>时间</th>
									<th>用户</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
					 					<td>${row.cust_id}</td>
										<td>${row.cust_dataString}</td>
										<td>${row.cust_wangwangID}</td>
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
	<!-- 测量数据新建对话框 -->
	<div class="modal fade" id="meterNewDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建测量数据信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_customer_form">
						<input type="hidden" id="edit_cust_id" name="cust_id"/>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">项目名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="项目名称" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">高度</label> 
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="高度" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">厚度</label>
							<div class="col-sm-10"> 
								<input type="text" class="form-control" id="edit_customerName" placeholder="厚度" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">宽度</label>
							<div class="col-sm-10"> 
								<input type="text" class="form-control" id="edit_customerName" placeholder="宽度" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custLevel" style="float:left;padding:7px 15px 0 27px;">实际面积</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="实际面积" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">备注</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_linkMan" placeholder="备注" name="cust_linkman">
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
	
		<!-- 测量数据修改对话框 -->
	<div class="modal fade" id="editmeterdataEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建测量数据信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_customer_form">
						<input type="hidden" id="edit_cust_id" name="cust_id"/>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">项目名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="项目名称" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">高度</label> 
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="高度" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">厚度</label>
							<div class="col-sm-10"> 
								<input type="text" class="form-control" id="edit_customerName" placeholder="厚度" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">宽度</label>
							<div class="col-sm-10"> 
								<input type="text" class="form-control" id="edit_customerName" placeholder="宽度" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custLevel" style="float:left;padding:7px 15px 0 27px;">实际面积</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="实际面积" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">备注</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_linkMan" placeholder="备注" name="cust_linkman">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="insertCustomer()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 订单报价新建对话框 -->
	<div class="modal fade" id="orderNewDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建订单报价信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_customer_form">
						<input type="hidden" id="edit_cust_id" name="cust_id"/>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">项目名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="项目名称" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">面积</label> 
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="面积" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">门扇</label>
							<div class="col-sm-10"> 
								<input type="text" class="form-control" id="edit_customerName" placeholder="门扇" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">玻璃</label>
							<div class="col-sm-10"> 
								<input type="text" class="form-control" id="edit_customerName" placeholder="玻璃" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">开关</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="开关" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">其他</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_linkMan" placeholder="其他" name="cust_linkman">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">金额</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_linkMan" placeholder="金额" name="cust_linkman">
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
	
	<!-- 订单报价修改对话框 -->
	<div class="modal fade" id="orderEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改订单报价信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_customer_form">
						<input type="hidden" id="edit_cust_id" name="cust_id"/>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">项目名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="项目名称" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">面积</label> 
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="面积" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">门扇</label>
							<div class="col-sm-10"> 
								<input type="text" class="form-control" id="edit_customerName" placeholder="门扇" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">玻璃</label>
							<div class="col-sm-10"> 
								<input type="text" class="form-control" id="edit_customerName" placeholder="玻璃" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">开关</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="开关" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">其他</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_linkMan" placeholder="其他" name="cust_linkman">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">金额</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_linkMan" placeholder="金额" name="cust_linkman">
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
	
	<!-- 货款结算新建对话框 -->
	<div class="modal fade" id="accountNewDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建货款结算信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_customer_form">
						<input type="hidden" id="edit_cust_id" name="cust_id"/>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">总金额</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="总金额" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">线上支付</label> 
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="线上支付" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">线下支付</label>
							<div class="col-sm-10"> 
								<input type="text" class="form-control" id="edit_customerName" placeholder="线下支付" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">未结算</label>
							<div class="col-sm-10"> 
								<input type="text" class="form-control" id="edit_customerName" placeholder="未结算" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">金额</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_linkMan" placeholder="金额" name="cust_linkman">
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
	
	<!-- 货款结算修改对话框 -->
	<div class="modal fade" id="accountEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改货款结算信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_customer_form">
						<input type="hidden" id="edit_cust_id" name="cust_id"/>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">总金额</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="总金额" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">线上支付</label> 
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="线上支付" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">线下支付</label>
							<div class="col-sm-10"> 
								<input type="text" class="form-control" id="edit_customerName" placeholder="线下支付" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">未结算</label>
							<div class="col-sm-10"> 
								<input type="text" class="form-control" id="edit_customerName" placeholder="未结算" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">金额</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_linkMan" placeholder="金额" name="cust_linkman">
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
	
	<!-- 公共留言 -->
	<div class="modal fade" id="publicMessageNewDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">我的留言</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_customer_form">
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">留言</label>
							<div class="col-sm-10">
								<textarea name="mytextarea" style="height:120px;width:400px"></textarea>
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
	<%-- function meterDataList() {
		alert($("#custID").text());
		var id=$("#custID").text();
		$.ajax({
			type:"get",
			url:"<%=basePath%>customer/meterData.action",
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
	} --%>
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
		function newceliangCustomer() {
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
		
		//第一次进入查询所有
		function queryDetails() {
			queryMeterData(1, 5);//查询测量数据，第一页，每页5行
			
		}
		
		
		//查询测量数据
		//page：第几页
		//rows：每页行数
		function queryMeterData(page,rows) {
			
			$("#tbody_meterData").empty();
			var id = $("#custID").text();
			$.ajax({
				type:"get",
				url:"<%=basePath%>/customer/meterDataDetails.action",
				data:{"id":id,
					  "page":page,
					  "rows":rows
				},
				success:function(data) {
					
					//生成表格
					var list = data.meterDetail.rows;
				 	for(var i = 0;i<list.length;i++){
				 		var meterData = list[i];
				 		var str = "<tr>"  
		 			           + "<td>"+list[i].cust_id+"</td>"
		 					   + "<td>"+list[i].data_menuname+"</td>"
		 					   + "<td>"+list[i].data_width+"</td>"
		 					   + "<td>"+list[i].data_higth+"</td>"
		 					   + "<td>"+list[i].data_land+"</td>"
		 					   + "<td>"+list[i].data_area+"</td>"
		 					   + "<td>"+list[i].data_remark+"</td>"
		 					   + "<td><a href='#' class='btn btn-primary btn-xs' data-toggle='modal' data-target='#customerEditDialog' onclick='editCustomer("+list[i].cust_id+"})'>修改</a></td>"
		 					   + "<tr>";  
				 		$("#tbody_meterData").append(str);
				  	}
				 	
				 	//分页功能
				 	writeNavigationTag("nav_meterData", data.meterDetail, "queryMeterData");
				}
			});
		}
		
		//生成分页公共方法
		//navID：分页所在DIV的ID
		//pageObj：封装数据的page对象
		//clickFunction：翻页按钮功能
		function writeNavigationTag(navID, pageObj, clickFunction) {
			$("#"+navID).empty();
			
			//显示页码数量
			var number = 5;
			
			//计算总页数
        	var pageCount = parseInt(pageObj.total / pageObj.size);
        	if (pageObj.total % pageObj.size > 0) {
        		pageCount++;
        	}
        	var str="<nav><ul class='pagination'>";
        
            //显示“上一页”按钮
        	if (pageObj.page > 1) {
        		var prePage = pageObj.page - 1;
                str +="<li><a href='javascript:"+clickFunction+"("+prePage+","+pageObj.size+")'>上一页</a></li>";
            } else {
            	 str +="<li class='disabled'><a href='javascript:void(0)'>上一页</a></li>";
            }
            //显示当前页码的前2页码和后两页码 
            //若1 则 1 2 3 4 5, 若2 则 1 2 3 4 5, 若3 则1 2 3 4 5,
            //若4 则 2 3 4 5 6 ,若10  则 8 9 10 11 12
            var indexPage = (pageObj.page - 2 > 0)? pageObj.page - 2 : 1;  
            for(var i=1; i <= number && indexPage <= pageCount; indexPage++, i++) {
                if(indexPage == pageObj.page) {
                	str += "<li class='active'><a href='javascript:void(0)' >"+indexPage+"<span class=\"sr-only\">(current)</span></a></li>";
                    continue;
                }
                str += "<li><a href='javascript:"+clickFunction+"("+indexPage+","+pageObj.size+")'>"+ indexPage +"</a></li>";
            }
            //显示“下一页”按钮
            if (pageObj.page < pageCount) {
            	var nextPage = pageObj.page+1;
            	str += "<li><a href='javascript:"+clickFunction+"("+nextPage+","+pageObj.size+")'>下一页</a></li>";
            } else {
            	str += "<li class='disabled'><a href='javascript:void(0)'>下一页</a></li></nav>";
            }
        	$("#nav_meterData").append(str);
		}
		
	</script>

</body>

</html>
