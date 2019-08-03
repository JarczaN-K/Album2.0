<%@ page import="pl.jnowacki.Album" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: jedrz
  Date: 03.08.2019
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>MyAlbums</title>
</head>

<style>
    table, th, td {
        border: 1px solid black;
    }
</style>

<body>

<%
    if (session.getAttribute("albums") == null) {
        session.setAttribute("albums", new ArrayList<Album>());
    }
%>

${param.submitted}

<form method="post">
    <input type="hidden" name="submitted" value="true">
    Title:<br><input type="text" name="title"><br>
    Artist:<br><input type="text" name="artist"><br>
    Year:<br><input type="text" name="year"><br>
    Genre:<br><input type="text" name="genre"><br>
    <input type="submit">
</form>

<c:if test="${param.submitted}">
    <jsp:useBean id="newAlbum" class="pl.jnowacki.Album"/>
    <jsp:setProperty name="newAlbum" property="*"/>
    <%
    ((List<Album>) session.getAttribute("albums")).add(newAlbum);
%>
</c:if>

<table>
    <tr>
        <th>Lp.</th>
        <th>Title</th>
        <th>Artist</th>
        <th>Year</th>
        <th>Genre</th>
    </tr>
    <c:forEach items="${sessionScope.albums}" var="album" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${album.title}</td>
            <td>${album.artist}</td>
            <td>${album.year}</td>
            <td>${album.genre}</td>
        </tr>
    </c:forEach>

</table>

</body>
</html>
