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
						<li class="active"><a href="${pageContext.request.contextPath}/ProductManage">商品管理</a></li>
						<li><a href="${pageContext.request.contextPath}/CategoryManage">分类管理</a></li>
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
					<h2 class="sub-header">商品管理</h2>
					<div class="row">
						<div class="col-sm-12 col-md-12" align="center">
							<form class="navbar-form navbar-center" role="search" action="${pageContext.request.contextPath}/ProductManage">
								<div class="form-group">
									<button type="button" class="btn btn-primary" data-toggle="modal"
											data-target="#myModalAdd"
											style="margin-right: 20px;">添加商品
									</button>
									<input type="text" id="search" name="search" value="${search}"
										   class="form-control" placeholder="商品名称/商品分类">
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
								<th width="10%" style="text-align: center;">ID编号</th>
								<th width="10%" style="text-align: center;">商品图片</th>
								<th width="15%" style="text-align: center;">商品名称</th>
								<th width="10%" style="text-align: center;">商品价格</th>
								<th width="10%" style="text-align: center;">商品库存</th>
								<th width="15%" style="text-align: center;">商品日期</th>
								<th width="10%" style="text-align: center;">商品类别</th>
								<th width="20%" colspan="3" style="width: 90px;text-align: center;">操&nbsp;&nbsp;作</th>
							</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${pageInfo.list.size() > 0 }">
									<c:forEach items="${pageInfo.list}" var="products">
										<tr style="text-align: center;">
											<td>
												<input type="checkbox" value="${products.pid }" name="ids">
											</td>
											<td>${products.pid}</td>
											<td>
												<c:if test="${products.img==null}">
													无
												</c:if>
												<c:if test="${products.img!=null}">
													<img src="${pageContext.request.contextPath}/images/${products.img}"
														 style="width: 60px; height: 60px;" class="img-thumbnail"/>
												</c:if>
											</td>
											<td>${products.pname}</td>
											<td>${products.pprice}</td>
											<td>${products.pnum}</td>
											<td>${products.pdatestr}</td>
											<td>${products.category.cname}</td>
											<td colspan="3" style="width: 90px;text-align:center">
												<a ${products.flag eq 0?'class="btn btn-warning"':'class="btn btn-success"'}
														onclick="changeFlag(${products.pid},${products.flag})">
														${products.flag eq 0?'下架':'上架'}
												</a>&ensp;
												<a class="btn btn-info" href="updateProductForward?pid=${products.pid}">修改</a>&ensp;
												<a class="btn btn-danger" onclick="deleteProduct(${products.pid})">删除</a>&ensp;
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="9" style="text-align: center; font-size: 20px;">查询的商品信息不存在！</td>
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
								<li><a href="${pageContext.request.contextPath}/ProductManage?page=1&size=${pageInfo.pageSize}&search=${search}" aria-label="Previous">首页</a></li>
								<li><a href="${pageContext.request.contextPath}/ProductManage?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}&search=${search}">上一页</a></li>
								<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
									<li><a href="${pageContext.request.contextPath}/ProductManage?page=${pageNum}&size=${pageInfo.pageSize}&search=${search}">${pageNum}</a></li>
								</c:forEach>
								<li><a href="${pageContext.request.contextPath}/ProductManage?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}&search=${search}">下一页</a></li>
								<li><a href="${pageContext.request.contextPath}/ProductManage?page=${pageInfo.pages}&size=${pageInfo.pageSize}&search=${search}" aria-label="Next">尾页</a></li>
							</ul>
						</div>
					</div>
					<!-- /.box-footer-->

				</div>
			</div><!-- 标题+搜索栏 -->
		</div><!-- <div class="container-fluid"> -->

		<!-- 模态框 添加商品 -->
		<form action="${pageContext.request.contextPath}/AddProduct" id="form-AddProduct" role="form" enctype="multipart/form-data" method="post">
			<div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog"
				 aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">添加商品</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-sm-12 col-md-12">
									<div class="form-group">
										<label>商品名称</label>
										<input type="text" class="form-control" name="pname" id="pname"
											   placeholder="请输入商品名称">
									</div>
									<div class="form-group">
										<label>商品价格</label>
										<input type="text" class="form-control" name="pprice" id="pprice"
											   placeholder="请输入商品价格">
									</div>
									<div class="form-group">
										<label>商品库存</label>
										<input type="number" class="form-control" name="pnum" id="pnum"
											   placeholder="请输入商品库存，数据为整数且大于0">
									</div>
									<div class="form-group">
										<label>商品简介</label>
										<input type="text" class="form-control" name="pexplain" id="pexplain">
									</div>
									<div class="form-group">
										<label>商品详情</label>
										<textarea class="form-control" rows="3" name="pdetails" id="pdetails"></textarea>

									</div>
									<div class="form-group">
										<label>商品分类</label>
										<select class="form-control" name="cid">
											<c:forEach items="${allCategory}" var="list">
												<option value="${list.cid}">${list.cname}</option>
											</c:forEach>
										</select>
									</div>

									<div class="form-group">
										<label>商品图片(上传图片大小不可超过10MB)</label><br>
										<img alt="" class="img-thumbnail" id="newFile" src="${pageContext.request.contextPath}/images/${product.img}">
										<input type="file" name="file" id="file" onchange="showImg(this)"/>
									</div>
								</div>
							</div>
						</div><!-- <div class="modal-body"> -->
						<div class="modal-footer">
							<button type="submit" id="btn-submit" class="btn btn-primary">保存</button>&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div>
		</form>

		<!-- 表单验证 -->
		<script type="text/javascript">
			$(function () {
				$("#form-AddProduct").bootstrapValidator({
					live: 'disabled',//验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
					excluded: [':disabled', ':hidden', ':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的
					submitButtons: '#btn-submit',//指定提交按钮，如果验证失败则变成disabled，但我没试成功，反而加了这句话非submit按钮也会提交到action指定页面
					message: '通用的验证失败消息',//好像从来没出现过
					feedbackIcons: {//根据验证结果显示的各种图标
						valid: 'glyphicon glyphicon-ok',
						invalid: 'glyphicon glyphicon-remove',
						validating: 'glyphicon glyphicon-refresh'
					},
					fields: {
						pname: {
							validators: {
								notEmpty: {//检测非空,radio也可用
									message: '此处不能为空，请输入内容'
								},
								regexp: {//正则验证
									regexp: /^[\u4E00-\u9FA5A-Za-z0-9_]+$/,
									message: '名称格式错误。只允许中文、英文、数字包括下划线'
								}
							}
						},
						pprice: {
							validators: {
								notEmpty: {//检测非空,radio也可用
									message: '此处不能为空，请输入内容'
								},
								regexp: {//正则验证
									regexp: /^[0-9]+(.[0-9]{1,2})?$/,
									message: '价格格式错误。只允许带最多两位小数的正实数'
								}
							}

						},
						pnum: {
							validators: {
								notEmpty: {//检测非空,radio也可用
									message: '此处不能为空，请输入内容'
								},
								regexp: {//正则验证
									regexp: /^(0|[1-9][0-9]*)$/,
									message: '库存格式错误。只允许0或非0的数字、不能为负数'
								}
							}
						},
						file: {
							validators: {
								notEmpty: {//检测非空,radio也可用
									message: '此处不能为空，请输入内容'
								},
								file: {
									extension: 'png,jpg,jpeg',
									type: 'image/png,image/jpg,image/jpeg',
									message: '图片格式不为png,jpg,jpeg，请重新选择图片'
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
				location.href = "${pageContext.request.contextPath}/ProductManage?page=1&size=" + pageSize + "&search=${search}";
			}
		</script>

		<script type="text/javascript">
			var page = "${pageInfo.pageNum}";
			var size = "${pageInfo.pageSize}";

			/* 上传图片预览 */
			function showImg(file) {
				var rd = new FileReader();//创建文件读取对象
				var files = file.files[0];//获取file组件中的文件
				rd.readAsDataURL(files);//文件读取装换为base64类型
				rd.onloadend = function (e) {
					//加载完毕之后获取结果赋值给img
					document.getElementById("newFile").src = this.result;
				}
			}

			/*上下架商品*/
			function changeFlag(pid, flag) {
				location.href = "${pageContext.request.contextPath}/operateProduct?page=" + page
						+ "&size=" + size + "&pid=" + pid
						+ "&flag=" + flag + "&search=" + $(":text[name='search']").val();
			}

			/*商品-删除*/
			function deleteProduct(pid) {
				if (confirm("是否确认删除此商品？")) {
					location.href = "${pageContext.request.contextPath}/deleteProduct?page=" + page
							+"&size=" + size + "&pid=" + pid
							+ "&search=" + $(":text[name='search']").val();
				}
			}
		</script>
		<!--/请在上方写此页面业务相关的脚本-->
	</body>
</html>