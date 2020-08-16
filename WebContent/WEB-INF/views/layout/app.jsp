<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="description" content="このサイトでは、ブックマークにため込みたくないURLを日付やコメント付で整理して保存できます。｜　ＵＲＬ　かんたん　保存">
<title>URL簡単保存</title>
<link rel="stylesheet" href="<c:url value='/css/reset.css' />">
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sample-navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <c:choose>
                    <c:when test="${login_user != null}">
                     <a class="navbar-brand" href="/users/mypage?id=<c:out value="${login_user.id}" />" id="navbar-top">URLかんたん保存</a>
                    </c:when>
                    <c:otherwise>
                   <a class="navbar-brand" href="/index.html" id="navbar-top">URLかんたん保存</a>
                    </c:otherwise>
                </c:choose>

            </div>
            <div class="collapse navbar-collapse" id="sample-navbar">
                        <ul class="nav navbar-nav navbar-right">
                                <c:choose>
                                    <c:when test="${login_user != null}">
                                <li class="active"><a href="/logout">ログアウト</a></li>
                                    </c:when>
                                    <c:otherwise>
                                <li class="active"><a href="/login">ログイン</a></li>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                </div>


        </div>
    </nav>

    <div id="content">${param.content}</div>
    <div id="footer"><p class="text-center">by R/I</p></div>


    <!-- jQuery -->
    <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <!-- Bootstrap JavaScript -->
    <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>