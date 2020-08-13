<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${hasError}">
            <div id="flush_error">
                ＩＤかパスワードが間違っています。
            </div>
        </c:if>
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <div class="container">
        <div class="panel panel-info">
            <div class="panel-heading">
        <h2 class="text-center">ログイン</h2>
            </div>
            <div class="panel-body">
        <form method="POST" action="<c:url value='/login' />" class="col-sm-6 col-sm-offset-4">
            <label for="login_id">ログインID</label>
            <input type="text" name="login_id" value="${login_id}" />
            <br /><br />

            <label for="password">パスワード</label>
            <input type="password" name="password" />
            <br /><br />

            <input type="hidden" name="_token" value="${_token}" />
            <button type="submit" class="col-sm-4 col-sm-offset-2">ログイン</button>
        </form>
        </div>
        </div>
        </div>
    </c:param>
</c:import>