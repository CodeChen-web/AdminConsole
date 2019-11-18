<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<h2 class="sub-header">修改商品</h2>
					<div class="row">
						<div class="col-sm-12 col-md-12">
							<form action="${pageContext.request.contextPath}/updateProduct" id="form-UpdateProduct" role="form" enctype="multipart/form-data" method="post">
								<div class="form-group">
									<label>商品ID</label>
									<input type="text" readonly="readonly" class="form-control" name="pid" id="pid" value="${product.pid}">
								</div>
								<div class="form-group">
									<label>商品名称</label>
									<input type="text" class="form-control" name="pname" id="pname" value="${product.pname}" placeholder="请输入商品名称">
								</div>
								<div class="form-group">
									<label>商品价格</label>
									<input type="text" class="form-control" name="pprice" id="pprice" value="${product.pprice}" placeholder="请输入商品价格">
								</div>
								<div class="form-group">
									<label>商品库存</label>
									<input type="number" class="form-control" name="pnum" id="pnum" value="${product.pnum}" placeholder="请输入商品库存，数据为整数且大于0">
								</div>
								<div class="form-group">
									<label>商品简介</label>
									<input type="text" class="form-control" name="pexplain" value="${product.pexplain}" id="pexplain">
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
									<!-- 旧商品图片-隐藏 -->
									<input type="hidden" name="oldImg" value="${product.img}"/>
									
									<img alt="" class="img-thumbnail" id="newFile" src="${pageContext.request.contextPath}/images/${product.img}">
									<input type="file" name="file" id="file" onchange="showImg(this)" />
								</div>
								<button type="submit" id="btn-submit" class="btn btn-default">保存</button>
								<a href="javascript:history.back(1)" class="btn btn-default">取消</a>
							</form>
						</div>
					</div>
				</div>
			</div><!-- 标题+搜索栏 -->
		</div><!-- <div class="container-fluid"> -->
		
		<!-- 表单验证 -->
		<script type="text/javascript">
			$(function () {
			    $("#form-UpdateProduct").bootstrapValidator({
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
			/* 商品详情 */
			document.getElementById("pdetails").value="${product.pdetails}";
			
			/* 上传图片预览 */
			function showImg(file) {
				var rd = new FileReader();//创建文件读取对象
		        var files = file.files[0];//获取file组件中的文件
		        rd.readAsDataURL(files);//文件读取装换为base64类型
		        rd.onloadend = function(e) {
		            //加载完毕之后获取结果赋值给img
		            document.getElementById("newFile").src = this.result;
		        }
			}
		</script>
	</body>
</html>