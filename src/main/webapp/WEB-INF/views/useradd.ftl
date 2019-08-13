
<html>
<#include "common/header.ftl">

<body>

<h1>添加用户</h1>

<div id="wrapper" class="toggled">

<#--边栏sidebar-->
<#include "common/nav.ftl">

<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <form role="form" method="post" action="">
                        <div class="form-group">
                            <label>用户名</label>
                            <input name="username" type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input name="password" type="password" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>邮箱</label>
                            <input name="email" type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>手机</label>
                            <input name="phone" type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>问题</label>
                            <input name="question" type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>答案</label>
                            <input name="answer" type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <input name="role" type="hidden" class="form-control" value="0"/>
                        </div>
                        <button type="submit" class="btn btn-default">提交</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>
