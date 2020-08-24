<%-- 
    Document   : Home
    Created on : Jun 27, 2020, 12:33:15 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Events</title>
        <link rel="icon" href="images/default/defaultHeaderSidebar.png">
        <link rel="stylesheet" href="css/DefaultStyle.css">
        <script src="js/DefaultScript.js"></script>
    </head>
    <body>
        <header class="top"> 
            <div id="headerSidebar">
                <div class="toggle-button" onclick="toggleSidebar()">
                    <span></span>
                    <span></span>
                    <span></span>
                </div> 
                <img id="sidebarLogo" src="images/default/defaultHeaderSidebar.png" alt="Sidebar Logo">
                <ul>
                    <li><a href="home">HOME</a></li>
                    <!--<li><a href="Archive.jsp">ARCHIVE</a></li>-->
                    <!--<li><a href="Education.jsp">EDUCATION</a></li>-->
                    <li><a href="events">EVENTS</a></li>
                    <!--<li><a href="Products.jsp">PRODUCTS</a></li>-->
                    <li><a href="about">ABOUT</a></li>
                </ul>
            </div>
            
            <a href="Home.jsp">
                <img id="headerLogo" src="images/default/defaultHeaderLogo.png" alt="Header Logo">
            </a>
            
            <div id="headerAccount">
                <ul>
                    <li>
                        <img class="toggle-button" id="accountIcon" 
                            src="images/default/defaultHeaderAccountToggle.png" alt="Account Icon">
                        <ul>
                            <li><a href='#'>Sign up</a></li>
                            <li><a href='#'>Log in</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </header>
        
        <section class="content">  
            <%@include file="EventsContext.jsp"%>
        </section>
            
        <footer>
            <div id="mediaIcons">
                <a href="https://www.facebook.com/lelody.38/" target="_blank">
                    <img src="images/default/defaultIconFB.png" alt="Facebook Icon">
                </a>
                <a href="https://twitter.com/ANHDUCLE12" target="_blank">
                    <img src="images/default/defaultIconTT.png" alt="Twitter Icon">
                </a>
                <a href="https://www.instagram.com/__lee.anh__/" target="_blank">
                    <img src="images/default/defaultIconIG.png" alt="Instagram Icon">
                </a>
                <a href="https://mail.google.com/mail/?view=cm&fs=1&to=leecavalli3008@gmail.com" target="_blank">
                    <img src="images/default/defaultIconGmail.png" alt="Gmail Icon">
                </a>
                <a href="https://github.com/leeanh38" target="_blank">
                    <img src="images/default/defaultIconGH.png" alt="Github Icon">
                </a>
            </div>
            
            <img id="footerLogo" src="images/default/defaultHeaderSidebar.png" alt="MIK Logo" width="100">
            <div id="copyright">
                Copyright @2020 MIK All rights reserved.
            </div>
            <div id="pageLinks">
                <a href="home">HOME</a>
                <!--| <a href="Archive.jsp">ARCHIVE</a>-->
                <!--| <a href="Education.jsp">EDUCATION</a>-->
                | <a href="events">EVENTS</a>
                <!--| <a href="Products.jsp">PRODUCTS</a>-->
                | <a href="about">ABOUT</a>
            </div>
        </footer>
    </body>
</html>
