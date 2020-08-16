<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">

    <c:param name="content">

        <c:if test="${errors != null}">
            <div id="flush_error">
                入力内容にエラーがあります。<br />
                    <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
                    </c:forEach>
            </div>
        </c:if>
    <div class="container">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h2 class="text-center">URL新規登録ページ</h2>
             </div>
             <div class="panel-body">
    <form method="POST" action="<c:url value= '/urls/create' />">
        <label for="create_date">作成日</label><br />
            <input type="date" class="form-control"  name="create_date" value="<fmt:formatDate value='${url.create_date}' pattern='yyyy-MM-dd' />" />
        <br /><br />

        <label for="url">登録したいURL</label><br />
            <input type="text" class="form-control"  name="url" value="${url.url}" />
        <br /><br />

    <label for="content">コメント</label><br />
        <textarea name="content" class="form-control"  rows="10" cols="50">${url.content}</textarea>
        <br /><br />

    <input type="hidden" name="_token" value="${_token}" />
    <button type="submit" class="col-md-4 col-md-offset-4">投稿</button>
    </form>
    </div>
        </div>
        </div>

    <p><a href="/users/mypage?id=<c:out value="${login_user.id}" /> ">マイページヘ戻る</a></p>

    </c:param>
</c:import>
