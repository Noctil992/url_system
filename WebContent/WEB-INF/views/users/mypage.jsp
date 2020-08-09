<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
     <c:choose>
            <c:when test="${user != null}">
                <h2 class="text-center">${user.name} さんのマイページ</h2><br>
                <a type="button" class="btn btn-lg btn-primary col-sm-4 col-sm-offset-2" href="/url_system/urls/new"><span class="badge">New</span>ＵＲＬ新規登録へ</a>
                <a type="button" class="btn btn-lg btn-danger col-sm-4" href="#"><span class="badge">Delete</span>ＵＲＬ削除へ</a><br>
                <h3 class="text-center col-sm-offset-2">保存したURL一覧</h3>
                <table class="table">
                <tbody>
                    <tr>
                     <th class="create_date">作成日時</th>
                     <th class="url">URL</th>
                     <th class="url_content">コメント</th>
                    </tr>
                    <c:forEach var="url" items="${urls}" varStatus="status">
                        <tr>
                            <td class="create_date"><fmt:formatDate value='${url.create_date}' pattern="yyyy-MM-dd" /></td>
                            <td class="url"><a href="${url.url}">${url.url}</a></td>
                            <td class="url_content">${url.content}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div id="pagination">
            （全 ${urls_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((urls_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/?page=${i}' />"><c:out value="${i}" /></a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>




            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

    </c:param>
</c:import>