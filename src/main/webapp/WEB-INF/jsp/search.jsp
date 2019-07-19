<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>排行榜</title>
</head>
<link href="/css/nav.css" rel="stylesheet">
<link href="/css/top.css" rel="stylesheet">
<script
        src="https://code.jquery.com/jquery-3.3.1.js">
</script>
<script type="text/javascript" src="/js/nav.js"></script>
<script type="text/javascript" src="/js/top.js"></script>
<body>
<jsp:include page="header.jsp"/>
<div class="frame">
    <div class="video">
        <div class="labble">
            <div id="video" class="labble-option">视频</div>
            <div id="user" class="labble-option">用户</div>
        </div>

        <div class="video-common">
            <c:forEach items="${ videos }" var="video">
            <a class="video-common" href="/video/${video.getVideoId()}">
            <div class="video-common-frame">
                <div class="video-common-structure">
                    <img alt="common-video" src="file/${video.getVideoImg() }">
                </div>

                <div class="video-common-label">
                    <p>${video.getVideoName()}</p>
                    <p>${video.getVideoAuthor()}</p>
                    <p>${video.getVideoIntro()}</p>
                </div>
            </div>
                </c:forEach>
        </div>

    </div>


    <div class="user-box">

        <div class="user-frame">
            <c:forEach items="${ users }" var="user">
            <div class="user-information">
                <a href="/person/${ user.getUserName() }" >
                    <div class="user-image"><img alt="头像" src="/file/${ user.getUserImg() }"></div>
                        <div class="user-name">
                            <p>${ user.getUserName() }</p>
                            <p>132</p>
                        </div>
                </a>
            </div>
            </c:forEach>
        </div>

    </div>

</div>


</body>
</html>
