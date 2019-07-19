<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>llllllllltttttererererererererreeeeeer</title>

    <link rel="stylesheet" type="text/css" href="../styles/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../styles/font-awesome.min.css">

    <link rel="stylesheet" media="all" href="../styles/style.css">
    <script type="text/javascript" src="/scripts/jquery.js"></script>
    <script type="text/javascript" src="/scripts/main/base/base.js"></script>
    <script type="text/javascript" src="/scripts/main/base/util.js"></script>
    <script type="text/javascript" src="/scripts/main/base/event.js"></script>
    <script type="text/javascript" src="/scripts/main/base/upload.js"></script>
    <script type="text/javascript" src="/scripts/main/component/component.js"></script>
    <script type="text/javascript" src="/scripts/main/component/popup.js"></script>
    <script type="text/javascript" src="/scripts/main/component/popupLogin.js"></script>
    <script type="text/javascript" src="/scripts/main/component/upload.js"></script>
    <script type="text/javascript" src="/scripts/main/component/popupUpload.js"></script>
    <script type="text/javascript" src="/scripts/main/util/action.js"></script>
<style>
    .imageTX{
        border: 0 solid #fff;
        width: 100%;
        height: 100%;
        border-radius: 50%;
    }
</style>
</head>
<body class="welcome_index">

<div id="main">
    <div class="container">
        <ul class="letter-chatlist">
            <c:forEach items="${ vos }" var="conversation">
            <li id="msg-item-4009580">
                <a class="list-head" href="/user/${conversation.getMessage("message").getFromName()}">
                    <img class="imageTX" alt="头像" src="/file/${ conversation.get("userImg") }">
                </a>
                <div class="tooltip fade right in">
                    <div class="tooltip-arrow"></div>
                    <div class="tooltip-inner letter-chat clearfix">
                        <div class="letter-info">
                            <p class="letter-time"><fmt:formatDate value="${conversation.getMessage('message').getCreatedDate()}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></p>
                            <a href="javascript:void(0);" id="del-link" name="4009580">删除</a>
                        </div>
                        <p class="chat-content">
                                ${conversation.getMessage("message").getFromName()}:
                            <br>
                            ${conversation.getMessage("message").getContent()}
                        </p>
                    </div>
                </div>
            </li>
            </c:forEach>
        </ul>
        <div>
            <form action="/addMessage/${otherName} " method="post">
                <input type="hidden" value="{{ topic.id }}">
                <textarea name=messageContent></textarea>
                <button>添加回复</button>
            </form>
        </div>
    </div>
</div>


</body></html>