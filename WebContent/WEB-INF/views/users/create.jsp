<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
    <h2 class="text-center">登録完了です。すぐに利用する場合は下部よりログインしてください。</h2>

    <a type="button" class="btn btn-primary btn-lg col-sm-8 col-sm-offset-2"  href="/login">ログインする</a>
        <p class="col-sm-12"></p>
    </c:param>
</c:import>