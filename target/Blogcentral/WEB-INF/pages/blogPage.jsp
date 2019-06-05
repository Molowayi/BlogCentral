<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: AnastasiiaK
  Date: 30/03/2018
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Post details</title>

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

        <!-- Post Content Column -->
        <div class="col-lg-8">

            <!-- Title -->
            <h1><c:out value="${blogpost.title}"/></h1>

            <!-- Author -->
            <p class="lead">
                by
                <a href="${pageContext.request.contextPath}/authorPage?author=${blogpost.author.userName}">
                    <c:out value="${blogpost.author.userName}"/></a>
            </p>

            <hr>

            <!-- Date/Time -->
            <p>Posted on <c:out value="${blogpost.postTime}"/></p>

            <hr>

            <!-- Preview Image -->


            <hr>

            <!-- Post Content -->
            <c:out value="${blogpost.body}"/>
            <hr>
            <button form method="post" name="likeClick">♥</button><c:out value="${blogpost.likeClick}"/>
            <hr>

            <!-- Comments Form -->
            <div class="card my-4">
                <h5 class="card-header">Leave a Comment:</h5>
                <div class="card-body">
                    <form method="post">
                        <div class="form-group">
                            <textarea class="form-control" rows="3"></textarea>
                        </div>
                        <button type="submit" name="comment" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>

            <!-- Single Comment -->
            <div class="media mb-4">
                <c:forEach var="comment" items="${commentsList}" >
               <!-- Avatar if needed {post.author.avatar} -->
                <div class="media-body">
                    <h5 class="mt-0"><c:out value="${blogpost.comment.author}"/></h5>
                    <c:out value="${blogpost.comment.body}"/>
                </div>
                    </c:forEach>
            </div>


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
    <!-- /.row -->

</div>
<!-- /.container -->

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
