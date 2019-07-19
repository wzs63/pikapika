<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>视频播放</title>
</head>
<link rel="stylesheet" href="css/nav.css" type="text/css"/>
<link rel="stylesheet" href="css/video.css" type="text/css"/>
<script
        src="https://code.jquery.com/jquery-3.3.1.js">
</script>
<style>
    .comments {
        width: 490px;
        margin: 21px 0;
        //border-top: 2px solid lightgrey ;
    }

    /* line 331, /var/www/prod/v2.toutiao.io/app/assets/stylesheets/application.scss */
    .comments .media {
        margin: 10px ;
        border-bottom: 1px solid #f0f0f0;
        padding-bottom: 5px;

    }

    /* line 333, /var/www/prod/v2.toutiao.io/app/assets/stylesheets/application.scss */
    .comments .media h4 {
        font-size: 14px;

    }

    /* line 339, /var/www/prod/v2.toutiao.io/app/assets/stylesheets/application.scss */
    .comments .media .media-left img {
        width: 48px;
        height: 48px;
        float: left;
    }

    /* line 345, /var/www/prod/v2.toutiao.io/app/assets/stylesheets/application.scss */
    .comments .media:last-child {
        border-bottom: none;
    }
    .comments .media .media-body{
        margin-top: 20px;
        margin-left: 50px;
    }
    .fb_bu {
        width: 65px;
        height: 64px;
        border-radius: 5px;
        border: darkgray;
        margin-left: 10px;
    }
    .comment_text{
        width: 420px;
        height: 59px;
        border-radius: 5px;
        float: left;
    }
    .info{
        color: #9999aa;
        line-height: 26px;
        font-size: 12px;
    }

</style>
<link rel="stylesheet" href="/css/nav.css" type="text/css" />
<link rel="stylesheet" href="/css/video.css" type="text/css" />
<script
        src="https://code.jquery.com/jquery-3.3.1.js">
</script>
<script type="text/javascript" src="/js/video.js"></script>
<script type="text/javascript" src="/js/nav.js"></script>

<body>
<jsp:include page="header.jsp"/>
<div class="headline"><img alt="广告" src="image/h4.jpg"></div>
<div class="player">
    <div class="player-nav">
        <div class="player-nav-synopsis">
            <h2>${ video.getVideoName() }</h2>
            <div class="player-nav-intro">
                <a href="#" class="intro-sort">${ video.getVideoType()}|</a>
                <span class="intro-area">作者:${ video.getVideoAuthor()}</span>
                <h6> 点击量:${ video.getVideoHits()}</h6>
                <h6> 发布时间:<fmt:formatDate value="${ video.getVideoDate()}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></h6>
            </div>
        </div>
        <a class="ad">
            <div class="ad-img"></div>
            <div class="ad-content">开通VIP</div>
        </a>
    </div>
    <div class="background">
        <div class="player-module">
            <div class="player-detail">
                <video id="player" src="/file/${ video.getVideoUrl() }" controls></video>
                <div id="player-control"></div>
                <div class="player-content">
                    <div class="video-recommend" style="width: 580px">
                        <div class="video-recommend-frame">

                            <div class="heart-box">
                                <div class="heart">
                                    <c:if test="${status == 0}">
                                        <div class="left"></div>
                                        <div class="middle"></div>
                                        <div class="right"></div>
                                    </c:if>
                                    <c:if test="${status == 1}">
                                        <div class="left heart-show"></div>
                                        <div class="middle heart-show"></div>
                                        <div class="right heart-show"></div>
                                    </c:if>
                                </div>
                                <div id = "likeCount"> ${ video.getLikeCount() } </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


<div>
    <form action="/addComment/${videoId} " method="post">
        <textarea name=commentContent class="comment_text"></textarea>
        <button class = "fb_bu">发 表<br>评 论</button>
    </form>
</div>

<div id="comments" class="comments">
    <!-- #foreach($commentvo in $comments) -->
    <div class="media">
        <a class="media-left" href="/user/$!{commentvo.user.id}">
            <img src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1540585939,4136794415&fm=26&gp=0.jpg">
        </a>
        <a>keaaa</a>
        <div >
            <text name=commentContent2 class="media-body"> 123123123123</text>
        </div>
        <div class="info">
            <span class="time">1999-9-9</span>
        </div>
    </div>
</div>
<div id="comments" class="comments">
    <!-- #foreach($commentvo in $comments) -->
    <div class="media">
        <a class="media-left" href="/user/$!{commentvo.user.id}">
            <img src="http://img0.imgtn.bdimg.com/it/u=2637120468,493493088&fm=26&gp=0.jpg">
        </a> 妙蛙种子 ：
        <div class="media-body">

            <div>我是来凑评论的，还有我不是蒜头王八</div>
        </div>
    </div>
    <!-- #end -->
</div>


<div id="comments" class="comments">
    <c:forEach items="${ comments }" var="comment">
        <div class="media">
            <a class="media-left" href="/user/$!{commentvo.user.id}">
                <img src="/file/${ comment.getCommentUserImg() }">
            </a> ${ comment.getCommentUser() } ：
            <div class="media-body">

                <div> ${ comment.getCommentContent() } </div>
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
