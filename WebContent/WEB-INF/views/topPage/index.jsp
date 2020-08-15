<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
        <c:param name="content">
        <div class="jumbotron">
            <div class="container-fluid">
                    <h1 class="text-center">URLかんたん保存へようこそ！</h1>
                    <p class="text-center">このサイトでは、「ブックマークするほどでもないけど保存しておきたいURL」を、日付やコメント付けで整理して保存できます。。</p>
              </div>
           </div>

        <a type="button" class="btn btn-primary btn-lg col-sm-8 col-sm-offset-2"  href="./users/new">新規利用登録</a>
        <p class="col-sm-12"></p>
        <a type="button" class="btn btn-success btn-lg col-sm-8 col-sm-offset-2" href="./login">ログイン</a>
        </c:param>
</c:import>