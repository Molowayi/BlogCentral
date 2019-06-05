<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="sideBar.jsp" %>
<p>
    <c:if test="${sessionToken == null}">
    <a href="/login">Login | </a><a href="/signup">Sign up | </a>
    </c:if>
    <c:if test="${sessionToken != null}">
    <a href="/userdetails?id=${user.userName}"> ${user.firstName} ${visitor.lastName} | </a>
    </c:if>

<form action="/search">
    <input type="text" name="tag">
    <input type="submit" value="Search">
</form>
</p>