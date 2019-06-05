<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
    body {
        font-family: "Lato", sans-serif;
    }

    .sidenav {
        width: 130px;
        position: fixed;
        z-index: 1;
        top: 20px;
        left: 10px;
        background: #eee;
        overflow-x: hidden;
        padding: 8px 0;
    }

    .sidenav a {
        padding: 6px 8px 6px 16px;
        text-decoration: none;
        font-size: 25px;
        color: #2196F3;
        display: block;
    }

    .sidenav a:hover {
        color: #064579;
    }

    .main {
        margin-left: 140px; /* Same width as the sidebar + left position in px */
        font-size: 28px; /* Increased text to enable scrolling */
        padding: 0px 10px;
    }

    @media screen and (max-height: 450px) {
        .sidenav {padding-top: 15px;}
        .sidenav a {font-size: 18px;}
    }
</style>
</head>
<body>
<div class="sidenav">
   Online authors: ${onlineAuthors}
   Total visitors: ${totalVisitors}
  </div>
</body>
</html>
