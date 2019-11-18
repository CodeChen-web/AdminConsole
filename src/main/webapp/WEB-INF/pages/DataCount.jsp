<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- 全局样式-->
        <jsp:include page="AllStyle.jsp"/>

        <!-- 导入ECharts的js -->
        <script src="${pageContext.request.contextPath}/echarts/dist/echarts.min.js"></script>
    </head>
    <body>
        <!-- 顶部导航栏 -->
        <jsp:include page="TopMenu.jsp"/>

        <!-- 左侧菜单栏 -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-1 col-md-1 sidebar">
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="${pageContext.request.contextPath}/DataCount">数据统计 <span class="sr-only"></span></a></li>
                        <li><a href="" data-toggle="modal" data-target="#myModalUpdatePwd">密码修改</a></li>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li><a href="${pageContext.request.contextPath}/ProductManage">商品管理</a></li>
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
                    <h2 class="sub-header">
                        用户注册统计
                        <button id="tab1" class="btn btn-default" type="submit">
                            <span class="glyphicon glyphicon-refresh"></span>刷新
                        </button>
                    </h2>
                    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
                    <div id="tab1-container" style=" width: 600px; height: 500px; border: 1px solid #aaa"></div>
                </div>
                <div class="col-sm-11 col-sm-offset-1 col-md-11 col-md-offset-1 main">
                    <h2 class="sub-header">
                        商品统计
                        <button id="tab2" class="btn btn-default" type="submit">
                            <span class="glyphicon glyphicon-refresh"></span>刷新
                        </button>
                    </h2>
                    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
                    <div id="tab2-container" style=" width: 600px; height: 500px; border: 1px solid #aaa"></div>
                </div>

                <div class="col-sm-11 col-sm-offset-1 col-md-11 col-md-offset-1 main">
                    <h2 class="sub-header">
                        订单统计
                        <button id="tab3" class="btn btn-default" type="submit">
                            <span class="glyphicon glyphicon-refresh"></span>刷新
                        </button>
                    </h2>
                    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
                    <div id="tab3-container" style=" width: 1000px; height: 500px; border: 1px solid #aaa"></div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            var $tab1 = document.getElementById('tab1-container');
            var $tab3 = document.getElementById('tab3-container');

            /* 用户统计-条形图 */
            var tab1Option = {
                color: ['#3398DB'],
                tooltip: {
                    trigger: 'axis',
                    axisPointer: { // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: [{
                    type: 'category',
                    data: [],
                    axisTick: {
                        alignWithLabel: true
                    }
                }],
                yAxis: [{
                    type: 'value'
                }],
                series: [{
                    name: '用户注册',
                    type: 'bar',
                    barWidth: '60%',
                    data: []
                }]
            };

            /* 初始化tab2 */
            /* 商品统计-饼图 */
            var tab2Table = echarts.init(document.getElementById('tab2-container'));
            tab2Table.setOption({
                title: {
                    text: '商品信息与分类统计图',
                    subtext: 'Atlantis',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: []
                },
                series: [{
                    name: '商品数量',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '60%'],
                    data: [],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }]
            });

            tab2Table.showLoading();    //数据加载完之前先显示一段简单的loading动画
            var names = [];    //类别数组（用于存放饼图的类别）
            var brower = [];
            // 异步加载数据
            $("#tab2").click(function () {
                $.ajax({
                    url:"productAjax",
                    type:"post",
                    contentType:"application/json;charset=UTF-8",
                    dataType:"json",
                    success:function (data) {
                        //请求成功时执行该函数内容，data即为服务器返回的json对象
                        $.each(data.list, function (index, item) {
                            //挨个取出类别并填入类别数组
                            names.push(item.department);
                            brower.push({
                                name: item.department,
                                value: item.num
                            });
                        });

                        tab2Table.hideLoading();//隐藏加载动画
                        //加载数据图表
                        tab2Table.setOption({
                            legend: {
                                data: names
                            },
                            series: [{
                                data: brower
                            }]
                        });
                    }
                });
            });

            /* 堆叠区域图 - 订单统计 */
            // 异步加载数据
            $("#tab3").click(function () {
                $.ajax({
                    url:"orderAjax",
                    type:"post",
                    contentType:"application/json;charset=UTF-8",
                    dataType:"json",
                    success:function (data) {
                        // 填入数据
                        /* console.log(data); */
                        var tab3xAxisData = data.xAxisData
                        var tab3SeriesDataList = data.seriesDataList

                        var tab3Series = [{
                            name: '未完成订单',
                            type: 'line',
                            stack: '总量',
                            areaStyle: {},
                            data: tab3SeriesDataList[0]
                        }, {
                            name: '取消订单',
                            type: 'line',
                            stack: '总量',
                            areaStyle: {},
                            data: tab3SeriesDataList[1]
                        }, {
                            name: '完成订单',
                            type: 'line',
                            stack: '总量',
                            areaStyle: {},
                            data: tab3SeriesDataList[2]
                        }, {
                            name: '订单总数',
                            type: 'line',
                            stack: '总量',
                            areaStyle: {
                                normal: {}
                            },
                            data: tab3SeriesDataList[3]
                        }, {
                            name: '订单总额',
                            type: 'line',
                            stack: '总价',
                            label: {
                                normal: {
                                    show: true,
                                    position: 'top'
                                }
                            },
                            areaStyle: {
                                normal: {}
                            },
                            data: tab3SeriesDataList[4]
                        }]

                        /* 加载图表 */
                        var tab3Option = {
                            title: {
                                text: '堆叠区域图'
                            },
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'cross',
                                    label: {
                                        backgroundColor: '#6a7985'
                                    }
                                }
                            },
                            legend: {
                                data: ['未完成订单', '取消订单', '完成订单', '订单总数', '订单总额']
                            },
                            toolbox: {
                                feature: {
                                    saveAsImage: {}
                                }
                            },
                            grid: {
                                left: '3%',
                                right: '4%',
                                bottom: '3%',
                                containLabel: true
                            },
                            xAxis: [{
                                type: 'category',
                                boundaryGap: false,
                                data: tab3xAxisData
                            }],
                            yAxis: [{
                                type: 'value'
                            }],
                            series: tab3Series
                        };

                        tab3Table.setOption(tab3Option);
                    }
                });
            });


            /* 初始化tab1的 */
            var tab1Table = echarts.init($tab1);
            tab1Table.setOption(tab1Option);

            /* 初始化tab3的 */
            var tab3Table = echarts.init($tab3);

            // 异步加载数据
            $("#tab1").click(function () {
                $.ajax({
                    url:"userAjax",
                    type:"post",
                    contentType:"application/json;charset=UTF-8",
                    dataType:"json",
                    success:function (data) {
                        // 填入数据
                        tab1Table.setOption({
                            xAxis: {
                                data: data.xAxisData
                            },
                            series: [{
                                // 根据名字对应到相应的系列
                                name: '注册数量',
                                data: data.seriesData
                            }]
                        });
                    }
                });
            });
        </script>
    </body>
</html>