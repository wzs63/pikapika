<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>主页</title>
</head>
<link rel="stylesheet" href="css/item.css" type="text/css"/>
<link rel="stylesheet" href="css/nav.css" type="text/css"/>
<script
        src="https://code.jquery.com/jquery-3.3.1.js">
</script>

<script type="text/javascript" src="js/nav.js"></script>
<body>
<jsp:include page="header.jsp"/>
<div class="scorll">
    <ul>
        <li class="target action" style="transform:translateX(0%)"><a href="video.html"><img src="image/h1.jpg"
                                                                                             alt="tupian"></a></li>
        <li class="target" style="transform:translateX(100%)"><a href="video.html"><img src="image/h2.jpg"
                                                                                        alt="tupian"></a></li>
        <li class="target" style="transform:translateX(200%)"><a href="video.html"><img src="image/h3.jpg"
                                                                                        alt="tupian"></a></li>
        <li class="target" style="transform:translateX(-200%)"><a href="video.html"><img src="image/h4.jpg"
                                                                                         alt="tupian"></a></li>
        <li class="target" style="transform:translateX(-100%)"><a href="video.html"><img src="image/h5.jpg"
                                                                                         alt="tupian"></a></li>
    </ul>
    <!--		上下翻页-->
    <div class="button left">&#8592</div>
    <div class="button right">&#8594</div>
    <ol>
        <li class="dot" style="background-color: #FF6E00"></li>
        <li class="dot"></li>
        <li class="dot"></li>
        <li class="dot"></li>
        <li class="dot"></li>
    </ol>
</div>
<div class="catalog">
    <a class="bar show" href="#dance">舞蹈</a>
    <a class="bar" href="#teach">教学</a>
    <a class="bar" href="#demon">鬼畜</a>
    <a class="bar" href="#anime">番剧</a>
    <a class="bar" href="#education">教育</a>
    <a class="bar" href="#Vlog">生活Vlog</a>
    <a class="bari" href="#"></a>
</div>
<div class="content">
    <ul class="content-nav-box">
        <li class="content-nav-li">
            <a href="#"><img alt="宝儿姐" src="image/baoer1.png"></a>
        </li>
        <li class="content-nav-li">
            <a href="#"><img alt="海贼王" src="image/haizei2.png"></a>
        </li>
        <li class="content-nav-li">
            <a href="#"><img alt="鬼灭之刃" src="image/guimie3.png"></a>
        </li>
        <li class="content-nav-li">
            <a href="#"><img alt="火影" src="image/huoying2.png"></a>
        </li>
    </ul>
    <div class="content-box">
        <a name="Vlog"></a>
        <div class="content-box-nav">
            <h2>生活Vlog</h2>
            <a href="#" class="count">
                <div class="count-all">全部</div>
                <div class="button1">&#8250</div>
            </a>
        </div>
        <div class="content-detail">
            <c:forEach items="${ videosOfVlog }" var="video">
                <a class="video-common" href="/video/${video.getVideoId()}">
                    <div class="video-common-frame">
                        <div class="video-common-structure">
                            <img alt="common-video" src="file/${video.getVideoImg() }">
                        </div>
                        <div class="video-common-cover"></div>
                        <div class="video-common-label">
                            <p>名称: ${video.getVideoName()}</p>
                            <p>作者: ${video.getVideoAuthor()}</p>
                            <p>简述: ${video.getVideoIntro()}</p>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
    <div class="content-box">
        <a name="Vlog"></a>
        <div class="content-box-nav">
            <h2>生活Vlog</h2>
            <a href="#" class="count">
                <div class="count-all">全部</div>
                <div class="button1">&#8250</div>
            </a>
        </div>
        <div class="content-detail">
            <c:forEach items="${ videosOfVlog }" var="video">
                <a class="video-common" href="/video/${video.getVideoId()}">
                    <div class="video-common-frame">
                        <div class="video-common-structure">
                            <img alt="common-video" src="file/${video.getVideoImg() }">
                        </div>
                        <div class="video-common-cover"></div>
                        <div class="video-common-label">
                            <p>名称: ${video.getVideoName()}</p>
                            <p>作者: ${video.getVideoAuthor()}</p>
                            <p>简述: ${video.getVideoIntro()}</p>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
    <div class="content-box">
        <a name="dance"></a>
        <div class="content-box-nav">
            <h2>舞蹈区</h2>
            <a href="#" class="count">
                <div class="count-all">全部</div>
                <div class="button1">&#8250</div>
            </a>
        </div>
        <div class="content-detail">
            <c:forEach items="${ videosOfwd }" var="video">
                <a class="video-common" href="/video/${video.getVideoId()}">
                    <div class="video-common-frame">
                        <div class="video-common-structure">
                            <img alt="common-video" src="file/${video.getVideoImg() }">
                        </div>
                        <div class="video-common-cover"></div>
                        <div class="video-common-label">
                            <p>名称: ${video.getVideoName()}</p>
                            <p>作者: ${video.getVideoAuthor()}</p>
                            <p>简述: ${video.getVideoIntro()}</p>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
    <div class="content-box">
        <a name="teach"></a>
        <div class="content-box-nav">
            <h2>教学区</h2>
            <a href="#" class="count">
                <div class="count-all">全部</div>
                <div class="button1">&#8250</div>
            </a>
        </div>
        <div class="content-detail">
            <c:forEach items="${ videosOfjx }" var="video">
                <a class="video-common" href="/video/${video.getVideoId()}">
                    <div class="video-common-frame">
                        <div class="video-common-structure">
                            <img alt="common-video" src="file/${video.getVideoImg() }">
                        </div>
                        <div class="video-common-cover"></div>
                        <div class="video-common-label">
                            <p>名称: ${video.getVideoName()}</p>
                            <p>作者: ${video.getVideoAuthor()}</p>
                            <p>简述: ${video.getVideoIntro()}</p>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
    <div class="content-box">
        <a name="demon"></a>
        <div class="content-box-nav">
            <h2>鬼畜区</h2>
            <a href="#" class="count">
                <div class="count-all">全部</div>
                <div class="button1">&#8250</div>
            </a>
        </div>

        <div class="content-detail">
            <c:forEach items="${ videosOfgc }" var="video">
                <a class="video-common" href="/video/${video.getVideoId()}">
                    <div class="video-common-frame">
                        <div class="video-common-structure">
                            <img alt="common-video" src="file/${video.getVideoImg() }">
                        </div>
                        <div class="video-common-cover"></div>
                        <div class="video-common-label">
                            <p>名称: ${video.getVideoName()}</p>
                            <p>作者: ${video.getVideoAuthor()}</p>
                            <p>简述: ${video.getVideoIntro()}</p>
                        </div>
                    </div>
                </a>
            </c:forEach>
            </div>
        </div>

    <div class="content-box">
        <a name="anime"></a>
        <div class="content-box-nav">
            <h2>番剧区</h2>
            <a href="#" class="count">
                <div class="count-all">全部</div>
                <div class="button1">&#8250</div>
            </a>
        </div>
        <div class="content-detail">
            <c:forEach items="${ videosOffj }" var="video">
                <a class="video-common" href="/video/${video.getVideoId()}">
                    <div class="video-common-frame">
                        <div class="video-common-structure">
                            <img alt="common-video" src="file/${video.getVideoImg() }">
                        </div>
                        <div class="video-common-cover"></div>
                        <div class="video-common-label">
                            <p>名称: ${video.getVideoName()}</p>
                            <p>作者: ${video.getVideoAuthor()}</p>
                            <p>简述: ${video.getVideoIntro()}</p>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
    <div class="content-box">
        <a name="education"></a>
        <div class="content-box-nav">
            <h2>教育区</h2>
            <a href="#" class="count">
                <div class="count-all">全部</div>
                <div class="button1">&#8250</div>
            </a>
        </div>
        <div class="content-detail">
            <c:forEach items="${ videosOfjy }" var="video">
                <a class="video-common" href="/video/${video.getVideoId()}">
                    <div class="video-common-frame">
                        <div class="video-common-structure">
                            <img alt="common-video" src="file/${video.getVideoImg() }">
                        </div>
                        <div class="video-common-cover"></div>
                        <div class="video-common-label">
                            <p>名称: ${video.getVideoName()}</p>
                            <p>作者: ${video.getVideoAuthor()}</p>
                            <p>简述: ${video.getVideoIntro()}</p>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>

</div>
</body>
<script type="text/javascript" src="js/item.js"></script>
<!--	<script type="text/javascript" src="main.js"></script>-->
</html>
