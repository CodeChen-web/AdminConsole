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
						<li class="active"><a href="${pageContext.request.contextPath}/CategoryManage">分类管理</a></li>
						<li><a href="${pageContext.request.contextPath}/OrderManage">订单管理</a></li>
						<li><a href="${pageContext.request.contextPath}/UserManage">用户管理</a></li>
					</ul>
				</div>
			</div>
		</div>

		<!-- 右侧主体内容如下 -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-11 col-sm-offset-1 col-md-11 col-md-offset-1 main">
					<h2 class="sub-header">分类管理</h2>
					<div class="row">
						<div class="col-sm-11 col-md-11" align="center">
							<form class="navbar-form navbar-center" role="search" action="${pageContext.request.contextPath}/CategoryManage">
								<div class="form-group">
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalAdd" style="margin-right: 20px;">添加分类
									</button>
									<input type="text" id="search" name="search" value="${search}" class="form-control" placeholder="分类编号/分类名称">
								</div>
								<button type="submit" class="btn btn-default">搜索</button>
							</form>
						</div>
					</div>

					<div class="table-responsive">
						<table class="table table-striped table-bordered table table-hover table-condensed"
							   style="font-size: 18px;">
							<thead>
							<tr>
								<th></th>
								<th width="20%" style="text-align: center;">分类编号</th>
								<th width="20%" style="text-align: center;">分类名称</th>
								<th width="30%" style="text-align: center;">分类描述</th>
								<th width="30%" colspan="2" style="width: 60px;text-align: center;">操&nbsp;&nbsp;作</th>
							</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${pageInfo.list.size() > 0 }">
									<c:forEach items="${pageInfo.list}" var="category">
										<tr style="text-align: center;">
											<td>
												<input type="checkbox" value="${category.cid }" name="ids">
											</td>
											<td>${category.cid}</td>
											<td>${category.cname}</td>
											<td>${category.cexplain}</td>
											<td colspan="2" style="width: 60px;text-align:center">
												<a class="btn btn-info" href="${pageContext.request.contextPath}/updateCategoryForward?cid=${category.cid}">修改</a>&ensp;
												<a class="btn btn-danger" href="${pageContext.request.contextPath}/deleteCategory?cid=${category.cid}">删除</a>&ensp;
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" style="text-align: center; font-size: 20px;">查询的商品分类不存在！</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
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
								<li><a href="${pageContext.request.contextPath}/CategoryManage?page=1&size=${pageInfo.pageSize}&search=${search}" aria-label="Previous">首页</a></li>
								<li><a href="${pageContext.request.contextPath}/CategoryManage?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}&search=${search}">上一页</a></li>
								<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
									<li><a href="${pageContext.request.contextPath}/CategoryManage?page=${pageNum}&size=${pageInfo.pageSize}&search=${search}">${pageNum}</a></li>
								</c:forEach>
								<li><a href="${pageContext.request.contextPath}/CategoryManage?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}&search=${search}">下一页</a></li>
								<li><a href="${pageContext.request.contextPath}/CategoryManage?page=${pageInfo.pages}&size=${pageInfo.pageSize}&search=${search}" aria-label="Next">尾页</a></li>
							</ul>
						</div>
					</div>
					<!-- /.box-footer-->
				</div>
			</div><!-- 标题+搜索栏 -->
		</div><!-- <div class="container-fluid"> -->

		<!--添加分类 -->
		<form action="${pageContext.request.contextPath}/addCategory" id="form-AddCategory" method="post">
			<div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">添加分类</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-sm-12 col-md-12">
									<div class="form-group">
										<label>分类名称</label>
										<input type="text" class="form-control" name="cname" id="cname" placeholder="请输入分类名称">
									</div>
									<div class="form-group">
										<label>分类描述</label>
										<input type="text" class="form-control" name="cexplain" id="cexplain" placeholder="请输入分类描述">
									</div>
								</div>
							</div>
						</div><!-- <div class="modal-body"> -->
						<div class="modal-footer">
							<button type="submit" id="btn-submit" class="btn btn-primary">保存</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div>
		</form>

		<!-- 表单验证 -->
		<script type="text/javascript">
			$(function () {
				$("#form-AddCategory").bootstrapValidator({
					live: 'disabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
					excluded: [':disabled', ':hidden', ':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的
					submitButtons: '#btn-submit',//指定提交按钮，如果验证失败则变成disabled
					message: '通用的验证失败消息',//好像从来没出现过
					feedbackIcons: {//根据验证结果显示的各种图标
						valid: 'glyphicon glyphicon-ok',
						invalid: 'glyphicon glyphicon-remove',
						validating: 'glyphicon glyphicon-refresh'
					},
					fields: {
						cname: {
							validators: {
								notEmpty: {//检测非空,radio也可用
									message: '此处不能为空，请输入内容'
								}
							}
						},
						cexplain: {
							validators: {
								notEmpty: {//检测非空,radio也可用
									message: '此处不能为空，请输入内容'
								}
							}
						}
					}
				});
			});
		</script>

		<script type="text/javascript">
			function changePageSize() {
				// 获取下拉框的值
				var pageSize = $("#changePageSize").val();
				location.href = "${pageContext.request.contextPath}/CategoryManage?page=1&size=" + pageSize + "&search=${search}";
			}
		</script>
	</body>
</html>