<%-- 
    Document   : dataItem
    Created on : Aug 25, 2015, 7:59:00 PM
    Author     : Muhammad Lupate
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <Meta http-equiv="Pragma" content="no cache">
        <Meta http-equiv="Cache-control" content="no cache">
        <meta http-equiv="Expires" content="0">                

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">               

        <script src="js/bootstrap.js" type="text/javascript" ></script>        
        <script src="js/jquery-1.11.3.min.js" type="text/javascript" ></script>                
        <script src="js/custome.js" type="text/javascript" ></script>

        <title>JSP Show Data Item Page</title>
    </head>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script>
        $(document).ready(function () {
            var tech = GetURLParameter('id');
            $("#pID").html(tech);
        });
    </script>
    <body>        
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/afaq_schema"
                           user="root"  password="root"/>                      

        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from project WHERE id = ?
            <sql:param value="${param.id}"/>
        </sql:query>

        <div class="container">
            <h3>Data of Project #: <spin id="pID"> </spin></h3>
            <form role="form">
                <div class="form-group ">
                    <label for="pId">ID:</label>
                    <input type="text" class="form-control" id="pId" value="${result.rows[0].id}" readonly>
                </div>
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" class="form-control" id="title" value="${result.rows[0].title}" readonly>
                </div>
                <div class="form-group">
                    <label for="desc">Description:</label>
                    <textarea class="form-control" id="desc" style="resize:none" rows="3" readonly>${result.rows[0].description}
                    </textarea>
                </div>
                <div class="form-group">
                    <label for="date">Created Date:</label>
                    <fmt:formatDate var="date" pattern="dd MMM, yyyy" value="${result.rows[0].creation_date}"  />
                    <input type="text" class="form-control" id="date"  value="${date}" readonly>
                </div>
                <div class="form-group">
                    <label for="man">Manager:</label>
                    <input type="text" class="form-control" id="man" value="${result.rows[0].user_id}" readonly>
                </div>
                <button type="submit" class="btn btn-default btn-lg col-lg-4 col-lg-offset-4">Edit</button>
            </form>
        </div>
    </body>
</html>
