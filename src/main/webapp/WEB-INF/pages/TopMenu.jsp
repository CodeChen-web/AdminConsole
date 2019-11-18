<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 顶部导航栏 -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/AdminHome">AdminConsole</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-left">
                <li>
                    <p class="navbar-text" style="margin-left: 18px;">
                        <c:if test="${!empty currentAdmin}">
                            欢迎您， 超级管理员[${currentAdmin.aname}]
                        </c:if>
                    </p>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">&nbsp;更多管理
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/ProductManage">商品管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/CategoryManage">分类管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/OrderManage">订单管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/UserManage">用户管理</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/">数据统计</a></li>
                        <li><a href="" data-toggle="modal" data-target="#myModalUpdatePwd">密码修改</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="${pageContext.request.contextPath}/logout">
                        <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;安全退出</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- 模态框 修改密码 -->
<form action="${pageContext.request.contextPath}/updatePassword" method="post" role="form" id="form-UpdatePwd">
    <div class="modal fade" id="myModalUpdatePwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改密码</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label for="exampleInputEmail1">管理员账号</label>
                                <input type="text" name="aname" class="form-control" id="exampleInputEmail1"
                                       value="${currentAdmin.aname}">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">旧密码</label>
                                <input type="password" name="apassword" class="form-control" id="exampleInputPassword1"
                                       placeholder="请输入旧密码...">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">新密码</label>
                                <input type="password" name="newpwd" class="form-control" id="newpwd"
                                       placeholder="请输入新密码...">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">确认密码</label>
                                <input type="password" name="rnewpwd" class="form-control" id="rnewpwd"
                                       placeholder="确认新密码...">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" id="btn-submit" class="btn btn-primary">保存</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">
    $(function () {
        $("#form-UpdatePwd").bootstrapValidator({
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
                apassword: {
                    validators: {
                        notEmpty: {//检测非空,radio也可用
                            message: '此处不能为空，请输入内容'
                        },
                        regexp: {//正则验证
                            regexp: /^[a-zA-Z]\w{3,7}$/,
                            message: '密码格式错误。只允许以字母开头，长度在为3~7且包含字母或数字'
                        }
                    }
                },
                newpwd: {
                    validators: {
                        notEmpty: {//检测非空,radio也可用
                            message: '此处不能为空，请输入内容'
                        },
                        regexp: {//正则验证
                            regexp: /^[a-zA-Z]\w{3,7}$/,
                            message: '密码格式错误。只允许以字母开头，长度在为3~7且包含字母或数字'
                        }
                    }
                },
                rnewpwd: {
                    validators: {
                        notEmpty: {//检测非空,radio也可用
                            message: '此处不能为空，请输入内容'
                        },
                        identical: {//与指定控件内容比较是否相同，比如两次密码不一致
                            field: 'newpwd',//指定控件name
                            message: '两次密码不一致，请重新输入'
                        },
                        regexp: {//正则验证
                            regexp: /^[a-zA-Z]\w{3,7}$/,
                            message: '密码格式错误。只允许以字母开头，长度在为3~7且包含字母或数字'
                        }
                    }
                }
            }
        });
    });
</script>

<!-- 用户名和密码输入错误提示框 -->
<%
    String errorInfo = (String) request.getAttribute("error"); //获取错误属性
    if (errorInfo != null) {
%>
<script type="text/javascript">
    alert("<%=errorInfo%>");
</script>
<%
    }
%>

