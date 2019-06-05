<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: AnastasiiaK
  Date: 30/03/2018
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Author ${author.firstName}</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/pages/blogpostDetailPagina/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/pages/blogpostDetailPagina/css/blog-post.css" rel="stylesheet">

</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/Central">Travel Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Central">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/login">Log-In</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/signup">Sign-Up</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
            <%--mini-profil--%>
            <div id="mini-profil">
                <h3>Profile of ${author.firstName}</h3>
                <table>
                    <tr>
                        <td>First Name :</td>
                        <td>${author.firstName}</td>
                    </tr>
                    <tr>
                        <td>Last Name :</td>
                        <td>${author.lastName}</td>
                    </tr>
                    <tr>
                        <td>User Name :</td>
                        <td>${author.userName}</td>
                    </tr>
                </table>
            </div>

            <%-- Display blog posts : title, content, link to details page, link to author page --%>
            <div id="blogposts">
                <c:forEach items="${blogPosts}" var="blogPostVar" begin="${count}" end="${count==0?count+5:count+9}">
                    <div class="post-preview">
                        <a href="${pageContext.request.contextPath}/postDetails?id=${blogPostVar.id}">
                            <h2 class="post-title"><br/>${blogPostVar.title}</h2>
                        </a>
                        <!-- For the body, do not display more than the 200 first characters -->
                        <p>
                            <c:choose>
                                <c:when test="${fn:length(blogPostVar.body) < 200 }">
                                    ${blogPostVar.body}
                                </c:when>
                                <c:otherwise>${fn:substring(blogPostVar, 0, 200)}</c:otherwise>
                            </c:choose>
                        </p>
                        <p class="post-meta">Posted on <c:out value="${blogPostVar.postTime}"/></p>
                    </div>
                </c:forEach>
            </div>

            <!-- Sorting functions -->
            <div id="sortfunctions">

                <c:if test="${count==0}">
                    <div class="clearfix">
                        <a class="btn btn-primary float-right"
                           href="authorPage?author=${author.userName}&sortType=${sortType}&count=${count+6>=fn:length(blogPosts)?count:count+6}">Older
                            Posts &rarr;</a>
                    </div>
                </c:if>
                <c:if test="${count!=0 && count+10<fn:length(blogPosts)}">
                    <div class="clearfix">
                        <a class="btn btn-primary float-right"
                           href="authorPage?author=${author.userName}&sortType=${sortType}&count=${count+10>=fn:length(blogPosts)?count:count+10}">Older
                            Posts &rarr;</a>
                    </div>
                </c:if>
            </div>

            <%-- Display create post form if author is visitor --%>
            <c:if test="${visitor.userName eq author.userName}">
                <div id="createblogpost">
                    <form action="${pageContext.request.contextPath}/authorPage?${author.userName}" class="login100-form validate-form"
                          method="post">

                        <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
                            <span class="label-input100">Create new plog post</span>
                            <form method="post">
                                <div class="form-group">
                                    <textarea class="form-control" rows="3"></textarea>
                                </div>
                                <button type="submit" name="comment" class="btn btn-primary">Create</button>
                            </form>
                            <span class="focus-input100"></span>
                        </div>
                </div>
            </c:if>
        </div>
        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

            <!-- Search Widget -->
            <div class="card my-4">
                <h5 class="card-header">Search</h5>
                <div class="card-body">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for...">
                        <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button">Go!</button>
                </span>
                    </div>
                </div>
            </div>

            <!-- Categories Widget -->
            <div class="card my-4">
                <h5 class="card-header">Tags</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="list-unstyled mb-0">
                                <li>
                                    <a href="#"> ${tags}</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Side Widget -->
            <div class="card my-4">
                <h5 class="card-header">Online</h5>
                <div class="card-body">
                    ${onlineAuthors}
                </div>
                <h5 class="card-header">Total visitors</h5>
                <div class="card-body">
                    ${totalVisitors}
                </div>
            </div>

        </div>
    </div>
</div>
<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Travel Blog 2018</p>
    </div>
    <!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/pages/blogpostDetailPagina/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/blogpostDetailPagina/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
