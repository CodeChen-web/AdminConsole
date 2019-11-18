<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<h2 class="sub-header">修改名称</h2>
					<div class="row">
						<div class="col-sm-11 col-md-11">
							<form action="${pageContext.request.contextPath}/updateCategory" method="post">
								<div class="form-group">
									<label>分类编号</label>
									<input type="text" class="form-control" name="cid" id="cid" value="${category.cid}">
								</div>
								<div class="form-group">
									<label>分类名称</label>
									<input type="text" class="form-control" name="cname" id="cname" value="${category.cname}" placeholder="请输入分类名称">
								</div>
								<div class="form-group">
									<label>分类描述</label>
									<input type="text" class="form-control" name="cexplain" id="cexplain" value="${category.cexplain}" placeholder="请输入分类描述">
								</div>
								<button type="submit" class="btn btn-default">保存</button>
								<a href="javascript:history.back(1)" class="btn btn-default">取消</a>
							</form>
						</div>
					</div>
				</div>
			</div><!-- 标题+搜索栏 -->
		</div><!-- <div class="container-fluid"> -->
	</body>
</html>