<%-- 
    Document   : HomeContext
    Created on : Jun 27, 2020, 12:37:30 PM
    Author     : Admin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/HomeStyle.css" rel="stylesheet">
        <link href="css/EventsStyle.css" rel="stylesheet">
        <script src="js/EventsScript.js"></script>
        <%
            Event e = new Event();
        %>
    </head>
    <body>
        <section class="agenda-form">
            <form action="eventsSearch" method="get" enctype="multipart/form-data"
                  name="agenda_form" id="agenda_form">
                <div class="container">
                    <div class="row py-25">
                        <div class="col-5">
                            <h1 class="title text-light">Events</h1>
                        </div>
                        
                        <div class="col-5 text-right btn-show-filters-container">
                            <div class="btn btn-lg btn-show-filters trebuchet" onclick="toggleSearchBar()">
                                Search
                                <img src="images/icon/iconSearch.png" alt="Search" width="14">
                            </div>
                        </div>
                    </div>
                    
                    <div id="searchBarToggle" class="row filters trebuchet" style="display: none">
                        <div class="col-md-4 col-lg-3 pb-25">
                            <span class="text-bold">
                                From
                            </span>
                            
                            <div class="date" id="datetimepickerfrom">
                                <div class="bootstrap-datetimepicker-widget usetwentyfour">
                                    <ul class="list-unstyled">
                                        <li class="show">
                                            <div class="datepicker">
                                                <!--CALENDAR DAY-->
                                                <div class="datepicker-days" style="display: block;">
                                                    <table class="table table-sm">
                                                        <thead>
                                                            <tr>
                                                                <th class="prev" data-action="previous" onclick="previous()">
                                                                    <span class="fa" title="Previous Month">
                                                                        <img src="images/icon/iconChevronLeft.png" alt="Previous" width="9">
                                                                    </span>
                                                                </th>
                                                                <th class="picker-switch" data-action="pickerSwitch" colspan="5" title="Select Month">
                                                                    <span id="monthAndYear">
                                                                        <script>
                                                                            var today = new Date();
                                                                            var currentMonth = today.getMonth();
                                                                            var currentYear = today.getFullYear();
                                                                            months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

                                                                            monthAndYear = document.getElementById("monthAndYear");
                                                                            monthAndYear.innerHTML = months[currentMonth] + " " + currentYear;
                                                                        </script>
                                                                    </span>
                                                                </th>
                                                                <th class="next" data-action="next" onclick="next()">
                                                                    <span class="fa" title="Next Month">
                                                                        <img src="images/icon/iconChevronRight.png" alt="Next" width="9">
                                                                    </span>
                                                                </th>
                                                            </tr>
                                                            
                                                            <tr>
                                                                <th class="dow">Su</th>
                                                                <th class="dow">Mo</th>
                                                                <th class="dow">Tu</th>
                                                                <th class="dow">We</th>
                                                                <th class="dow">Th</th>
                                                                <th class="dow">Fr</th>
                                                                <th class="dow">Sa</th>
                                                            </tr>
                                                        </thead>
                                                        
                                                        <tbody id="calendar-body">

                                                        </tbody>
                                                    </table>
                                                </div>
                                                
                                                <script>
                                                    var today = new Date();
                                                    var currentMonth = today.getMonth();
                                                    var currentYear = today.getFullYear();
                                                    var firstDayCheck = true;
                                        //            var selectYear = document.getElementById("year");
                                        //            var selectMonth = document.getElementById("month");

                                                    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

                                                    monthAndYear = document.getElementById("monthAndYear");
                                                    showCalendar(currentMonth, currentYear);

                                                    function next() {
                                                        currentYear = (currentMonth === 11) ? currentYear + 1 : currentYear;
                                                        currentMonth = (currentMonth + 1) % 12;
                                                        showCalendar(currentMonth, currentYear);
                                                    }

                                                    function previous() {
                                                        currentYear = (currentMonth === 0) ? currentYear - 1 : currentYear;
                                                        currentMonth = (currentMonth === 0) ? 11 : currentMonth - 1;
                                                        showCalendar(currentMonth, currentYear);
                                                    }

                                                    function jump() {
                                                        currentYear = parseInt(selectYear.value);
                                                        currentMonth = parseInt(selectMonth.value);
                                                        showCalendar(currentMonth, currentYear);
                                                    }

                                                    function showCalendar(month, year) {
                                                        firstDay = (new Date(year, month)).getDay();

                                                        tbl = document.getElementById("calendar-body"); // body of the calendar

                                                        // clearing all previous cells
                                                        tbl.innerHTML = "";

                                                        // filing data about month and in the page via DOM.
                                                        monthAndYear.innerHTML = months[month] + " " + year;
                                        //                selectYear.value = year;
                                        //                selectMonth.value = month;

                                                        // creating all cells
                                                        date = 1;
                                                        calendarCount = 0;
                                                        for (i = 0; i < 6; i++) {
                                                            // creates a table row
                                                            row = document.createElement("tr");

                                                            //creating individual cells, filing them up with data.
                                                            for (j = 0; j < 7; j++) {
                                                                var weekendCheck=(j == 0 || j==6) ? " weekend" : "";             
                                                                var todayCheck="";
                                                                if(date==today.getDate() && month==today.getMonth()
                                                                        && year==today.getFullYear()){
                                                                    todayCheck=" today";
                                                                    
                                                                    if(firstDayCheck===true){
                                                                        todayCheck += " active";
                                                                    }
                                                                    firstDayCheck=false;
                                                                }
                                                                
                                                                cell = document.createElement("td");
                                                                cell.setAttribute("data-action","selectDay");
                                                                
                                                                calendarCount++;
                                                                cell.setAttribute("id",calendarCount);
                                                                cell.setAttribute("onclick","setActive('" + calendarCount + "')");
                                                                

                                                                if (i === 0 && j < firstDay) {
                                                                    var prevMonthDays =(currentMonth > 0) ?     
                                                                    daysInMonth(currentMonth-1,currentYear) : 31;
                                                                    var prevDays = firstDay-j-1;

                                                                    cell.setAttribute("class","day old" + weekendCheck);

                                                                    cellText = document.createTextNode(prevMonthDays-prevDays);
                                                                    cell.appendChild(cellText);
                                                                    row.appendChild(cell);
                                                                }
                                                                else if (date > daysInMonth(month, year)) {
                                                                    cell.setAttribute("class","day new" + weekendCheck);

                                                                    cellText = document.createTextNode(date-daysInMonth(month,year));
                                                                    cell.appendChild(cellText);
                                                                    row.appendChild(cell);

                                                                    date++;
                                                                }

                                                                else {
                                                                    cell.setAttribute("class","day" + weekendCheck + todayCheck);

                                                                    cellText = document.createTextNode(date);
                                                                    if (date === today.getDate() && year === today.getFullYear() && month === today.getMonth()) {
                                                                        cell.classList.add("bg-info");
                                                                    } // color today's date
                                                                    cell.appendChild(cellText);
                                                                    row.appendChild(cell);
                                                                    date++;
                                                                }
                                                                
                                                                cell.setAttribute("data-day",cellText);
                                                            }
                                                            tbl.appendChild(row); // appending each row into calendar body.
                                                        }
                                                    }

                                                    // check how many days in a month code from https://dzone.com/articles/determining-number-days-month
                                                    function daysInMonth(iMonth, iYear) {
                                                        return 32 - new Date(iYear, iMonth, 32).getDate();
                                                    }
                                                </script>
                                                
                                                <!--CALENDAR MONTH-->
                                                <div class="datepicker-months" style="display: none;">
                                                    <table class="table-condensed">
                                                        <thead>
                                                            <tr>
                                                                <th class="prev" data-action="previous">
                                                                    <span class="fa" title="Previous Year">
                                                                        <img src="images/icon/iconChevronLeft.png" alt="Previous" width="9">
                                                                    </span>
                                                                </th>
                                                                <th class="picker-switch" data-action="pickerSwitch" colspan="5" title="Select Year">
                                                                    2020
                                                                </th>
                                                                <th class="next" data-action="next">
                                                                    <span class="fa" title="Next Year">
                                                                        <img src="images/icon/iconChevronRight.png" alt="Next" width="9">
                                                                    </span>
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        
                                                        <tbody>
                                                            <tr>
                                                                <td colspan="7">
                                                                    <span data-action="selectMonth" class="month">
                                                                        Jan
                                                                    </span>
                                                                    <span data-action="selectMonth" class="month">
                                                                        Feb
                                                                    </span>
                                                                    <span data-action="selectMonth" class="month">
                                                                        Mar
                                                                    </span>
                                                                    <span data-action="selectMonth" class="month">
                                                                        Apr
                                                                    </span>
                                                                    <span data-action="selectMonth" class="month">
                                                                        May
                                                                    </span>
                                                                    <span data-action="selectMonth" class="month">
                                                                        Jun
                                                                    </span>
                                                                    <span data-action="selectMonth" class="month active">
                                                                        Jul
                                                                    </span>
                                                                    <span data-action="selectMonth" class="month">
                                                                        Aug
                                                                    </span>
                                                                    <span data-action="selectMonth" class="month">
                                                                        Sep
                                                                    </span>
                                                                    <span data-action="selectMonth" class="month">
                                                                        Oct
                                                                    </span>
                                                                    <span data-action="selectMonth" class="month">
                                                                        Nov
                                                                    </span>
                                                                    <span data-action="selectMonth" class="month">
                                                                        Dec
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                
                                                <!--CALENDAR YEAR-->
                                                <div class="datepicker-years" style="display: none;">
                                                    <table class="table-condensed">
                                                        <thead>
                                                            <tr>
                                                                <th class="prev" data-action="previous">
                                                                    <span class="fa" title="Previous Decade">
                                                                        <img src="images/icon/iconChevronLeft.png" alt="Previous" width="9">
                                                                    </span>
                                                                </th>
                                                                <th class="picker-switch" data-action="pickerSwitch" colspan="5" title="Select Decade">
                                                                    2020-2029
                                                                </th>
                                                                <th class="next" data-action="next">
                                                                    <span class="fa" title="Next Decade">
                                                                        <img src="images/icon/iconChevronRight.png" alt="Next" width="9">
                                                                    </span>
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        
                                                        <tbody>
                                                            <tr>
                                                                <td colspan="7">
                                                                    <span data-action="selectYear" class="year old">
                                                                        2019
                                                                    </span>
                                                                    <span data-action="selectYear" class="year active">
                                                                        2020
                                                                    </span>
                                                                    <span data-action="selectYear" class="year">
                                                                        2021
                                                                    </span>
                                                                    <span data-action="selectYear" class="year">
                                                                        2022
                                                                    </span>
                                                                    <span data-action="selectYear" class="year">
                                                                        2023
                                                                    </span>
                                                                    <span data-action="selectYear" class="year">
                                                                        2024
                                                                    </span>
                                                                    <span data-action="selectYear" class="year">
                                                                        2025
                                                                    </span>
                                                                    <span data-action="selectYear" class="year">
                                                                        2026
                                                                    </span>
                                                                    <span data-action="selectYear" class="year">
                                                                        2027
                                                                    </span>
                                                                    <span data-action="selectYear" class="year">
                                                                        2028
                                                                    </span>
                                                                    <span data-action="selectYear" class="year">
                                                                        2029
                                                                    </span>
                                                                    <span data-action="selectYear" class="year old">
                                                                        2030
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                
                                                <!--CALENDAR DECADE-->
                                                <div class="datepicker-decades" style="display: none;">
                                                    <table class="table-condensed">
                                                        <thead>
                                                            <tr>
                                                                <th class="prev" data-action="previous">
                                                                    <span class="fa" title="Previous Century">
                                                                        <img src="images/icon/iconChevronLeft.png" alt="Previous" width="9">
                                                                    </span>
                                                                </th>
                                                                <th class="picker-switch" data-action="pickerSwitch" colspan="5">
                                                                    2000-2090
                                                                </th>
                                                                <th class="next" data-action="next">
                                                                    <span class="fa" title="Next Century">
                                                                        <img src="images/icon/iconChevronRight.png" alt="Next" width="9">
                                                                    </span>
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        
                                                        <tbody>
                                                            <tr>
                                                                <td colspan="7">
                                                                    <span data-action="selectDecade" class="decade old" data-selection="2006">
                                                                        1990
                                                                    </span>
                                                                    <span data-action="selectDecade" class="decade" data-selection="2006">
                                                                        2000
                                                                    </span>
                                                                    <span data-action="selectDecade" class="decade active" data-selection="2016">
                                                                        2010
                                                                    </span>
                                                                    <span data-action="selectDecade" class="decade" data-selection="2026">
                                                                        2020
                                                                    </span>
                                                                    <span data-action="selectDecade" class="decade" data-selection="2036">
                                                                        2030
                                                                    </span>
                                                                    <span data-action="selectDecade" class="decade" data-selection="2046">
                                                                        2040
                                                                    </span>
                                                                    <span data-action="selectDecade" class="decade" data-selection="2056">
                                                                        2050
                                                                    </span>
                                                                    <span data-action="selectDecade" class="decade" data-selection="2066">
                                                                        2060
                                                                    </span>
                                                                    <span data-action="selectDecade" class="decade" data-selection="2076">
                                                                        2070
                                                                    </span>
                                                                    <span data-action="selectDecade" class="decade" data-selection="2086">
                                                                        2080
                                                                    </span>
                                                                    <span data-action="selectDecade" class="decade" data-selection="2096">
                                                                        2090
                                                                    </span>
                                                                    <span data-action="selectDecade" class="decade old" data-selection="2106">
                                                                        2100
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            
                            <input type="hidden" id="date" name="date" 
                                class="form-control datetimepicker-input" 
                                data-target="#datetimepickerfrom" data-toggle="datetimepicker" 
                                value="${todayDate}">
                        </div>
                        
                        <!--INFO INPUT-->
                        <div class="col-md-8 col-lg-9 pb-25">
                            <div class="row">
                                <div class="col-md-5 col-lg-6 col-xl-12">
                                    <span class="text-bold">Artist, event title</span>
                                    <div class="form-group">
                                        <div class="input-group">                                            
                                            <span class="input-group-addon">
                                                <i class="fa fa-fw text-green">
                                                    <img src="images/icon/iconSearchLightPurple.png" alt="Search" width="16">
                                                </i>
                                            </span>
                                            <input class="form-control" type="text" name="title" id="title" value="" >
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-5 col-lg-6">
                                    <span class="text-bold">Location</span>
                                    <div class="form-group">
                                        <div class="input-group">                                            
                                            <span class="input-group-addon">
                                                <i class="fa fa-fw text-green">
                                                    <img src="images/icon/iconLocationLightPurple.png" alt="Location" width="16" >
                                                </i>
                                            </span>
                                            <input class="form-control" type="text" name="place" id="place" value="" >
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-5 col-lg-6">
                                    <span class="text-bold">Place</span>
                                    <div class="form-group">
                                        <div class="input-group">                                            
                                            <span class="input-group-addon">
                                                <i class="fa fa-fw text-green">
                                                    <img src="images/icon/iconPlaceLightPurple.png" alt="Place" width="14">
                                                </i>
                                            </span>
                                            <input class="form-control" type="text" name="location" id="location" value="" >
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-5 col-lg-6">
                                    <span class="text-bold">Style</span>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon">
                                                <i class="fa fa-fw text-green" style="margin-bottom: -2px">
                                                    <img src="images/icon/iconStyleLightPurple.png" alt="Style" width="16">
                                                </i>
                                            </span>
                                            <select name="style_dropdown" class="form-control" style="width:100%;">
                                                <option value="999">ANY STYLES</option>
                                                <%
                                                    ArrayList<String[]> listStyle = e.getListEventStyle();

                                                    for(String[] style: listStyle){
                                                        out.println("<option value='" + style[0] + "'> " + style[1] +"</option>");
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-5 col-md-5 col-lg-6 col-xl-3">
                                    <span class="text-bold">Free entrance</span>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div id="freeEntranceToggle" class="toggle btn btn-default off" data-toggle="toggle" 
                                                 style="width: 100%; height: 0px;" onclick="toggleButtonEntrance()">      
                                                <input type="hidden" id="free_entry" name="free_entry" 
                                                    class="form-control" value="No matter">
                                                <div class="toggle-group">
                                                    <label class="btn btn-primary toggle-on">Yes</label>
                                                    <label class="btn btn-default active toggle-off">No matter</label>
                                                    <span class="toggle-handle btn btn-default"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-5 col-md-5 col-lg-6 col-xl-3">
                                    <span class="text-bold">Dinner &amp; concert</span>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div id="occasionToggle" class="toggle btn btn-default off" data-toggle="toggle" 
                                                 style="width: 100%; height: 0px;" onclick="toggleButtonOccasion()">
                                                <input type="hidden" id="dinner" name="dinner" 
                                                    class="form-control" value="No matter">    
                                                <div class="toggle-group">
                                                    <label class="btn btn-primary toggle-on">Yes</label>
                                                    <label class="btn btn-default active toggle-off">No matter</label>
                                                    <span class="toggle-handle btn btn-default"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!--APPLY BUTTON-->
                        <div class="col-12 pb-50 text-center">
                            <button type="submit" class="btn btn-lg btn-white trebuchet" name="apply">
                                Apply 
                            </button>
                        </div>
                    </div>
                </div>                
            </form>
        </section>
        
        <section class="contact-map-section">
<!--            <div id="geo-map-container">
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
                                            MIK Network<br> 
                                            <span class="text-thin">
                                                events
                                            </span>
                                        </span>
                                    </h3>
                                    
                                    <a class="btn btn-white mt-4" href="#">
                                        Find your places 
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>-->
            
            <div id="map"></div> 
            <input type="hidden" name="myLat" id="myLat" value="0">
            <input type="hidden" name="myLng" id="myLng" value="0">
            <span name="myLat" id="myLat" content="0"></span>
            <span name="myLng" id="myLng" content="0"></span>
            <%
                out.println("<script>");
                out.println("   function initMap() {");
                ArrayList<Event> eventPlacesLongLat = e.getPlaceLongLat();
                int count=0;
                float latSum = 0;
                float longSum = 0;

                for(Event item: eventPlacesLongLat){
                    count++;
                    latSum += item.getEventLatitude();
                    longSum += item.getEventLongitude();
                }
  
                out.println("       var map = new google.maps.Map(document.getElementById('map'),{");
                out.println("           zoom: 5,");
                out.println("           center: {lat:" + latSum/count + ", lng: " + longSum/count + "},");
                out.println("       });");
                out.println("       infoWindow = new google.maps.InfoWindow;");

                out.println("       var marker1 = new google.maps.Marker({");
                out.println("           map: map,");
                out.println("           title: 'YOU ARE HERE',");
                out.println("           animation: google.maps.Animation.BOUNCE");
                out.println("       });\n");

                out.println("       if (navigator.geolocation) {");
                out.println("           navigator.geolocation.getCurrentPosition(function(position) {");
                out.println("               var pos = {");
                out.println("                   lat: position.coords.latitude,");
                out.println("                   lng: position.coords.longitude");
                out.println("               };");

                out.println("               infoWindow.setPosition(pos);");
                out.println("               infoWindow.setContent('YOU ARE HERE');");
                out.println("               infoWindow.open(map);");
                out.println("               map.setCenter(pos);");
                out.println("               map.setZoom(15);");
                out.println("               marker1.setPosition(pos);");
                out.println("               importLatLng(pos.lat, pos.lng);");
                out.println("           }, function() {");
                out.println("               handleLocationError(true, infoWindow, map.getCenter());");
                out.println("           });");
                out.println("       } else {");
                // Browser doesn't support Geolocation
                out.println("           handleLocationError(false, infoWindow, map.getCenter());");
                out.println("       }");

                for(Event item: eventPlacesLongLat){
                    out.println("   var place" + item.getEventPlaceId() + " = {lat: "
                            + item.getEventLatitude() + ", lng: " + item.getEventLongitude() + "};");

                    out.println("   var marker = new google.maps.Marker({");
                    out.println("       position: place" + item.getEventPlaceId() + ",");
                    out.println("       map: map,");
                    out.println("       title: \"" + item.getEventPlace() + "\"");
                    out.println("   });\n");        
                }
                out.println("   }");
                    
                    
                out.println("   function handleLocationError(browserHasGeolocation, infoWindow, pos) {");
                out.println("       infoWindow.setPosition(pos);");
                out.println("       infoWindow.setContent(browserHasGeolocation ?");
                out.println("           'Error: The Geolocation service failed.' :");
                out.println("           'Error: Your browser does not support geolocation.');");
                out.println("       infoWindow.open(map);");
                out.println("   }");
                    
                out.println("   function importLatLng(latitude, longitude){");
                out.println("       document.getElementById('myLat').content=latitude;");
                out.println("       document.getElementById('myLng').content=longitude;");
                out.println("   }");    
                out.println("</script>");
            %>

            <script async="" defer="" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCSltyvF9WM_92supNsKaL-SmvKzC2BGgU&amp;callback=initMap">
            </script>
        </section>
                                            
        <section class="agenda-concerts test bg-white">
            <a name="results" style="position:absolute; top:-90px;"></a>
            
            <div class="container pb-50">
                <div class="row">
                    <div class="col-lg-9 pr-lg-5 py-50">
                        <div class="row concerts-feed" id="events-content">
                            <%                                                    
                                ArrayList<Date> listDate = e.getEventDateFromToday();
                                if(request.getAttribute("eventsFound")!=null){
                                    listDate.clear();
                                    listDate.add((Date)request.getAttribute("eventsDate"));
                                }
                                
                                for(Date eventDate: listDate){  
                                    if((request.getAttribute("eventsFound")!=null 
                                            && ((ArrayList<Event>)request.getAttribute("eventsFound")).isEmpty())
                                            || e.getListEventByDate(eventDate).isEmpty()){
                                        out.println("<div class='col-12 concerts-items'>");
                                            out.println("<div id='sticky-wrapper' class='sticky-wrapper mb-2' " +
                                                "style='height: 64px;'>");
                                                out.println("<h2 class='text-light text-green bg-white " +
                                                    "pt-25 mb-2'>");
                                                    out.println("<span class='trebuchet text-thin'>");
                                                        out.println("No requested events found on " + e.getEventDateNormalized(eventDate));
                                                    out.println("</span>"); 
                                                out.println("</h2>");
                                            out.println("</div>");
                                        out.println("</div>");
                                    } else {
                                        out.println("<div class='col-12 concerts-items'>");
                                            out.println("<div id='sticky-wrapper' class='sticky-wrapper mb-2' " +
                                                "style='height: 64px;'>");
                                                out.println("<h2 class='text-light text-green day-concert bg-white " +
                                                    "pt-25 mb-2'>");
                                                    out.println("<span class='trebuchet text-thin'>");
                                                        out.println(e.getEventDateNormalized(eventDate));
                                                    out.println("</span>"); 

                                                    out.println("<a href='/Assignment1/events?view=list'>");
                                                        out.println("<i class='fa pull-right'>");
                                                            out.println("<img src='images/icon/iconViewListPurple.png' alt='List' width='25'>");
                                                        out.println("</i>");
                                                    out.println("</a>");

                                                    out.println("<a href='/Assignment1/events?view=grid'>");
                                                        out.println("<i class='fa pull-right'>");
                                                            out.println("<img src='images/icon/iconViewGridPurple.png' alt='Grid' width='25'>");
                                                        out.println("</i>");
                                                    out.println("</a>");

                                                out.println("</h2>");
                                            out.println("</div>");
                                        out.println("</div>");

                                        ArrayList<Event> listEvent = e.getListEventByDate(eventDate);
                                        if(request.getAttribute("eventsFound")!=null){
                                            listEvent = (ArrayList<Event>) request.getAttribute("eventsFound");
                                        }
                                        Calendar c = Calendar.getInstance();

                                        String view = (request.getParameter("view")!=null) 
                                                ? request.getParameter("view") : "";

                                        for(Event event: listEvent){
                                            //LIST VIEW
                                            if(view.equalsIgnoreCase("list")){
                                                out.println("<div class='col-md-12 mt-3 concerts-items' itemscope='' "
                                                        + "itemtype='http://schema.org/Event'>");
                                                    out.println("<a class='row concert no-gutters box list trebuchet' itemprop='url' " 
                                                            + "href='info?eventId=" + event.getEventTempId() + "'>");
                                                        out.println("<div class='col-3 col-sm-2'>");
                                                            out.println("<div class='concert-hour py-2 px-0 text-medium' itemprop='startDate' "
                                                                    + "content='" + event.getEventTime() + "'>");
                                                                out.println("<i class='fa'>");
                                                                    out.println("<img src='images/icon/iconTimeWhite.png' alt='Time' "
                                                                            + "style='margin-bottom: 4px;width: 15px!important'>");
                                                                out.println("</i>"); 

                                                                c.setTime(event.getEventTime());
        

                                                                String hour = Integer.toString(c.get(Calendar.HOUR_OF_DAY));
                                                                if(hour.length()==1)hour = "0" + hour; 
                                                                String min = Integer.toString(c.get(Calendar.MINUTE));
                                                                if(min.length()==1) min = "0" + min; 

                                                                out.println(hour + ":" + min);
                                                            out.println("</div>");

                                                            out.println("<div class='img-container'>");
                                                                out.println("<div class='img-overlay'></div>");
                                                                out.println("<img alt='" + event.getEventName() + "' src='images/events/" + event.getEventimagePath()
                                                                        + "' itemprop='image' style='z-index: -1'>");
                                                            out.println("</div>");
                                                        out.println("</div>");

                                                        out.println("<div class='col-9 col-sm-10'>");
                                                            out.println("<div class='concert-infos mx-3 my-2'>");
                                                                out.println("<h4 class='text-bold text-dark' itemprop='name'>");
                                                                    out.println(event.getEventName());
                                                                out.println("</h4>");

                                                                out.println("<span itemprop='description' content='" + event.getEventName() + "'></span>");
                                                                out.println("<span itemprop='endDate' content=''></span>");
                                                                out.println("<span itemprop='isAccessibleForFree' content='true'></span>");
                                                                out.println("<span itemprop='performer' itemscope='' itemtype='http://schema.org/Person'>");
                                                                    out.println("<span itemprop='name' content=''></span>");
                                                                out.println("</span>");        
                                                            out.println("</div>");

                                                            out.println("<span itemprop='location' itemscope='' itemtype='http://schema.org/Place'>");
                                                                out.println("<div class='concert-infos text-regular mx-3'>");
                                                                    out.println("<span class='info'>");
                                                                        out.println("<i class='fa fa-fw text-ocre'>");
                                                                            out.println("<img src='images/icon/iconPlacePurple.png' alt='Place' height='18'>");
                                                                        out.println("</i>");
                                                                        out.println("&nbsp;<span itemprop='name'>" + event.getEventPlace() + "</span>");
                                                                    out.println("</span>");

                                                                    out.println("<span itemprop='url' content=''></span>");
                                                                    out.println("<span class='text-nowrap info' style='width: 2%' itemprop='address' "
                                                                            + "content='" + event.getEventLocation() + "'>");
                                                                        out.println("<i class='fa fa-fw text-ocre'>");
                                                                            out.println("<img src='images/icon/iconLocationPurple.png' alt='Location' height='16'>");
                                                                        out.println("</i>");
                                                                        out.println("&nbsp;" + event.getEventLocation());
                                                                    out.println("</span>");
    //                                                                <span itemprop='address' itemscope='' itemtype='http://schema.org/PostalAddress'>
    //                                                                        <span itemprop='streetAddress' content='Quai de l'Hôtel de Ville, Port des Célestins au pied du pont Marie.'></span>
    //                                                                        <span itemprop='addressLocality' content='Paris 4ème'></span>
    //                                                                        <span itemprop='addressCountry' content='France'></span>
    //                                                                        <span itemprop='postalCode' content='75004'></span>
    //                                                                </span>
    //                                                                <span itemprop='geo' itemscope='' itemtype='http://schema.org/GeoCoordinates'>
    //                                                                        <span itemprop='latitude' content='48.853314'></span>
    //                                                                        <span itemprop='longitude' content='2.3568769999999404'></span>
    //                                                                </span>
                                                                out.println("</div>");
                                                            out.println("</span>");

                                                            out.println("<span itemprop='offers' itemscope='' itemtype='http://schema.org/Offer'>");
                                                                out.println("<span itemprop='url' content=''></span>");
                                                                out.println("<span itemprop='availability' content=''></span>");
                                                                out.println("<span itemprop='validFrom' content=''></span>");
                                                                out.println("<div class='concert-infos text-regular mx-3 mb-2'>");
                                                                    out.println("<span class='info'>");
                                                                        out.println("<i class='fa fa-fw text-ocre'>");
                                                                            out.println("<img src='images/icon/iconStylePurple.png' alt='Style' height='17'>");
                                                                        out.println("</i>");
                                                                        out.println("&nbsp;" + event.getEventStyle());
                                                                    out.println("</span>");												

                                                                    out.println("<span class='text-nowrap info' itemprop='price' content='0'>");
                                                                        out.println("<i class='fa fa-fw text-ocre' itemprop='priceCurrency' content=''>");
                                                                            out.println("<img src='images/icon/iconCurrencyPurple.png' alt='Currency' height='17'>");
                                                                        out.println("</i>");
                                                                        out.println("&nbsp;" + event.getEventPrice());
                                                                    out.println("</span>");

                                                                    if(event.getEventOccasion().trim().length() != 0){
                                                                        out.println("<span class='text-nowrap'>");
                                                                            out.println("<i class='fa fa-fw text-ocre'>");
                                                                                out.println("<img src='images/icon/iconOccasionPurple.png' alt='Occasion' height='17'>");
                                                                            out.println("</i>");
                                                                            out.println("&nbsp;" + event.getEventOccasion());
                                                                        out.println("</span>");
                                                                    }
                                                                out.println("</div>");
                                                            out.println("</span>");
                                                        out.println("</div>");
                                                    out.println("</a>");
                                                out.println("</div>");
                                            }else{
                                                //GRID VIEW
                                                out.println("<div class='col-md-6 mb-5 concerts-item' itemscope "+
                                                    "itemtype='http://schema.org/Event'>");
                                                    out.println("<a class='row concert mt-3 no-gutters box' itemprop='url' " 
                                                            + "href='info?eventId=" + event.getEventTempId() + "' style='height: 100%;'>");
                                                        out.println("<div class='col-12 img-container trebuchet'>");
                                                            out.println("<div class='concert-hour py-2 px-3' itemprop='startDate'");
                                                                out.println("<i class='fa'>");
                                                                    out.println("<img src='images/icon/iconTimeWhite.png' alt='Time' style='margin-bottom: 2.5px;' width='20'>");
                                                                out.println("</i>");

                                                                c.setTime(event.getEventTime());

                                                                String hour = Integer.toString(c.get(Calendar.HOUR_OF_DAY));
                                                                if(hour.length()==1)hour = "0" + hour; 
                                                                String min = Integer.toString(c.get(Calendar.MINUTE));
                                                                if(min.length()==1) min = "0" + min; 

                                                                out.println(hour + ":" + min);
                                                            out.println("</div>");

                                                            out.println("<div class='img-overlay'></div>");

                                                            out.println("<div class='img-sub-container'>");
                                                                out.println("<img class='img' alt='Event Picture' src='images/events/" + event.getEventimagePath() +"' " +
                                                                     "itemprop='image'>");
                                                            out.println("</div>");
                                                        out.println("</div>");

                                                        out.println("<div class='col-12 mt-4 trebuchet' style='line-height: 30px;'>");
                                                            out.println("<div class='concert-infos mb-3'>");
                                                                out.println("<h3 class='text-black text-dark trebuchet' itemprop='name'>");
                                                                    out.println(event.getEventName());
                                                                out.println("</h3>");
                                                            out.println("</div>");

                                                            out.println("<span itemprop='location' itemscope itemtype='http://schema.org/Place'>");
                                                                out.println("<div class='concert-infos text-regular'>");
                                                                    out.println("<span class='info'>");
                                                                        out.println("<i class='fa fa-fw text-ocre'>");
                                                                            out.println("<img src='images/icon/iconPlacePurple.png' alt='Place' height='18'>");
                                                                        out.println("</i>");                                                    
                                                                        out.println("<span itemprop='name'>" + event.getEventPlace() + "</span>");                                   
                                                                    out.println("</span>");

                                                                    out.println("<br>");

                                                                    out.println("<span class='text-nowrap info' itemprop='address' "+
                                                                            "content='" + event.getEventLocation() +"'>");
                                                                        out.println("<i class='fa fa-fw text-ocre'>");
                                                                            out.println("<img src='images/icon/iconLocationPurple.png' alt='Location' height='16'>");
                                                                        out.println("</i>");                                                   
                                                                        out.println(event.getEventLocation());
                                                                    out.println("</span>");              
                                                                out.println("</div>");
                                                            out.println("</span>");

                                                            out.println("<span itemprop='offers' itemscope itemtype='http://schema.org/Offer'>");
                                                                out.println("<div class='concert-infos text-regular'>");
                                                                    out.println("<span class='info'>");
                                                                        out.println("<i class='fa fa-fw text-ocre'>");
                                                                            out.println("<img src='images/icon/iconStylePurple.png' alt='Style' height='17'>");
                                                                        out.println("</i>");
                                                                        out.println(event.getEventStyle());
                                                                    out.println("</span>");

                                                                    out.println("<span class='text-nowrap info' " + 
                                                                          "itemprop='price' content='0'>");
                                                                        out.println("<i class='fa fa-fw text-ocre' itemprop='priceCurrency' content='VND'>");
                                                                            out.println("<img src='images/icon/iconCurrencyPurple.png' alt='Currency' height='17'>");
                                                                        out.println("</i>");
                                                                        out.println(event.getEventPrice());
                                                                    out.println("</span>");

                                                                    if(event.getEventOccasion().trim().length() != 0){
                                                                        out.println("<br>");

                                                                        out.println("<span class='text-nowrap'>");
                                                                            out.println("<i class='fa fa-fw text-ocre'>");
                                                                                out.println("<img src='images/icon/iconOccasionPurple.png' alt='Occasion' height='17'>");
                                                                            out.println("</i>");
                                                                            out.println(event.getEventOccasion());
                                                                        out.println("</span>");
                                                                    }

                                                                out.println("</div>");
                                                            out.println("</span>");
                                                        out.println("</div>");
                                                    out.println("</a>");
                                                out.println("</div>");
                                            }
                                        }
                                    }
                                    
                                }
                            %>                  
                        </div>
                    </div>
                </div>
            </div>
        </section>
                     
        <%
            //Show related events of chosen day
            if(request.getParameter("apply")!=null){
                out.println("<section class='concerts-section bg-grey-dark pt-75'>");          
                    out.println("<div class='container'>");
                        out.println("<div class='row'>");
                            out.println("<div class='col pb-5 text-center'>");
                                out.println("<h2 class='text-black text-uppercase title trebuchet text-color-invert' "
                                        + "style='font-size: xx-large'>");
                                    out.println("Related upcoming events");
                                out.println("</h2>");
                            out.println("</div>");
                        out.println("</div>");

                        out.println("<div class='row'>");
                            out.println("<div class='col'>");
                                out.println("<div class='card-deck'>");
                                String d = request.getParameter("date");
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
                                Date date = sdf.parse(d); 

                                String title = request.getParameter("title");
                                String place = request.getParameter("place");
                                String location = request.getParameter("location");

                                String style = request.getParameter("style_dropdown");

                                String freeEntry = request.getParameter("free_entry");
                                String dinner = request.getParameter("dinner"); 
                                
//                                ArrayList<Event> listEvent = e.getRecommendedEvents(new Event(title, freeEntry, place, location, date, style , dinner));
                                ArrayList<Event> listEvent = new ArrayList<Event>();
                                if(request.getParameter("myLat")!=null && request.getParameter("myLng")!=null){
                                    listEvent = e.getNearestEvents(date,
                                        Float.parseFloat(request.getParameter("myLat")),
                                        Float.parseFloat(request.getParameter("myLng"))
                                    );
                                }
                                System.out.println(request.getParameter("myLat"));
                                //Lap va hien thi tung ham ket qua
                                int itemCounted = 0;
                                for(Event item: listEvent){
                                    if(itemCounted == 4) break;
                                    
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
                                                
                                                out.println("<div style='line-height: 120%; font-size: large'>");
                                                    out.println("<i class='fa'>");
                                                        out.println("<img src='images/icon/iconDistanceBlack.png' alt='distance' style='width: 20px!important'>");
                                                    out.println("</i>");
                                                    out.println(item.getDistance() + "km");
                                                out.println("</div>");
                                            out.println("</div>");
                                        out.println("</a>");
                                    out.println("</div>");
                                    
                                    itemCounted++;
                                }

                                out.println("</div>");
                            out.println("</div>");
                        out.println("</div>");

                        out.println("<div class='row'>");
                            out.println("<div class='col text-center pb-75'>");
                                out.println("<a class='btn btn-black btn-lg mt-5 bg-grey trebuchet' href='events'>");
                                    out.println("All events");
                                out.println("</a>");
                            out.println("</div>");
                        out.println("</div>");
                    out.println("</div>");
                out.println("</section>");
            }                   
        %>  
                        
    </body>
</html>
