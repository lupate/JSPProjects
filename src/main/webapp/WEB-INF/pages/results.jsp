<%-- 
    Document   : results
    Created on : Aug 25, 2015, 7:31:28 PM
    Author     : Muhammad Lupate
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
    <h3>Search Results: </h3>
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/afaq_schema"
                       user="root"  password="root"/>                      

    <%--<c:out value="${param.uId}"/>--%>
    <%--<c:out value="${param.keyword}"/>--%>
    <c:choose>
        <c:when test="${(fn:length(keyword) > 2)}">
            <sql:query dataSource="${snapshot}" var="result">
                SELECT * from project WHERE title like '%<c:out value="${param.keyword}"/>%'
            </sql:query>
        </c:when>
        <c:otherwise>
            <sql:query dataSource="${snapshot}" var="result">
                SELECT * from project WHERE id = ?
                <sql:param value="${param.uId}"/>
            </sql:query>
        </c:otherwise>
    </c:choose>

    <div class="table-responsive">
        <c:choose>
            <c:when test= '${(fn:length(keyword) < 3) && (param.uId < 1)}'>
                <div class="alert alert-warning">
                    <strong>Warning!</strong> Please enter 3 character at least to avoid congestion.
                </div>
            </c:when>
            <c:otherwise>
                <c:if test="${empty result.rows[0]}">
                    <div class="alert alert-info">
                        <strong>Info!</strong> No entries matched! try more specific keywords ..
                    </div>
                </c:if>
                <c:if test="${not empty result.rows[0]}">                    

                    <table class="table table-hover" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th style="min-width: 90px">Project ID</th>
                                <th style="min-width: 230px">Title</th>
                                <th>Description</th>
                                <th style="min-width: 110px">Creation Date</th>
                                <th style="min-width: 93px">Manager ID</th>
                                <th style="min-width: 90px">Link View</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Project ID</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Creation Date</th>
                                <th>Manager ID</th>
                                <th>Link View</th>
                            </tr>
                        </tfoot>
                        <tbody>                       
                            <c:forEach begin="0" end="9" step="1" var="row" items="${result.rows}">
                                <tr>
                                    <td><c:out value="${row.id}"/></td>
                                    <td><c:out value="${row.title}"/></td>
                                    <td  style="text-align: justify"><c:out value="${row.description}"/></td>
                                    <td><fmt:formatDate pattern="dd MMM, yyyy"
                                                    value="${row.creation_date}" /></td>
                                    <td><c:out value="${row.user_id}"/></td>
                                    <td><a href="viewData?id=${row.id}" class="btn-link">View</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:otherwise>
        </c:choose>
    </div>
</div>
