<html>
<#include "common/header.ftl">

<body >
<div id="wrapper" class="toggled">

<#--边栏sidebar-->
    <#include "common/nav.ftl">
    <h1>订单列表</h1>


<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>订单号</th>
                            <th>用户名</th>
                            <th>收货人</th>
                            <th>收货人手机号</th>
                            <th>地址</th>
                            <th>金额</th>
                            <th>订单状态</th>
                            <th>创建时间</th>
                            <th>支付时间</th>
                            <th>发货时间</th>
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list orderlist.list as order>
                        <tr>
                            <td>${order.orderNo}</td>
                            <td>${order.userName}</td>
                            <td>${order.receiverName}</td>
                            <td>${order.shippingVo.receiverMobile}</td>
                            <td>${order.shippingVo.receiverProvince} ${order.shippingVo.receiverCity} ${order.shippingVo.receiverDistrict} ${order.shippingVo.receiverAddress}</td>
                            <td>${order.payment}</td>
                            <td>${order.statusDesc}</td>
                            <td>${order.createTime}</td>
                            <td>${order.paymentTime}</td>
                            <td>${order.sendTime}</td>
                            <td><a href="/user/order/detail?orderNo=${order.orderNo}">详情</a>
                            </td>
                            <#--<td>
                                <#if orderDTO.getOrderStatusEnum().message == "新订单">
                                    <a href="/sell/seller/order/cancel?orderId=${orderDTO.orderId}">取消</a>
                                </#if>
                            </td>-->
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>

            <#--分页-->
                <div class="col-md-12 column">
                    <ul class="pagination pull-right">
                    <#if orderlist.pageNum lte 1>
                        <li class="disabled"><a href="#">上一页</a></li>
                    <#else>
                        <li><a href="/user/order/list?pageNum=${orderlist.pageNum - 1}&pageSize=${orderlist.pageSize}">上一页</a></li>
                    </#if>

                    <#list 1..orderlist.pages as index>
                        <#if orderlist.pageNum == index>
                            <li class="disabled"><a href="#">${index}</a></li>
                        <#else>
                            <li><a href="/user/order/list?pageNum=${index}&pageSize=${orderlist.pageSize}">${index}</a></li>
                        </#if>
                    </#list>

                    <#if orderlist.pageNum gte orderlist.pages>
                        <li class="disabled"><a href="#">下一页</a></li>
                    <#else>
                        <li><a href="/user/order/list?pageNum=${orderlist.pageNum + 1}&pageSize=${orderlist.pageSize}">下一页</a></li>
                    </#if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>

<#--弹窗-->
<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">
                    提醒
                </h4>
            </div>
            <div class="modal-body">
                你有新的订单
            </div>
            <div class="modal-footer">
                <button onclick="javascript:document.getElementById('notice').pause()" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="location.reload()" type="button" class="btn btn-primary">查看新的订单</button>
            </div>
        </div>
    </div>
</div>

<#--播放音乐-->
<audio id="notice" loop="loop">
    <source src="/sell/mp3/song.mp3" type="audio/mpeg" />
</audio>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<#--<script>
    var websocket = null;
    if('WebSocket' in window) {
        websocket = new WebSocket('ws://sell.natapp4.cc/sell/webSocket');
    }else {
        alert('该浏览器不支持websocket!');
    }

    websocket.onopen = function (event) {
        console.log('建立连接');
    }

    websocket.onclose = function (event) {
        console.log('连接关闭');
    }

    websocket.onmessage = function (event) {
        console.log('收到消息:' + event.data)
        //弹窗提醒, 播放音乐
        $('#myModal').modal('show');

        document.getElementById('notice').play();
    }

    websocket.onerror = function () {
        alert('websocket通信发生错误！');
    }

    window.onbeforeunload = function () {
        websocket.close();
    }

</script>-->
<#--<script>
function _onload() {
    var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.open("GET","http://localhost:8080/order/list",true)
    xmlhttp.send()
    xmlhttp.onreadystatechange=function()
    {
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
            document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
        }
    }
}



</script>-->
</body>
</html>