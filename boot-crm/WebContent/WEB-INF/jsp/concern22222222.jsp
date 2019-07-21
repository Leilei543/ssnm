<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>关注信息列表</title>
</head>
<body>
				<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">关注信息列表</div>
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
											<a href="#" class="btn btn-danger btn-xs" onclick="deleteCustomer(${row.cust_id})">删除</a>
											<c:if test="${row.cust_statu==1}" >
												<%-- <span><input class="btn btn-danger btn-xs" id="followupdate" type="button" value="" onclick="updateCustomer(${row.cust_id})"></input></span> --%>
												<span><input class="btn btn-danger btn-xs" id="followupdate" type="button" value="关注" onclick="updateCustomerStatu(${row.cust_id})"></input></span>
											</c:if>
											<c:if test="${row.cust_statu==0}" >
												<%-- <span><input class="btn btn-danger btn-xs" id="followupdate" type="button" value="" onclick="updateCustomer(${row.cust_id})"></input></span> --%>
												<span><input class="btn btn-danger btn-xs" id="followupdate" type="button" value="取消关注" onclick="updateCustomerStatuCancel(${row.cust_id})"></input></span>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<itcast:page url="${pageContext.request.contextPath }/customer/myConcernList.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
</body>
</html>