
<html>
<#include "common/header.ftl">
<body>



<div id="wrapper" class="toggled">

<#--边栏sidebar-->
<#include "common/nav.ftl">
    <h1>修改用户</h1>
<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <form role="form" method="post" action="">
                        <div class="form-group">
                            <input name="id" type="hidden" value="${userinfo.id}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input name="password" type="hidden" value="${userinfo.password}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input name="role" type="hidden" value="${userinfo.role}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <input name="ip" type="hidden" value="${userinfo.ip}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>用户名</label>
                            <input name="username" type="text" value="${userinfo.username}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>邮箱</label>
                            <input name="email" type="text" value="${userinfo.email}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>手机</label>
                            <input name="phone" type="text" value="${userinfo.phone}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>问题</label>
                            <input name="question" type="text" value="${userinfo.question}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>答案</label>
                            <input name="answer" type="text" value="${userinfo.answer}" class="form-control"/>
                        </div>
                        <button type="submit" class="btn btn-default">保存</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>
