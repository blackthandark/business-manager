<html>
<#include  "common/header.ftl">
<body>
<div id="wrapper" class="toggled">

<#--边栏sidebar-->
<#include "common/nav.ftl">
<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-bordered table-condensed">
                        <thead>
                        <tr>
                        <th>用户ID</th>
                        <th>用户名</th>
                        <th>邮箱</th>
                        <th>手机</th>
                        <th>问题</th>
                        <th>答案</th>
                        <th>权限</th>
                        <th>创建时间</th>
                        <th>修改时间</th>
                        </tr>
                        </thead>
                        <tbody>

                        <#list userlist as userlist>
                        <tr>
                            <th>${userlist.id}</th>
                            <th>${userlist.username}</th>
                            <th>${userlist.email}</th>
                            <th>${userlist.phone}</th>
                            <th>${userlist.question}</th>
                            <th>${userlist.answer}</th>
                            <th>${userlist.role}</th>
                            <th>${userlist.createTime?string('yyyy-MM-dd HH:mm:ss')}</th>
                            <th>${userlist.updateTime?string('yyyy-MM-dd HH:mm:ss')}</th>
                        </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
