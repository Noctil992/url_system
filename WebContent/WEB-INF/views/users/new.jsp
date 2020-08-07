<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
            <h2>新規登録ページ</h2>

            <form method="POST" action="<c:url value='/users/create' />">
            <c:if test="${errors != null}">
                <div id="flush_error">
                    入力内容にエラーがあります。<br />
                    <c:forEach var="error" items="${errors}">
                        ・<c:out value="${error}" /><br />
                    </c:forEach>
                </div>
            </c:if>

            <label for="login_id">ログインID</label><br />
            <input type="text" name="login_id" value="${User.login_id}" />
            <br /><br />

            <label for="name">表示名</label><br />
            <input type="text" name="name" value="${User.name}" />
            <br /><br />

            <label for="password">パスワード</label><br />
            <input type="password" name="password" />
            <br /><br />

            <label for="admin_flag">root用権限あとでけす</label><br />
            <select name="admin_flag">
            <option value="0"<c:if test="${User.admin_flag == 0}"> selected</c:if>>一般</option>
            <option value="1"<c:if test="${User.admin_flag == 1}"> selected</c:if>>管理者</option>
            </select>
             <br /><br />

            <input type="hidden" name="_token" value="${_token}" />
            <button type="submit">登録</button>

            </form>

            <p><a href="<c:url value='/index.html' />">トップに戻る</a></p>
    </c:param>
</c:import>