<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
    <div class="continer">


            <form method="POST" action="<c:url value='/users/create' />">
            <c:if test="${errors != null}">
                <div id="flush_error">
                    入力内容にエラーがあります。<br />
                    <c:forEach var="error" items="${errors}">
                        ・<c:out value="${error}" /><br />
                    </c:forEach>
                </div>
            </c:if>
            <div class="container">
             <h2 class="text-center">新規登録ページ</h2>
                <div class="form-group">
                    <label for="login_id"><span class="label label-primary">ログインID</span></label><br />
                    <input  class="form-control" type="text" name="login_id" value="${User.login_id}" />
                    <br /><br />

                    <label for="name"><span class="label label-primary">表示名</span></label><br />
                    <input class="form-control" type="text" name="name" value="${User.name}" />
                    <br /><br />

                    <label for="password"><span class="label label-primary">パスワード</span></label><br />
                    <input class="form-control" type="password" name="password" />
                    <br /><br />


                    <input type="hidden"  name="admin_flag"  value="${0}" />
                    <input type="hidden" name="_token" value="${_token}" />
                    <button type="submit">登録</button>
                </div>
            </div>
            </form>

            <p><a href="<c:url value='/index.html' />">トップに戻る</a></p>
            </div>
    </c:param>
</c:import>