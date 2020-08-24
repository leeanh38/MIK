<%-- 
    Document   : EventsInfo
    Created on : Jul 22, 2020, 4:57:45 PM
    Author     : Admin
--%>

<%@page import="Entity.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
        <link rel="icon" href="images/default/defaultHeaderSidebar.png">
        <link rel="stylesheet" href="css/DefaultStyle.css">
        <link rel="stylesheet" href="css/EventsStyle.css">
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
                    <li><a href="Home.jsp">HOME</a></li>
                    <!--<li><a href="Archive.jsp">ARCHIVE</a></li>-->
                    <li><a href="Events.jsp">EVENTS</a></li>
                    <li><a href="About.jsp">ABOUT</a></li>
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
                            <li><a href='#'>Sign in</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </header>
        
        <section class="content">  
            <section class="event-header bg-dark trebuchet">
                <div class="container">
                    <div class="row pt-5 pb-sm-5">
                        <div class="col-12 pb-5 text-white">
                            <h1 class="text-light" itemprop="name"><b>${event.getEventName()}</b></h1>
                            <h4 class="text-thin">#${event.getEventimagePath().replaceAll('.jpg','')}</h4>						
                            <div class="text-light mt-10">
                                <i class="fa fa-music">
                                    <img src='images/icon/iconStyleWhite.png' alt='Style' height='16'>
                                </i>&nbsp;&nbsp;${event.getEventStyle()}
                            </div>						
                        </div>
                        <div class="col-lg-7 pb-5 pb-lg-0 event-img">
                            <img src="images/events/${event.getEventimagePath()}"
                                 alt="${event.getEventName()}" itemprop="image"
                                 style="width: 100%">
                        </div>
                        
                        <div class="col-lg-5 pb-5 pb-lg-0 text-white">
                            <ul class="fa-ul text-thin" style="font-size: x-large">
                                <li class="mt-1">
                                    <i class="fa-li fa">
                                        <img src='images/icon/iconCalendarWhite.png' alt='Calendar' height='16'>
                                    </i> 
                                    <h5 class="text-light" itemprop="startDate" content="${event.getEventTime()}">
                                        ${date}
                                    </h5>
                                </li>
                                
                                <li class="mt-1">
                                    <i class="fa-li fa">
                                        <img src='images/icon/iconTimeWhite.png' alt='Time' height='16'>
                                    </i> 
                                    <h5 class="text-light">
                                        ${time}
                                    </h5>
                                </li>
                                
                                <li class="mt-1">
                                    <i class="fa-li fa">
                                        <img src='images/icon/iconPlaceWhite.png' alt='Place' height='16'>
                                    </i> 
                                    <h5 class="text-light">
                                        ${event.getEventPlace()}
                                    </h5>
                                </li>
                                
                                <li class="mt-1">
                                    <i class="fa-li fa">
                                        <img src='images/icon/iconLocationWhite.png' alt='Location' height='16'>
                                    </i> 
                                    <h5 class="text-light">
                                        ${event.getEventLocation()}
                                    </h5>
                                </li>
                                
                                <li class="mt-1">
                                    <i class="fa-li fa">
                                        <img src='images/icon/iconCurrencyWhite.png' alt='Price' height='16'>
                                    </i> 
                                    <h5 class="text-light">
                                        ${event.getEventPrice()}
                                    </h5>
                                </li>   
                                
                                <li class="mt-1">
                                    <i class="fa-li fa">
                                        <img src='images/icon/iconLinkWhite.png' alt='Link' height='16'>
                                    </i> 
                                    <h5 class="text-light">
                                        <a class="text-white mr-3 social-networks" href="${event.getEventLink()}"
                                           title="More info" target="_blank">
                                            LINK TO EVENT
                                        </a>
                                    </h5>
                                </li>
                            </ul>
                                           
                            <a class="btn btn-white mt-4" href="javascript:history.back()">
                                <b>BACK</b> 
                            </a>               
<!--                            
                            <div class="mt-25">
                                <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https://www.parisjazzclub.net%2Fen%2F69347%2Fconcert%2F2020%2F07%2F23%2Fetienne-mbappe-nec" class="btn mr-2 mb-2">Share<i class="fa fa-facebook-square fa-lg"></i></a>
                                <a target="_blank" href="https://twitter.com/intent/tweet?text=https://www.parisjazzclub.net%2Fen%2F69347%2Fconcert%2F2020%2F07%2F23%2Fetienne-mbappe-nec" class="btn mb-2">Tweet<i class="fa fa-twitter-square fa-lg"></i></a>
                            </div>-->
                        </div>
                    </div>
                </div>
                <div class="event-background" style="background-image:url(images/events/${event.getEventimagePath()})"></div>
            </section>
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
                <a href="Home.jsp">HOME</a>
                <!--| <a href="Archive.jsp">ARCHIVE</a>-->
                | <a href="Events.jsp">EVENTS</a>
                | <a href="About.jsp">ABOUT</a>
            </div>
        </footer>
    </body>
</html>

