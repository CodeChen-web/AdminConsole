<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<!-- 全局样式-->
		<jsp:include page="AllStyle.jsp"/>
	</head>
	<body>
		<!-- 顶部导航栏 -->
		<jsp:include page="TopMenu.jsp"/>

		<!-- 左侧菜单栏 -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-1 col-md-1 sidebar">
					<ul class="nav nav-sidebar">
						<li><a href="${pageContext.request.contextPath}/DataCount">数据统计 <span class="sr-only"></span></a>
						</li>
						<li><a href="" data-toggle="modal" data-target="#myModalUpdatePwd">密码修改</a></li>
					</ul>
					<ul class="nav nav-sidebar">
						<li><a href="${pageContext.request.contextPath}/ProductManage">商品管理</a></li>
						<li><a href="${pageContext.request.contextPath}/CategoryManage">分类管理</a></li>
						<li><a href="${pageContext.request.contextPath}/OrderManage">订单管理</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/UserManage">用户管理</a></li>
					</ul>
				</div>
			</div>
		</div>

		<!-- 右侧主体内容如下 -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-11 col-sm-offset-1 col-md-11 col-md-offset-1 main">
					<h2 class="sub-header">用户管理</h2>
					<div class="row">
						<div class="col-sm-11 col-md-11" align="center">
							<form class="navbar-form navbar-center" role="search" action="${pageContext.request.contextPath}/UserManage">
								<div class="form-group">
									<input type="text" id="search" name="search" value="${search}" class="form-control" placeholder="用户编码/名称/联系方式">
								</div>
								<button type="submit" class="btn btn-default">搜索</button>
							</form>
						</div>
					</div>

					<div class="table-responsive">
						<table id="dataList" class="table table-striped table-bordered table table-hover table-condensed" style="font-size: 18px;">
							<thead>
							<tr>
								<th></th>
								<th width="10%" style="text-align: center;">用户编号</th>
								<th width="20%" style="text-align: center;">用户名称</th>
								<th width="25%" style="text-align: center;">注册日期</th>
								<th width="15%" style="text-align: center;">联系方式</th>
								<th width="25%" colspan="2"
									style="width: 60px; text-align: center;">操&nbsp;&nbsp;作
								</th>
							</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${pageInfo.list.size() > 0 }">
									<c:forEach items="${pageInfo.list}" var="users">
										<tr style="text-align: center;">
											<td>
												<input type="checkbox" value="${users.uid }" name="ids">
											</td>
											<td>${users.uid}</td>
											<td>${users.uname}</td>
											<td>${users.udatestr}</td>
											<td>${users.tel}</td>
											<td colspan="2" style="width: 60px; text-align: center">
												<a class="btn btn-info" href="#">预留功能</a>&ensp;
												<a class="btn btn-danger" href="#">预留功能</a>&ensp;
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6" style="text-align: center; font-size: 20px;">查询的用户不存在！</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>
					<!-- <div class="table-responsive"> -->
					<!-- .box-footer-->
					<div class="box-footer">
						<div class="pull-left" style="padding-top: 20px;">
							<div class="form-group form-inline">
								<span style="font-size: 18px;">每页显示
									<select class="form-control" id="changePageSize" onchange="changePageSize()" style="height: 25px;padding-top: 1px;;">
										<option <c:if test="${pageInfo.pageSize=='5'}">selected</c:if>>5</option>
										<option <c:if test="${pageInfo.pageSize=='10'}">selected</c:if>>10</option>
										<option>15</option>
										<option>20</option>
										<option>25</option>
									</select> 条数据&emsp;当前第${pageInfo.pageNum}页，共${pageInfo.pages}页，${pageInfo.total}条数据。
								</span>
							</div>
						</div>
						<div class="box-tools pull-right">
							<ul class="pagination">
								<li><a href="${pageContext.request.contextPath}/UserManage?page=1&size=${pageInfo.pageSize}&search=${search}" aria-label="Previous">首页</a></li>
								<li><a href="${pageContext.request.contextPath}/UserManage?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}&search=${search}">上一页</a></li>
								<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
									<li><a href="${pageContext.request.contextPath}/UserManage?page=${pageNum}&size=${pageInfo.pageSize}&search=${search}">${pageNum}</a></li>
								</c:forEach>
								<li><a href="${pageContext.request.contextPath}/UserManage?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}&search=${search}">下一页</a></li>
								<li><a href="${pageContext.request.contextPath}/UserManage?page=${pageInfo.pages}&size=${pageInfo.pageSize}&search=${search}" aria-label="Next">尾页</a></li>
							</ul>
						</div>
					</div>
					<!-- /.box-footer-->
				</div>
			</div>
			<!-- 标题+搜索栏 -->
		</div>
		<!-- <div class="container-fluid"> -->

		<script type="text/javascript">
			function changePageSize() {
				// 获取下拉框的值
				var pageSize = $("#changePageSize").val();
				location.href = "${pageContext.request.contextPath}/UserManage?page=1&size=" + pageSize + "&search=${search}";
			}
		</script>
	</body>
</html>