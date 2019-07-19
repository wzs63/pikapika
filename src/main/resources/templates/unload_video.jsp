<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>上传视频</title>
    <!--<i class="far fa-thumbs-up">点赞</i>
    <i class="fas fa-thumbs-up">点赞</i>
    <i class="far fa-tv">观看</i>
    <i class="fab fa-youtube"></i>
    <i class="fas fa-heart"></i>
    <i class="far fa-heart"></i>
    <i class="fas fa-comment-smile"></i>
    <i class="fal fa-search"></i>搜索
    -->
</head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link href="css/upload.css" rel="stylesheet">
<link href="css/nav.css" rel="stylesheet">
<script
        src="https://code.jquery.com/jquery-3.3.1.js">
</script>
<script type="text/javascript" src="js/nav.js"></script>
<script type="text/javascript" src="js/upload.js"></script>
<body>
<jsp:include page="header.jsp"/>
<div class="left-img">
    <img alt="图片" src="image/8fb2e1c55c097402e7d11656b6c938a4.jpeg">
</div>

<form id="form">
    <div class="up-cover">
        <div class="de fault-img"></div>
        <div class="up-cover-img">
            <input id="image_file" type="file" accept="image/png, image/jpeg, image/jpg" multiple="multiple"
                   class="up-img">
            <i class="fas fa-upload" id="up-img"></i>
        </div>
        <p>上传图片格式为 .jpg .png (废话)</p>
    </div>
    <div class="up-box">
        <div class="up-contenter">
            <div class="default-video">
                <i class="fas fa-file-video"></i>
            </div>
            <div class="up-video">
                <input id="video_file" type="file" accept="video/quicktime,video/x-mpeg2,video/x-msvideo"
                       multiple="multiple" class="up-file">
                <i class="fas fa-upload" id="up-video"></i>
            </div>
        </div>
        <div class="subarea">
            <h5>选择分区</h5>
            <div class="sub-area-btn">
                <input type="radio" id="contactChoice1"
                       name="video_type" value="舞蹈">
                <label for="contactChoice1">舞蹈</label>
                <input type="radio" id="contactChoice2"
                       name="video_type" value="教学">
                <label for="contactChoice2">教学</label>
                <input type="radio" id="contactChoice3"
                       name="video_type" value="教育">
                <label for="contactChoice3">教育</label>
                <input type="radio" id="contactChoice4"
                       name="video_type" value="鬼畜">
                <label for="contactChoice4">鬼畜</label>
                <input type="radio" id="contactChoice5"
                       name="video_type" value="番剧">
                <label for="contactChoice5">番剧</label>
                <input type="radio" id="contactChoice6"
                       name="video_type" value="Vlog">
                <label for="contactChoice6">Vlog</label>
            </div>
        </div>
        <div class="headline">
            <h5>稿件标题</h5>
            <input name="video_title" type="text" class="head-line" placeholder="请给视频起一个标题">
        </div>
        <div class="manuscript-commend">
            <h5>作品简介</h5>
            <textarea name="video_content" maxlength="233" placeholder="请简单介绍一下这个视频" class="commend-content"></textarea>
        </div>
        <div>
            <div class="protocol">
                <span id="agree"></span>
                <span class="text">我同意<a href="protocol.html" class="user-protocol">《PIKAPIKA使用协议》</a></span>
            </div>
        </div>
        <button id="manuscript-btn" type="submit">提交</button>
    </div>

</form>

<script>
    var form = $("#form")[0];
    form.addEventListener("submit", function (event) {
        console.log("submit_start");
        var image_file = $("#image_file")[0].files[0];
        var video_file = $("#video_file")[0].files[0];
        var formFile = new FormData();
        formFile.append("image_file", image_file);
        formFile.append("video_file", video_file);

        var data = new FormData(form);
        for (const entry of data) {
            formFile.append(entry[0], entry[1]);
        };

        for (const entry of data) {
            console.log(formFile.get(entry[0]));
        };
        console.log(formFile.get("image_file"));
        console.log(formFile.get("video_file"));
        //ajax异步传给后端数据
        $.ajax({
            async: true,
            type: "POST",
            url: "/addVideo_save.do",
            data: formFile,
            dataType: "json",
            cache: false,
            processData: false,

            contentType: false,
            success: function () {
                alert("上传完成");
                console.log('ok');
            },
            error: function () {
                console.log('nook');
            }
        });
        event.preventDefault();//??????
    }, false);

</script>
</body>
</html>
