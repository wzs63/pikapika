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

            <c:forEach items="${ videos }" var="video">
                <a class="video-common" href="/video/${video.getVideoId()}">
                    <div class="video-common-frame">
                        <div class="video-common-structure">
                            <img alt="common-video" src="file/${video.getVideoImg() }">
                        </div>

                        <div class="video-common-label">
                            <p>点击量: ${video.getVideoHits()}</p>
                            <p>名称: ${video.getVideoName()}</p>
                            <p>作者: ${video.getVideoAuthor()}</p>
                            <p>简述: ${video.getVideoIntro()}</p>
                        </div>
                    </div>
                </a>
                </c:forEach>

</div>
</body>
</html>
