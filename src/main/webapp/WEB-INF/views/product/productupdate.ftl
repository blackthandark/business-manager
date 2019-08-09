
<html>
<#include "common/header.ftl">
<body>
<div id="wrapper" class="toggled">

<#--边栏sidebar-->
<#include "common/nav.ftl">
    <h1>修改类别</h1>
<#--主要内容content-->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <form role="form" method="post" action="" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${product.id}" class="form-control">
                        <div class="form-group">
                            <label>类别</label>
                            <select name="categoryId" class="form-control">
                                <option value="${category.id}" selected:disabled style="display: none">${category.name}</option>
                            <#list categorylist as categorylist>
                                <option value="${categorylist.id}">${categorylist.name}</option>
                            </#list>
                            </select><br/>
                        </div>
                        <div class="form-group">
                            <label>商品名称</label>
                            <input name="name" type="text" value="${product.name}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>商品副标题</label>
                            <input name="subtitle" type="text" value="${product.subtitle}" class="form-control"/>
                        </div>

                        <div class="form-group">
                            <label>图片</label>
                            <input id="productIcon" name="productIcon" type="text" hidden="hidden" value="${(productInfo.productIcon)!''}"/>
                            <div class="file-loading">
                                <input name="images" id="input-id" type="file" multiple="multiple">
                                <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过1M</p>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>商品详情</label>
                            <input name="detail" type="text" value="${product.detail}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>价格</label>
                            <input name="price" type="text" value="${product.price}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>库存数量</label>
                            <input name="stock" type="text" value="${product.stock}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label>商品状态</label>
                            <input name="status" type="text" value="${product.status}" class="form-control"/>
                        </div>
                        <button type="submit" class="btn btn-default">确认</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-fileinput/4.4.8/js/fileinput.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-fileinput/4.4.8/js/locales/zh.min.js"></script>
<script>

    $(function () {
        var initialPreview = [];
        if ('${(productInfo.productIcon)!""}' != '') {
            initialPreview = "<img class='kv-preview-data file-preview-image' src='${(productInfo.productIcon)!""}'>"
        }

        $("#input-id").fileinput({
            uploadUrl: '/sell/image/upload',
            language: 'zh',
            browseClass: "btn btn-primary btn-block",
            showCaption: false,
            showRemove: false,
            showUpload: false,
            showBrowse: true,
            dropZoneEnabled: false,
            enctype: 'multipart/form-data',
            allowedFileExtensions: [ 'jpg', 'jpeg', 'png', 'gif' ],
            maxFileSize: 1024,
            autoReplace: true,
            overwriteInitial: true,
            maxFileCount: 0,
            initialPreview: initialPreview,
        });
    });
    //上传完成设置表单内容
    $('#input-id').on('fileuploaded', function(event, data, previewId, index) {
        if (data.response.code != 0) {
            alert(data.response.msg)
            return
        }
        $('#productIcon').val(data.response.data.fileName)
    });
</script>
</body>
</html>
