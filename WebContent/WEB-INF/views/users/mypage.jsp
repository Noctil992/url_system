<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">

    <div class="container">
     <c:choose>
            <c:when test="${user != null}">
                <h2 class="text-center">${user.name} さんのマイページ</h2><br>

                <div class="container">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                <h1 class="text-center panel panel-info">保存したURL一覧</h1>
                    </div>


               <div class="panel-body">
                <table class="table table-condensed table-bordered">
                <tbody>
                    <tr>
                     <th class="create_date">作成日時</th>
                     <th class="url">URL(クリックすると別タブで開きます)</th>
                     <th class="url_content">コメント</th>
                     <th class="delete">削除</th>
                    </tr>

                    <c:forEach var="url" items="${urls}" varStatus="status">
                    <c:choose>
                        <c:when test="${url.delete_flag == 1}" >
                        <tr>
                             <td>削除済み</td>
                             <td>削除済み</td>
                             <td>削除済み</td>
                             <td></td>
                          </tr>
                        </c:when>

                            <c:otherwise>


                                    <tr>
                                        <td class="create_date"><fmt:formatDate value='${url.create_date}' pattern="yyyy-MM-dd" /></td>
                                        <td class="url"><a href="${url.url}" target="_blank"><span class="bg-info">${url.url}</span></a></td>
                                        <td class="url_content">${url.content}</td>
                                        <td class="delete">
                                                                        <p><a href="/urls/destroy?id=${url.id}" onclick="confirmDestroy();"><span class="label label-warning">削除</span></a></p>
                                                                        <script>
                                                                            function confirmDestroy() {
                                                                                if(confirm("本当に削除してよろしいですか？")) {
                                                                                    document.forms[1].submit();
                                                                                }
                                                                            }
                                                                        </script>
                                        </td>
                                    </tr>

                            </c:otherwise>
                         </c:choose>
                    </c:forEach>

                    </tbody>
                </table>


                <div id="pagination">
            （全 ${urls_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((urls_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <span class="label label-primary"><c:out value="${i}" /></span>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='./mypage?id=${user.id}&page=${i}' />"><span class="label label-default"><c:out value="${i}" /></span></a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </div>
    </div>
    <a type="button" class="btn btn-lg btn-primary col-md-6 col-md-offset-3" href="/urls/new"><span class="badge">New</span>ＵＲＬ新規登録へ</a>
                <br />
</div>


            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
    </div>
    </c:param>
</c:import>