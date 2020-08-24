<%-- 
    Document   : HomeContext
    Created on : Jun 27, 2020, 12:37:30 PM
    Author     : Admin
--%>

<%@page import="Entity.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/HomeStyle.css" rel="stylesheet">
    </head>
    <body>
        <div class="parralax text-center">
            <div class="site-title text-uppercase text-white">
                Music for Idiotic Knucklehead
            </div>
            <div class="site-slogan text-uppercase text-white">
                A musical events recommender
            </div>
	</div>
        
        <!--TODAY'S AD SECTION-->
        <section class="today-section bg-purple-gradient pt-100">
            <div class="container">
                <div class="row">
                    <div class="col pb-5 text-center">
                        <h2 class='text-black text-uppercase pre-title'>
                            What's new
                        </h2>
                        <h3 class='text-thin title'>
                            this week
                        </h3>
                    </div>
                </div>
                
                <div class='row pb-4 no-gutters'>
                    <div class='col-lg-8'>
                        <div class='row no-gutters'>                         
                            <div class='col-md-6 col-left col-lg-12'>
                                <div class='row no-gutters'>
                                    <div class='col-12 col-lg-6 p-2'>
                                        <a class="h_today" target="_blank" href="https://www.youtube.com/watch?v=-xJFY1v5PFk&list=RD-xJFY1v5PFk&start_radio=1">
                                            <img src="images/ad/takeMeCH.jpg" alt="CH Prod Ad">
                                        </a>
                                    </div>
                                    
                                    <div class='col-12 col-lg-6 p-2'>
                                        <a class="h_today" target="_blank" href="https://www.myclubmarriott.com/vi/vietnam/restaurant-bars/cool-cats-jazz-club-jw-marriott-hotel-hanoi">
                                            <img src="images/ad/coolCats.jpg" alt="JW Marriott Ad">
                                        </a>
                                    </div>
                                    
<!--                                    <div class='col-12 col-lg-6 p-2'>
                                        <a class="h_today" target="_blank" href="https://www.youtube.com/watch?v=EXWOJvlDwbU">
                                            <img src="images/ad.jpg" alt="Disco Yes Ad">
                                        </a>
                                    </div>-->
                                    
                                    <div class='col-12 col-lg-6 p-2'>
                                        <a class="h_today" target="_blank" href="https://www.facebook.com/events/178791406901876/?post_id=262264708554545&acontext=%7B%22ref%22%3A%2229%22%2C%22ref_notif_type%22%3A%22admin_plan_mall_activity%22%2C%22action_history%22%3A%22null%22%7D&notif_id=1593352189526003&notif_t=admin_plan_mall_activity&ref=notif">
                                            <img src="images/ad/redBalloon.jpg" alt="Red Balloon Ad">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>    
                    </div>              
                </div>
                <div class="pb-5"></div>
            </div>
        </section>
        
        <!--EVENTS SECTION-->
        <section class="concerts-section bg-white pt-100">          
            <div class="container">
                <div class="row">
                    <div class="col pb-5 text-center">
                        <h2 class="text-black text-uppercase title trebuchet text-color-invert">
                            Upcoming events
                        </h2>
                    </div>
                </div>
                
                <div class="row pb-5">
                    <div class="col">
                        <div class="card-deck">
                            <%
                                Event e = new Event();
  
                                ArrayList<Event> listEvent = e.getHomeEvents();
                                //Lap va hien thi tung ham ket qua
                                for(Event item: listEvent){
                                    out.println("<div class='card concert bg-grey' "
                                            + "itemprop='performerIn' itemscope "
                                            + "itemtype='http://schema.org/Event'>");
                                        out.println("<a itemprop='url' href='info?eventId=" + item.getEventTempId() + "'>");
                                            out.println("<div class='img-container'>");
                                                out.println("<div class='img-overlay'></div>");
                                                out.println("<img class='img bg-grey-light' "
                                                     + "alt='Event Picture' src='images/events/" + item.getEventimagePath() + "' " 
                                                     + "itemprop='image'>");
                                            out.println("</div>");

                                            out.println("<div class='infos'>");
                                                out.println("<div class='date text-regular pb-2' "
                                                     + "itemprop='startDate' "
                                                     + "content='" + item.getEventTime() + "'>");
                                                    out.println("<i class='fa'>");
                                                        out.println("<img src='images/icon/iconTime.png' alt='Time' style='width:15px!important; margin-top: -4px;'>");
                                                    out.println("</i>");
                                                    
                                                    out.println("&nbsp;" + e.getHomeDateNormalized(item.getEventTime()));
                                                out.println("</div>");

                                                out.println("<h2 class='title text-black text-ocre pb-2 trebuchet' " 
                                                    + "itemprop='name'>");
                                                    out.println(item.getEventName());
                                                out.println("</h2>");

                                                out.println("<div class='place text-thin pb-2' itemprop='name'>");
                                                    out.println(item.getEventPlace());
                                                out.println("</div>");

                                                out.println("<div class='small' style='line-height: 120%'>");
                                                    out.println("<i class='fa'>");
                                                        out.println("<img src='images/icon/iconLocation.png' alt='Location' style='margin-top:-5px;'>");
                                                    out.println("</i>");
                                                    out.println("&nbsp;" + item.getEventLocation());
                                                out.println("</div>");
                                            out.println("</div>");
                                        out.println("</a>");
                                    out.println("</div>");
                                }
                            %>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col text-center pb-100">
                        <a class="btn btn-black btn-lg mt-5 bg-grey trebuchet" href="Events.jsp">
                            More events
                        </a>
                    </div>
                </div>
            </div>
        </section>
        
        <!--MAP SECTION-->
        <section class="contact-map-section">
            <div id="geo-map-container">
                <div id="geo-map-overlay">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col text-lg-right text-left">
                                <div class="text-zone">
                                    <h3 class="title text-white text-light">
                                        <span style="font-size:80%;line-height:80%;font-family: Trebuchet MS, Helvetica, sans-serif;font-weight: bold">
                                            <span class="text-thin">
                                                Discover places of<br> 
                                                the
                                            </span> 
                                            MIK Club<br> 
                                            <span class="text-thin">
                                                network
                                            </span>
                                        </span>
                                    </h3>
                                    
                                    <a class="btn btn-white mt-4" href="#">
                                        All the places 
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div id="map"></div>                
            <script>
                function initMap() {
                    var fptu = {lat: 21.012958 , lng: 105.527380};
                    var fsoft = {lat: 21.009798 , lng: 105.535159};
                    var fbeta = {lat: 21.013920 , lng: 105.525429};
                    
                    var map = new google.maps.Map(document.getElementById("map"),{
                        zoom: 16,
                        center: fptu
                    });
                    var marker = new google.maps.Marker({
                        position: fptu,
                        map: map
                    })
                    
                    var marker2 = new google.maps.Marker({
                        position: fsoft,
                        map: map
                    })
                    
                    var marker3 = new google.maps.Marker({
                        position: fbeta,
                        map: map
                    })
                }
            </script>

            <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCSltyvF9WM_92supNsKaL-SmvKzC2BGgU&callback=initMap">
            </script>
        </section>
        
        <!--ABOUT SECTION-->
        <section class="bg-grey pt-100">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 pb-5">
                        <h2 class="text-black text-uppercase pre-title">
                            The association
                        </h2>
                        
                        <h3 class="text-thin title">
                            MIK Inc.
                        </h3>
                        
                        <a class="btn btn-black btn-lg mt-5 hidden-sm-down trebuchet" href="About.jsp">
                            Read more
                        </a>
                    </div>
                    
                    <div class="col-md-7 pb-100">
                        <div>
                            <div style="font-family: Trebuchet MS, Helvetica, sans-serif;
                                 line-height: 150%;">
                                <div>
                                    MIK, <strong>Music for Idiotic Knucklehead</strong> 
                                    functions as a provider of music theories 
                                    I've studied for months, and encourages
                                    feedbacks and contributions from visitors 
                                    (it's y'all nuthead). Therefore, these
                                    theories can be more accurate and applicable
                                    to individual's use.
                                </div>   
                                
                                <div>&nbsp</div>
                                
                                <div>
                                    In the following years, our aim is to create an open environment
                                    of members for interactive forum, call for sponsorship from many sources,
                                    and impulse social range. 
                                </div>
                                
                                <div>&nbsp</div>
                                
                                <div>
                                    What we believe is that any person who has
                                    a heart and a soul of an artist is a living evidence of futuristic music cultivation
                                    for the country we represent.
                                </div>
                            </div>
                        </div>
                        
                        <a class="btn btn-black btn-lg mt-5 hidden-md-up trebuchet" href="About.jsp">
                            Read more
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
