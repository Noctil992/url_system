<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
     <c:choose>
            <c:when test="${user != null}">
                <h2 class="text-center">${user.name} さんのマイページ</h2><br>
                <a type="button" class="btn btn-lg btn-primary col-sm-4 col-sm-offset-2" href="#"><span class="badge">New</span>ＵＲＬ新規登録へ</a>
                <a type="button" class="btn btn-lg btn-danger col-sm-4" href="#"><span class="badge">Delete</span>ＵＲＬ削除へ</a><br>







            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

    </c:param>
</c:import>