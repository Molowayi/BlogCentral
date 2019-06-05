<%@ page import="be.intecbrussel.Blogcentral.model.BlogPost" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="sideBar.jsp" %>
<%--
  Created by IntelliJ IDEA.
  User: AnastasiiaK
  Date: 29/03/2018
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Travel Blog</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/pages/startPage/vendor/bootstrap/css/bootstrap.min.css"
          rel="stylesheet">
    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/pages/startPage/vendor/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet'
          type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
          rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/pages/startPage/css/clean-blog.min.css" rel="stylesheet">
</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/Central">Travel Blog</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            Menu
            <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Central">Home</a>
                </li>
                <c:choose>
                    <c:when test="${userName == null}">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/login">Log-In</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/signup">Registration</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/userdetails?${userName}">Welcome ${userName}</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/LogOut">log-Out</a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <li class="nav-item">
                    <form method="post" action="search">
                        <input type="text" name="search" placeholder="search">
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Header -->
<header class="masthead"
        style="background-image: url('${pageContext.request.contextPath}/pages/startPage/img/home-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="site-heading">
                    <h1>Travel Blog</h1>
                    <span class="subheading">A Blog for people who can not imagine their life without travelling</span>
                </div>
            </div>
        </div>
    </div>
</header>


<!-- Main Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">

            <!-- Sorting -->
            <form method="GET" <c:if test="${searchResult != null}">action="search?" </c:if>>
                <p align="center"><select name="sortType" onchange="this.form.submit()">
                    <option disabled selected>${sortType} posts</option>
                    <option value="new">new posts</option>
                    <option value="old">old posts</option>
                    <option value="popular">popular posts</option>
                </select>
            </form>


            <c:forEach items="${blogPosts}" var="blogPostVar" begin="${count}" end="${count==0?count+5:count+5}">
                <div class="post-preview">

                    <a href="${pageContext.request.contextPath}/postDetails?id=${blogPostVar.id}">
                        <h2 class="post-title">
                            <br/>
                            <c:out value="${blogPostVar.title}"/>
                        </h2>
                    </a>
                    <p><%-- Display post content : max 200 characters --%>
                        <c:choose>
                            <c:when test="${fn:length(blogPostVar.body) < 200 }">
                                ${blogPostVar.body}
                            </c:when>
                            <c:otherwise>${fn:substring(blogPostVar, 0, 200)}</c:otherwise>
                        </c:choose>
                    </p>
                    <p class="post-meta">Posted by
                        <a href="${pageContext.request.contextPath}/authorPage?author=${blogPostVar.author.userName}">
                            <c:out value="${blogPostVar.author.userName}"/>
                            <c:if test="${blogPostVar.author.photo!=null}">
                                <img src="${pageContext.request.contextPath}/image?imageId=${blogPostVar.author.id}"
                                     style="width: 20px; height: 20px;"/>
                            </c:if>
                        </a>
                        on <c:out value="${blogPostVar.postTime}"/> |
                        <a href="${pageContext.request.contextPath}/postDetails?postId=${blogPostVar.id}">
                            <c:out value="${blogPostVar.author.userName}"/>
                        </a>
                    </p>
                </div>
            </c:forEach>

            <!-- Pager -->
            <c:choose>
                <c:when test="${searchResult !=null}">
                    <div class="clearfix">
                        <a class="btn btn-primary"
                           href="search?sortType=${sortType}&page=1&count=${count+6>=fn:length(blogPosts)?count:count+6}">First
                            Posts
                        </a> |
                        <a class="btn btn-primary"
                           href="search?page=${previous_page}&sortType=${sortType}&count=${count-6<0?0:count-6}">Previous
                            Posts
                        </a> |
                        <a class="btn btn-primary"
                           href="search?page${next_page}&sortType=${sortType}&count=${count+6>=fn:length(blogPosts)?count:count+6}">
                            Next Posts
                        </a> |
                        <a class="btn btn-primary"
                           href="search?sortType=${sortType}&page=${page_max}&count=${count+6>=fn:length(blogPosts)?count:count+6}">Last
                            Posts
                        </a>

                    </div>
                </c:when>
                <c:otherwise>
                    <c:if test="${count==0}">
                        <div class="clearfix">
                            <a class="btn btn-primary float-right"
                               href="Central?sortType=${sortType}&count=${count+6>=fn:length(blogPosts)?count:count+6}">Next
                                Posts &rarr;</a>
                        </div>
                    </c:if>
                    <div class="clearfix">
                        <c:if test="${count!=0 && count+6<fn:length(blogPosts)}">
                            <a class="btn btn-primary float-right"
                               href="Central?sortType=${sortType}&count=${count+6>=fn:length(blogPosts)?count:count+6}">Next
                                Posts &rarr;</a>
                        </c:if>
                        <c:if test="${count!=0}">
                            <a class="btn btn-primary float-left"
                               href="Central?sortType=${sortType}&count=${count-6<0?0:count-6}">Previous Posts
                                &larr;</a>
                        </c:if>

                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<hr>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <ul class="list-inline text-center">
                    <li class="list-inline-item">
                        <a href="#">
                  <span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                  </span>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a href="#">
                  <span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                  </span>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a href="#">
                  <span class="fa-stack fa-lg">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                  </span>
                        </a>
                    </li>
                </ul>
                <p class="copyright text-muted">Copyright &copy; Java Group IntecBrussel 2018</p>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/pages/startPage/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/startPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Custom scripts for this template -->
<script src="${pageContext.request.contextPath}/pages/startPage/js/clean-blog.min.js"></script>
</body>
</html>
