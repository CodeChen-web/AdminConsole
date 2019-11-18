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
						<li><a href="${pageContext.request.contextPath}/DataCount">数据统计 <span class="sr-only"></span></a></li>
						<li><a href="" data-toggle="modal" data-target="#myModalUpdatePwd">密码修改</a></li>
					</ul>
					<ul class="nav nav-sidebar">
						<li><a href="${pageContext.request.contextPath}/ProductManage">商品管理</a></li>
						<li><a href="${pageContext.request.contextPath}/CategoryManage">分类管理</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/OrderManage">订单管理</a></li>
						<li><a href="${pageContext.request.contextPath}/UserManage">用户管理</a></li>
					</ul>
				</div>
			</div>
		</div>

		<!-- 右侧主体内容如下 -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-11 col-sm-offset-1 col-md-11 col-md-offset-1 main">
					<h2 class="sub-header">订单管理</h2>
					<div class="row">
						<div class="col-sm-11 col-md-11" align="center">
							<form class="navbar-form navbar-center" role="search" action="${pageContext.request.contextPath}/OrderManage">
								<div class="form-group">
									<input type="text" id="search" name="search" value="${search}"
										   class="form-control" placeholder="订单编号/收货人/联系方式">
								</div>
								<button type="submit" class="btn btn-default">搜索</button>
							</form>
						</div>
					</div>

					<div class="table-responsive col-sm-11 col-md-11" align="center">
						<c:choose>
							<c:when test="${pageInfo.list.size() > 0 }">
								<c:forEach items="${pageInfo.list}" var="order">
									<table class="table table-striped table-bordered table table-hover table-condensed"
										   style="font-size: 18px;">
										<tr>
											<th>订单编号</th>
											<td colspan="2">${order.oid }</td>
											<th>订单日期</th>
											<td colspan="2">${order.odatestr }</td>
											<th>订单备注</th>
											<td colspan="2">${order.remarks }</td>
											<th>订单总价</th>
											<td colspan="2">${order.total }</td>
										</tr>
										<tr>
											<th>收货人</th>
											<td colspan="2">${order.consignee }</td>
											<th>联系方式</th>
											<td colspan="2">${order.phone }</td>
											<th>收货地址</th>
											<td colspan="2">${order.content }</td>
											<th>订单状态</th>
											<td colspan="3">
												<!-- state为000 表示用户提交了订单， 但未付款 -->
												<c:if test="${order.state == '000'}">
													<button class="btn btn-info btn-sm" disabled="disabled">等待付款</button>
													&nbsp;
													<button class="btn btn-danger btn-sm" onclick="updateOrderState(${order.oid},404)">
														取消订单
													</button>

													<!-- 用户的订单操作 测试使用 --><br><br>
													<button class="btn btn-info btn-sm" disabled="disabled">等待付款</button>
													&nbsp;
													<button class="btn btn-primary btn-sm"
															onclick="updateOrderState(${order.oid},101)">确认付款
													</button>
													<button class="btn btn-danger btn-sm" onclick="updateOrderState(${order.oid},404)">
														取消订单
													</button>
												</c:if>
												<!-- state为101表示用户已付款 ，等待管理员发货 -->
												<c:if test="${order.state == 101}">
													<button class="btn btn-info btn-sm" disabled="disabled">付款成功</button>
													&nbsp;
													<button class="btn btn-primary btn-sm"
															onclick="updateOrderState(${order.oid},202)">确认发货
													</button>
													<button class="btn btn-danger btn-sm" onclick="updateOrderState(${order.oid},404)">
														取消订单
													</button>

													<!-- 用户的订单操作 测试使用 --><br><br>
													<button class="btn btn-info btn-sm" disabled="disabled">正在配货</button>
													&nbsp;
													<button class="btn btn-danger btn-sm" onclick="updateOrderState(${order.oid},404)">
														取消订单
													</button>
												</c:if>
												<!-- state为202表示管理员已发货， 但用户未收货 -->
												<c:if test="${order.state == 202}">
													<button class="btn btn-info btn-sm" disabled="disabled">等待收货</button>
													&nbsp;
													<button class="btn btn-danger btn-sm" onclick="updateOrderState(${order.oid},404)">
														取消订单
													</button>

													<!-- 用户的订单操作 测试使用 --><br><br>
													<button class="btn btn-info btn-sm" disabled="disabled">发货成功</button>
													&nbsp;
													<button class="btn btn-primary btn-sm"
															onclick="updateOrderState(${order.oid},200)">确认收货
													</button>
													<button class="btn btn-danger btn-sm" onclick="updateOrderState(${order.oid},404)">
														取消订单
													</button>
												</c:if>
												<!-- state为200表示用户已收货，管理员与用户双方均显示订单完成 -->
												<c:if test="${order.state == 200}">
													<button class="btn btn-success btn-sm" disabled="disabled">订单完成</button>
													&nbsp;

													<!-- 用户的订单操作 测试使用 --><br><br>
													<button class="btn btn-success btn-sm" disabled="disabled">订单完成</button>
													&nbsp;
												</c:if>
												<!-- state为404表示此订单已取消 -->
												<c:if test="${order.state == 404}">
													<button class="btn btn-warning btn-sm" disabled="disabled">订单已取消</button>
													&nbsp;

													<!-- 用户的订单操作 测试使用 --><br><br>
													<button class="btn btn-warning btn-sm" disabled="disabled">订单已取消</button>
													&nbsp;
												</c:if>
											</td>
										</tr>
										<tr>
											<th colspan="12" style="text-align: center;">订单商品详情列表</th>
										</tr>
										<tr>
											<th colspan="1">商品编号</th>
											<th colspan="2">商品名称</th>
											<th colspan="4">商品简介</th>
											<th colspan="1">商品单价</th>
											<th colspan="1">数&nbsp;&nbsp;量</th>
											<th colspan="2">价&nbsp;&nbsp;格</th>
										</tr>
										<c:forEach items="${order.orderitems}" var="item">
											<tr>
												<td colspan="1">${item.pid}</td>
												<td colspan="2">${item.pname}</td>
												<td colspan="4">${item.pdetails}</td>
												<td colspan="1">${item.pprice}</td>
												<td colspan="1">${item.count}</td>
												<td colspan="2">${item.subtotal}</td>
											</tr>
										</c:forEach>
									</table>
									<hr style="height:10px;border:none;border-top:10px groove skyblue;"/>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<table>
									<tr>
										<td colspan="12" style="text-align: center; font-size: 20px;">查询的订单信息不存在！</td>
									</tr>
								</table>
								<br><br>
								<hr style="height:10px;border:none;border-top:10px groove skyblue;"/>
							</c:otherwise>
						</c:choose>

					</div><!-- <div class="table-responsive"> -->

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
								<li><a href="${pageContext.request.contextPath}/OrderManage?page=1&size=${pageInfo.pageSize}&search=${search}" aria-label="Previous">首页</a></li>
								<li><a href="${pageContext.request.contextPath}/OrderManage?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}&search=${search}">上一页</a></li>
								<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
									<li><a href="${pageContext.request.contextPath}/OrderManage?page=${pageNum}&size=${pageInfo.pageSize}&search=${search}">${pageNum}</a></li>
								</c:forEach>
								<li><a href="${pageContext.request.contextPath}/OrderManage?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}&search=${search}">下一页</a></li>
								<li><a href="${pageContext.request.contextPath}/OrderManage?page=${pageInfo.pages}&size=${pageInfo.pageSize}&search=${search}" aria-label="Next">尾页</a></li>
							</ul>
						</div>
					</div>
					<!-- /.box-footer-->
				</div>
			</div><!-- 标题+搜索栏 -->
		</div><!-- <div class="container-fluid"> -->

		<script type="text/javascript">
			function changePageSize() {
				// 获取下拉框的值
				var pageSize = $("#changePageSize").val();
				location.href = "${pageContext.request.contextPath}/OrderManage?page=1&size=" + pageSize + "&search=${search}";
			}
		</script>

		<script type="text/javascript">
			var page = "${pageInfo.pageNum}";
			var size = "${pageInfo.pageSize}";

			/*更新订单状态*/
			function updateOrderState(oid, state) {
				if (state==404) {
					/*订单取消*/
					if (confirm("是否取消此订单？")) {
						location.href = "${pageContext.request.contextPath}/operateOrder?page=" + page
								+ "&size=" + size + "&oid=" + oid
								+ "&state=" + state + "&search=" + $(":text[name='search']").val();
					}
				} else {
					/*更新订单状态*/
					location.href = "${pageContext.request.contextPath}/operateOrder?page=" + page
							+ "&size=" + size + "&oid=" + oid
							+ "&state=" + state + "&search=" + $(":text[name='search']").val();
				}
			}
		</script>
		<!--/请在上方写此页面业务相关的脚本-->
	</body>
</html>