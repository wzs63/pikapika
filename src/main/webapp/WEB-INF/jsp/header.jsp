<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>主页</title>
</head>

<div class="nav-a">
    <div class="log"><img alt="log" src="../image/logo2.png"></div>
    <ul>
        <li>
            <a class="nav-b" href="/index.do" style="left:120px">主站
                <div class="shader"></div>
            </a>
        </li>
        <li>
            <a class="nav-b" href="/videoUnload.do" style="left:240px">上传
                <div class="shader"></div>
            </a>
        </li>
        <li><a class="nav-b" href="/top.do" style="left:360px">排行榜
            <div class="shader"></div>
        </a>
        </li>
        <li><a class="nav-b" href="index.html" style="left:480px">会员中心
            <div class="shader"></div>
        </a>
        </li>
    </ul>

    <form class="form-inline" action="/search.do" method="post">
        <div id="box">
            <input type="text" class="nav-input"  name="searchText" placeholder="请输入关键字">
            <button  type="submit" id="search">搜索</button>
        </div>
    </form>
    <div class="ChatHead">
        <a href="/person/${ fullUser.getUserName() }" style="right:100px"><img id="Chathead" alt="../image/h3.jpg"
                                                                               src="/file/ ${ fullUser.getUserImg() }"></a>
    </div>
    <li><a class="nav-b" href="/message/list" style="right:0px">私信
        <div class="shader"></div>
    </a>
    </li>
<script>

</script>

</div>
</html>