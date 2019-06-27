<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>タスク一覧</h2>
        <table border = "1" id = "tasklist">
                <tbody>
                    <tr>
                        <th>ID</th>
                        <th>作成日時</th>
                        <th>更新日時</th>
                        <th>content</th>
                    </tr>
                    <c:forEach var="tasklist" items="${tasklists}">
                    <tr>
                        <td><p><a href="${pageContext.request.contextPath}/show?id=${tasklist.id}"><c:out value="${tasklist.id}" /></a></p>
                        <td><fmt:formatDate value="${tasklist.created_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        <td><fmt:formatDate value="${tasklist.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        <td><c:out value="${tasklist.title}"></c:out> &gt; <c:out value="${tasklist.content}" /></td>
                    </tr>
                    </c:forEach>
                </tbody>
        </table>

        <div id = "pagination">
            (全 ${tasklists_count} 件) <br />
            <c:forEach var = "i" begin = "1" end = "${((tasklists_count -1) / 15) + 1}" step ="1">
                <c:choose>
                    <c:when test="${i == page }">
                        <c:out value = "${i }" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/index?page=${i}"><c:out value ="${i }" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="${pageContext.request.contextPath}/new">新規タスクの作成</a></p>

    </c:param>
</c:import>