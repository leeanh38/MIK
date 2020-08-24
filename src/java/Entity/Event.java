/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import Model.DBContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

/**
 *
 * @author Admin
 */
public class Event {

    private String eventName;
    private String eventPrice;
    private int eventPlaceId;
    private String eventPlace;
    private String eventLocation;
    private float eventLatitude;
    private float eventLongitude;
    private Date eventTime;
    private String eventStyle;
    private String eventOccasion;
    private String eventimagePath;
    private String eventLink;
    private int eventTempId;
    private float distance;
    
    private Connection cnn;
    private Statement stm;
    private ResultSet rs;

    public Event() {
        try{
            cnn = (new DBContext().getConnection());
            System.out.println("Connect Successfully");
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
        } catch (Exception e) {
            System.out.println("Connect failed: " + e.getMessage());
        }
    }

    public Event(int eventPlaceId, String eventPlace, String eventLocation,float eventLatitude, float eventLongitude) {
        this.eventPlaceId = eventPlaceId;
        this.eventPlace = eventPlace;
        this.eventLocation = eventLocation;
        this.eventLatitude = eventLatitude;
        this.eventLongitude = eventLongitude;
        
        try{
            cnn = (new DBContext().getConnection());
            System.out.println("Connect Successfully");
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
        } catch (Exception e) {
            System.out.println("Connect failed: " + e.getMessage());
        }
    }

    public Event(String eventName, String eventPrice, String eventPlace, String eventLocation, Date eventTime, String eventStyle, String eventOccasion) {
        this.eventName = eventName;
        this.eventPrice = eventPrice;
        this.eventPlace = eventPlace;
        this.eventLocation = eventLocation;
        this.eventTime = eventTime;
        this.eventStyle = eventStyle;
        this.eventOccasion = eventOccasion;
        
        try{
            cnn = (new DBContext().getConnection());
            System.out.println("Connect Successfully");
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
        } catch (Exception e) {
            System.out.println("Connect failed: " + e.getMessage());
        }
    }

    public Event(String eventName, String eventPrice, String eventPlace, String eventLocation, Date eventTime
            , String eventStyle, String eventOccasion, String eventimagePath, String eventLink, int eventTempId) {
        this.eventName = eventName;
        this.eventPrice = eventPrice;
        this.eventPlace = eventPlace;
        this.eventLocation = eventLocation;
        this.eventTime = eventTime;
        this.eventStyle = eventStyle;
        this.eventOccasion = eventOccasion;
        this.eventimagePath = eventimagePath;
        this.eventLink = eventLink;
        this.eventTempId = eventTempId;
        
        try{
            cnn = (new DBContext().getConnection());
            System.out.println("Connect Successfully");
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
        } catch (Exception e) {
            System.out.println("Connect failed: " + e.getMessage());
        }
    }
    
    public Event(String eventName, String eventPrice, int eventPlaceId, String eventPlace, String eventLocation, Date eventTime
            , String eventStyle, String eventOccasion, String eventimagePath, String eventLink, int eventTempId) {
        this.eventName = eventName;
        this.eventPrice = eventPrice;
        this.eventPlaceId = eventPlaceId;
        this.eventPlace = eventPlace;
        this.eventLocation = eventLocation;
        this.eventTime = eventTime;
        this.eventStyle = eventStyle;
        this.eventOccasion = eventOccasion;
        this.eventimagePath = eventimagePath;
        this.eventLink = eventLink;
        this.eventTempId = eventTempId;
        
        try{
            cnn = (new DBContext().getConnection());
            System.out.println("Connect Successfully");
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
        } catch (Exception e) {
            System.out.println("Connect failed: " + e.getMessage());
        }
    }
    
    public Event(String eventName, String eventPrice, String eventPlace, String eventLocation, Date eventTime
            , String eventStyle, String eventOccasion, String eventimagePath, String eventLink, int eventTempId, float distance) {
        this.eventName = eventName;
        this.eventPrice = eventPrice;
//        this.eventPlaceId = eventPlaceId;
        this.eventPlace = eventPlace;
        this.eventLocation = eventLocation;
        this.eventTime = eventTime;
        this.eventStyle = eventStyle;
        this.eventOccasion = eventOccasion;
        this.eventimagePath = eventimagePath;
        this.eventLink = eventLink;
        this.eventTempId = eventTempId;
        this.distance = distance;
        
        try{
            cnn = (new DBContext().getConnection());
            System.out.println("Connect Successfully");
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
        } catch (Exception e) {
            System.out.println("Connect failed: " + e.getMessage());
        }
    }
      
    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getEventPrice() {
        return eventPrice;
    }

    public void setEventPrice(String eventPrice) {
        this.eventPrice = eventPrice;
    }

    public String getEventPlace() {
        return eventPlace;
    }

    public void setEventPlace(String eventPlace) {
        this.eventPlace = eventPlace;
    }

    public String getEventLocation() {
        return eventLocation;
    }

    public void setEventLocation(String eventLocation) {
        this.eventLocation = eventLocation;
    }

    public Date getEventTime() {
        return eventTime;
    }

    public void setEventTime(Date eventTime) {
        this.eventTime = eventTime;
    }

    public String getEventStyle() {
        return eventStyle;
    }

    public void setEventStyle(String eventStyle) {
        this.eventStyle = eventStyle;
    }

    public String getEventOccasion() {
        return eventOccasion;
    }

    public void setEventOccasion(String eventOccasion) {
        this.eventOccasion = eventOccasion;
    }

    public String getEventimagePath() {
        return eventimagePath;
    }

    public void setEventimagePath(String eventimagePath) {
        this.eventimagePath = eventimagePath;
    }

    public String getEventLink() {
        return eventLink;
    }

    public void setEventLink(String eventLink) {
        this.eventLink = eventLink;
    }

    public int getEventTempId() {
        return eventTempId;
    }

    public void setEventTempId(int eventTempId) {
        this.eventTempId = eventTempId;
    }

    public int getEventPlaceId() {
        return eventPlaceId;
    }

    public void setEventPlaceId(int eventPlaceId) {
        this.eventPlaceId = eventPlaceId;
    }

    public float getEventLatitude() {
        return eventLatitude;
    }

    public void setEventLatitude(float eventLatitude) {
        this.eventLatitude = eventLatitude;
    }

    public float getEventLongitude() {
        return eventLongitude;
    }

    public void setEventLongitude(float eventLongitude) {
        this.eventLongitude = eventLongitude;
    }

    public float getDistance() {
        return distance;
    }

    public void setDistance(float distance) {
        this.distance = distance;
    }

    public ArrayList<Event> getHomeEvents () {
        ArrayList<Event> list = new ArrayList<>();
        try {
            //Lay danh sach user trong bang tblUser
            rs=stm.executeQuery("SELECT TOP 8 e.name,e.price, e.place, e.location, e.time,es.styleName,e.occasion, e.image, e.link, e.TempID,\n"
                    + "FROM tblEvent e, tblEventStyle es\n"
                    + "where e.styleId = es.styleId and e.time > GETDATE()\n"
                    + "order by e.time ASC"); 
            while(rs.next()){
                String name=rs.getString(1);
                String price=rs.getString(2);
                String place=rs.getString(3);
                String location=rs.getString(4);
                
                Timestamp timestamp = rs.getTimestamp(5);
                
                Date time = new Date(timestamp.getTime());
                String style=rs.getString(6);
                String occasion=rs.getString(7);
                String imagePath=rs.getString(8);
                String link = rs.getString(9);
                int id=rs.getInt(10);
                
                list.add(new Event(name, price, place, location, time, style, occasion, imagePath, link, id));
            }
        } catch (Exception e) {
            System.out.println("getHomeEvents error: " + e.getMessage());
        }
        return list;
    }
    
    public ArrayList<Event> getPlaceLongLat(){
        ArrayList<Event> list = new ArrayList<>();
        try {
            //Lay danh sach user trong bang tblUser
            rs=stm.executeQuery("SELECT * FROM tblEventPlaces");
            while(rs.next()){
                int id=rs.getInt(1);
                String name = rs.getString(2);
                String place = rs.getString(3);
                float latitude = rs.getFloat(4);
                float longitude = rs.getFloat(5);
                
                list.add(new Event(id, name, place, latitude, longitude));
            }
        } catch (Exception e) {
            System.out.println("getPlaceLongLat error: " + e.getMessage());
        }
        
        return list;
    }
    
    public ArrayList<Event> getRecommendedEvents (Event eventInfo) {
        ArrayList<Event> list = new ArrayList<>();
        
        String searchTitle = "", searchLocation="", searchPlace="", searchStyle="", searchPrice="",
                searchOccasion="";
        
        Date searchDateRaw = eventInfo.getEventTime();
        Calendar c = Calendar.getInstance();
        c.setTime(searchDateRaw);
        c.add(Calendar.DATE, 1);
        searchDateRaw = c.getTime();
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String searchDateAfter = formatter.format(searchDateRaw);
        String searchDateBefore = formatter.format(eventInfo.getEventTime());
        
        String[] wordArray;
        
        if(!eventInfo.getEventStyle().trim().equalsIgnoreCase("999")){
            searchStyle = " e.styleId = " + eventInfo.getEventStyle().trim();
        } 
//        else if(eventInfo.getEventName().trim()!=("")){
//            searchTitle = " AND (";
//            wordArray = eventInfo.getEventName().split("\\s");
//            
//            for(int i = 0; i < wordArray.length; i++){
//                if(i != 0) searchTitle += " OR"; 
//                searchTitle += " lower(e.name) like lower('%" + wordArray[i] + "%'";
//            }
//            searchTitle = ")";
//        } else if(eventInfo.getEventPlace().trim()!=""){
//            searchPlace = " AND (";
//            wordArray = eventInfo.getEventPlace().split("\\s");
//            
//            for(int i = 0; i < wordArray.length; i++){
//                if(i != 0) searchPlace += " OR"; 
//                searchPlace += " lower(e.name) like lower('%" + wordArray[i] + "%'";
//            }
//            searchPlace = ")";
//        }
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//
//        String searchLocation = (eventInfo.getEventLocation().trim().equals("")) ? "" 
//                : " AND lower(e.location) LIKE lower('%" + eventInfo.getEventLocation().trim() + "%')";
//        String searchStyle = (eventInfo.getEventStyle().trim().equals("999")) ? "" 
//                : " AND lower(es.styleName) LIKE lower('%" + eventInfo.getEventStyle().trim() + "%')";
//        String searchPrice = (eventInfo.getEventPrice().trim().equalsIgnoreCase("No matter")) ? "" 
//                : " AND e.price LIKE '%Free entrance%'";
//        String searchOccasion = (eventInfo.getEventOccasion().trim().equalsIgnoreCase("No matter")) ? "" 
//                : " AND e.occasion LIKE '%Dinner & concert%'";
//        String searchDate = formatter.format(eventInfo.getEventTime());
        try {
            //Lay danh sach user trong bang tblUser
            String sql = "SELECT TOP 4 e.name,e.price, e.place, e.location, e.time,es.styleName,e.occasion, e.image, e.link, e.TempID\n"
                    + "FROM tblEvent e , tblEventStyle es\n" 
                    + "WHERE e.styleId=es.styleId AND e.time > GETDATE() " 
                    + "AND (e.time < '" + searchDateBefore + "' OR e.time > '" + searchDateAfter + "') "
                    + "AND (" + searchStyle + ") ORDER by time";
            rs=stm.executeQuery(sql); 
            while(rs.next()){
                String name=rs.getString(1);
                String price=rs.getString(2);
                String place=rs.getString(3);
                String location=rs.getString(4);
                
                Timestamp timestamp = rs.getTimestamp(5);
                
                Date time = new Date(timestamp.getTime());
                String style=rs.getString(6);
                String occasion=rs.getString(7);
                String imagePath=rs.getString(8);
                String link = rs.getString(9);
                int id=rs.getInt(10);
                
                list.add(new Event(name, price, place, location, time, style, occasion, imagePath, link, id));
            }
        } catch (Exception e) {
            System.out.println("getHomeEvents error: " + e.getMessage());
        }
        return list;
    }
    
    public ArrayList<Event> getNearestEvents (Date date, float lat, float lng){
        ArrayList<Event> list = new ArrayList<>();
        
        Date searchDateRaw = date;
        Calendar c = Calendar.getInstance();
        c.setTime(searchDateRaw);
        c.add(Calendar.DATE, 1);
        searchDateRaw = c.getTime();
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String searchDateAfter = formatter.format(searchDateRaw);
        String searchDateBefore = formatter.format(date);
        
        try {
            //Lay danh sach user trong bang tblUser
            String sql = "SELECT e.name,e.price, e.place, e.location, e.time, es.styleName, "
                    + "e.occasion, e.image, e.link, e.TempID, "
                    + "ROUND(6378137*2*ATN2(SQRT(SQUARE(SIN(RADIANS(ep.placeLatitude-" + lat +")/2)) "
                    + "+ COS(RADIANS(" + lat + "))*COS(RADIANS(ep.placeLatitude)) "
                    + "* SQUARE(SIN(RADIANS(ep.placeLongitude-" + lng + ")/2))), "
                    + "SQRT(1-(SQUARE(SIN(RADIANS(ep.placeLatitude-" + lat + ")/2)) "
                    + "+ COS(RADIANS(" + lat + "))*COS(RADIANS(ep.placeLatitude)) "
                    + "* SQUARE(SIN(RADIANS(ep.placeLongitude-" + lng + ")/2)))))/1000,2) as distance\n"
                    + "FROM tblEvent e , tblEventStyle es, tblEventPlaces ep\n"
                    + "WHERE e.styleId=es.styleId AND e.placeId=ep.placeId AND e.time > GETDATE() "
                    + "AND (e.time < '" + searchDateBefore + "' OR e.time > '" + searchDateAfter + "') "
                    + "ORDER BY distance";
            rs=stm.executeQuery(sql); 
            while(rs.next()){
                String name=rs.getString(1);
                String price=rs.getString(2);
                String place=rs.getString(3);
                String location=rs.getString(4);
                
                Timestamp timestamp = rs.getTimestamp(5);
                
                Date time = new Date(timestamp.getTime());
                String style=rs.getString(6);
                String occasion=rs.getString(7);
                String imagePath=rs.getString(8);
                String link = rs.getString(9);
                int id=rs.getInt(10);
                float distance = rs.getFloat(11);
                
                list.add(new Event(name, price, place, location, time, style, occasion, imagePath, link, id, distance));
            }
        } catch (Exception e) {
            System.out.println("getListEventByDate error: " + e.getMessage());
        }
        
        return list;
    }
    
    public ArrayList<Event> getListEventByInfo(Event eventInfo){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String searchTitle = (eventInfo.getEventName().trim().equals("")) ? "" 
                : " AND lower(e.name) LIKE lower('%" + eventInfo.getEventName().trim() + "%')";
        String searchLocation = (eventInfo.getEventLocation().trim().equals("")) ? "" 
                : " AND lower(e.location) LIKE lower('%" + eventInfo.getEventLocation().trim() + "%')";
        String searchPlace = (eventInfo.getEventPlace().trim().equals("")) ? "" 
                : " AND lower(e.place) LIKE lower('%" + eventInfo.getEventPlace().trim() + "%')";
        String searchStyle = (eventInfo.getEventStyle().trim().equals("999")) ? "" 
                : " AND lower(es.styleName) LIKE lower('%" + eventInfo.getEventStyle().trim() + "%')";
        String searchPrice = (eventInfo.getEventPrice().trim().equalsIgnoreCase("No matter")) ? "" 
                : " AND e.price LIKE '%Free entrance%'";
        String searchOccasion = (eventInfo.getEventOccasion().trim().equalsIgnoreCase("No matter")) ? "" 
                : " AND e.occasion LIKE '%Dinner & concert%'";
        String searchDate = formatter.format(eventInfo.getEventTime());
   
        ArrayList<Event> list = new ArrayList<>();
        try {
            //Lay danh sach user trong bang tblUser
            String sql = "SELECT e.name,e.price, e.place, e.location, e.time,es.styleName,e.occasion, e.image, e.link, e.TempID\n" 
                    + "FROM tblEvent e , tblEventStyle es\n" 
                    +"WHERE e.styleId=es.styleId AND convert(Date,e.time, 110)='" + searchDate + "'" 
                    + searchTitle + searchLocation + searchPlace + searchStyle + searchPrice 
                    + searchOccasion + "\n"
                    + "ORDER by time";
            rs=stm.executeQuery(sql); 
            while(rs.next()){
                String name=rs.getString(1);
                String price=rs.getString(2);
                String place=rs.getString(3);
                String location=rs.getString(4);
                
                Timestamp timestamp = rs.getTimestamp(5);
                
                Date time = new Date(timestamp.getTime());
                String style=rs.getString(6);
                String occasion=rs.getString(7);
                String imagePath=rs.getString(8);
                String link = rs.getString(9);
                int id=rs.getInt(10);
                
                list.add(new Event(name, price, place, location, time, style, occasion, imagePath, link, id));
            }
        } catch (Exception e) {
            System.out.println("getListEventByDate error: " + e.getMessage());
        }
        return list;
    }
    
    public ArrayList<Event> getListEventByDate(Date input){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String date = formatter.format(input);
        
        ArrayList<Event> list = new ArrayList<>();
        try {
            //Lay danh sach user trong bang tblUser
            String sql = "select e.name,e.price, e.place, e.location, e.time,es.styleName,e.occasion, e.image, e.link, e.TempID\n" +
                "from tblEvent e , tblEventStyle es\n" +
                "where e.styleId=es.styleId and convert(Date,e.time, 110)='" + date + "'\n" +
                "order by time";
            rs=stm.executeQuery(sql); 
            while(rs.next()){
                String name=rs.getString(1);
                String price=rs.getString(2);
                String place=rs.getString(3);
                String location=rs.getString(4);
                
                Timestamp timestamp = rs.getTimestamp(5);
                
                Date time = new Date(timestamp.getTime());
                String style=rs.getString(6);
                String occasion=rs.getString(7);
                String imagePath=rs.getString(8);
                String link = rs.getString(9);
                int id=rs.getInt(10);
                
                list.add(new Event(name, price, place, location, time, style, occasion, imagePath, link, id));
            }
        } catch (Exception e) {
            System.out.println("getListEventByDate error: " + e.getMessage());
        }
        return list;
    }
    
    public ArrayList<Date> getEventDateFromToday(){
        ArrayList<Date> list = new ArrayList<>();
        
        try {
            //Lay danh sach user trong bang tblUser
            rs=stm.executeQuery("SELECT convert(Date,time, 110)\n" +
                "from tblEvent \n" +
                "where time >= GETDATE() \n" + 
                "group by convert(Date,time, 110)"); 
            while(rs.next()){              
                Timestamp timestamp = rs.getTimestamp(1);
                Date time = new Date(timestamp.getTime());
                list.add(time);
            }
        } catch (Exception e) {
            System.out.println("getEventDateFromToday error: " + e.getMessage());
        }
        
        return list;
    }
    
    public String getEventDateNormalized (Date date){
        Calendar c= Calendar.getInstance();
        c.setTime(date);
        
        String year = Integer.toString(c.get(Calendar.YEAR));
        String dow = getDayOfWeek(c.get(Calendar.DAY_OF_WEEK));
        String month = getMonth(c.get(Calendar.MONTH));
        String dom = getDayOrdered(c.get(Calendar.DAY_OF_MONTH));
        
        return dow + ", " + month + " " + dom + " " + year;
    }  
    
    public String getHomeDateNormalized (Date date){
        Calendar c= Calendar.getInstance();
        c.setTime(date);
        
        String dow = getDayOfWeek(c.get(Calendar.DAY_OF_WEEK));
        String month = getMonth(c.get(Calendar.MONTH));
        String dom = getDayOrdered(c.get(Calendar.DAY_OF_MONTH));
        String hour = Integer.toString(c.get(Calendar.HOUR_OF_DAY));
        if(hour.length()==1)hour = "0" + hour; 
        String min = Integer.toString(c.get(Calendar.MINUTE));
        if(min.length()==1) min = "0" + min; 
        
        return dow + ", " + month + " " + dom + " | " + hour + ":" + min;
    }                          
  
    private String getDayOfWeek(int value){
        String day = "";
        switch(value){
        case 1:
            day="Sunday";
            break;
        case 2:
            day="Monday";
            break;
        case 3:
            day="Tuesday";
            break;
        case 4:
            day="Wednesday";
            break;
        case 5:
            day="Thursday";
            break;
        case 6:
            day="Friday";
            break;
        case 7:
            day="Saturday";
            break;
        }
        return day;
    }
    
    private String getMonth(int value){
        String month = "";
        switch(value){
        case 0:
            month="January";
            break;
        case 1:
            month="February";
            break;
        case 2:
            month="March";
            break;
        case 3:
            month="April";
            break;
        case 4:
            month="May";
            break;
        case 5:
            month="June";
            break;
        case 6:
            month="July";
            break;
        case 7:
            month="August";
            break;
        case 8:
            month="September";
            break;
        case 9:
            month="October";
            break;
        case 10:
            month="November";
            break;
        case 11:
            month="December";
            break;
        }
        return month;
    }
    
    private String getDayOrdered(int value){
        String day= Integer.toString(value);
        
        if(day.length()==2 && day.startsWith("1")){
            day += "th";
        }else{
            if(day.endsWith("1")) day += "st";
            else if(day.endsWith("2")) day+="nd"; 
            else if (day.endsWith("3")) day+="rd";
            else day+="th";
        }
        
        return day;
    }
    
    public ArrayList<String[]> getListEventStyle(){
        ArrayList<String[]> list = new ArrayList<>();
        
        try {
            //Lay danh sach user trong bang tblUser
            rs=stm.executeQuery("SELECT * from tblEventStyle order by StyleName"); 
            while(rs.next()){              
                int id = rs.getInt(1);
                String name = rs.getString(2);
                
                String[] style = {Integer.toString(id), name};
                list.add(style);
            }
        } catch (Exception e) {
            System.out.println("getEventDateFromToday error: " + e.getMessage());
        }
        
        return list;
    }
    
    public String getEventById(String id){
        String result="";
        
        try {
            //Lay danh sach user trong bang tblUser
            rs=stm.executeQuery("SELECT * from tblEventStyle where styleId = " + id + " order by StyleName"); 
            while(rs.next()){              
                result = rs.getString(2);
            }
        } catch (Exception e) {
            System.out.println("getEventDateFromToday error: " + e.getMessage());
        }
        
        return result;
    }

    public Event getEventsById(String eventId) {           
        Event event = new Event();
        try {
            //Lay danh sach user trong bang tblUser
            String sql = "select e.name,e.price, e.place, e.location, e.time,es.styleName,e.occasion, e.image, e.link, e.TempID\n" +
                "from tblEvent e , tblEventStyle es\n" +
                "where e.styleId=es.styleId and e.TempID=" + Integer.parseInt(eventId) + "\n" +
                "order by time";
            rs=stm.executeQuery(sql); 
            while(rs.next()){
                String name=rs.getString(1);
                String price=rs.getString(2);
                String place=rs.getString(3);
                String location=rs.getString(4);
                
                Timestamp timestamp = rs.getTimestamp(5);
                
                Date time = new Date(timestamp.getTime());
                String style=rs.getString(6);
                String occasion=rs.getString(7);
                String imagePath=rs.getString(8);
                String link = rs.getString(9);
                int id=rs.getInt(10);
                
                event = new Event(name, price, place, location, time, style, occasion
                        , imagePath, link, id);
            }
        } catch (Exception e) {
            System.out.println("getListEventById error: " + e.getMessage());
        }
        return event;
    }
}
