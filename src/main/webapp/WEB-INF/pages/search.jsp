<%-- 
    Document   : Search
    Created on : Aug 24, 2015, 8:32:07 PM
    Author     : Muhammad Lupate
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <Meta http-equiv="Pragma" content="no cache">
        <Meta http-equiv="Cache-control" content="no cache">
        <meta http-equiv="Expires" content="0">                

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">       
        <link href="css/dataTable.bootstrap.min.css" rel="stylesheet" type="text/css">       

        <script src="js/bootstrap.js" type="text/javascript" ></script>        
        <script src="js/jquery-1.11.3.min.js" type="text/javascript" ></script>
        <script src="js/jquery.dataTable.min.js" type="text/javascript" ></script>
        <script src="js/dataTable.bootstrap.min.js" type="text/javascript" ></script>
        <script src="js/custome.js" type="text/javascript" ></script>

        <title>JSP Search Page</title>
    </head>

    <body onload="document.searchForm.searchKey.focus();">

        <div id="main-content" class="container">
            <div class="row">                
                <h2>Search form</h2>
                <h4>Search for projects by their titles or IDs</h4>
                <form name="searchForm" role="form" id="searchForm" method="GET" action="#" 
                      class="form-horizontal">

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="searchKey">Search for:</label>
                        <div class="col-sm-10">
                            <input type="text" name="searchKey" id="searchKey" placeholder="Enter keyword"
                                   class="form-control" maxlength="25" onkeypress="filterDigits(event)"/>                            
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="searchId">ID:</label>
                        <div class="col-sm-10"> 
                            <input type="number" class="form-control" name="searchId" id="searchId" placeholder="Enter ID"/>
                        </div>
                    </div>                        
                    <div class="form-group"> 
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">
                                <span class="glyphicon glyphicon-search"></span> Search</button>
                        </div>
                    </div>
                </form>

                <c:set var="keyword" scope="request" value="${param.searchKey}"/>

                <c:if test= '${((fn:length(keyword) > 0) || (param.searchId > 0))}'>
                    <jsp:include page="/WEB-INF/pages/results.jsp">
                        <jsp:param name="keyword" value="${param.searchKey}"/>
                        <jsp:param name="uId" value="${param.searchId}"/>
                    </jsp:include>
                </c:if>                   

            </div>
        </div>
    </body>
</html>
