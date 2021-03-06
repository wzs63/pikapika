<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>lll</title>
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">


    <link rel="stylesheet" type="text/css" href="styles/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="styles/font-awesome.min.css">

    <link rel="stylesheet" media="all" href="styles/style.css">
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
<h1>私信</h1>
<div id="main">
    <div class="container">
        <ul class="letter-list">
            <c:forEach items="${ conversations }" var="conversation">
                <li id="conversation-item-10005_622873">
                    <a class="letter-link" href="/message/detail?conversationId=${conversation.getMessage("message").getConversationId()} "></a>
                    <div class="letter-info">
                        <span class="l-time">2019-06-01 00:00:00</span>
                        <div class="l-operate-bar">
                            <a href="javascript:void(0);" class="sns-action-del" data-id="10005_622873">
                                删除
                            </a>
                            <a href="/message/detail?conversationId=${conversation.getMessage("message").getConversationId()} ">
                                共${conversation.getMessage("message").getId()}条会话
                            </a>
                        </div>
                    </div>
                    <div class="chat-headbox">
                        <span class="msg-num">
                                ${conversation.get("unread")}
                        </span>
                        <a class="list-head" href="/user/1">
                            <img class="imageTX" alt="头像" src="/file/${ conversation.get("userImg") }">
                        </a>
                    </div>
                    <div class="letter-detail">
                        <a title=" ${conversation.get("otherUserName")} " class="letter-name level-color-1">
                                ${conversation.get("otherUserName")}
                        </a>
                        <p class="letter-brief">
                            <a href="/message/detail?conversationId=${conversation.getMessage("message").getConversationId()} ">
                                    ${conversation.getMessage("message").getContent()}
                            </a>
                        </p>
                    </div>
                </li>
            </c:forEach>

        </ul>

    </div>
    <script type="text/javascript">
        $(function(){

            // If really is weixin
            $(document).on('WeixinJSBridgeReady', function() {

                $('.weixin-qrcode-dropdown').show();

                var options = {
                    "img_url": "",
                    "link": "http://nowcoder.com/j/wt2rwy",
                    "desc": "",
                    "title": "读《Web 全栈工程师的自我修养》"
                };

                WeixinJSBridge.on('menu:share:appmessage', function (argv){
                    WeixinJSBridge.invoke('sendAppMessage', options, function (res) {
                        // _report('send_msg', res.err_msg)
                    });
                });

                WeixinJSBridge.on('menu:share:timeline', function (argv) {
                    WeixinJSBridge.invoke('shareTimeline', options, function (res) {
                        // _report('send_msg', res.err_msg)
                    });
                });

                // $(window).on('touchmove scroll', function() {
                //   if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
                //     $('div.backdrop').show();
                //     $('div.share-help').show();
                //   } else {
                //     $('div.backdrop').hide();
                //     $('div.share-help').hide();
                //   }
                // });

            });

        })
    </script>
</div>



</body></html>