
<%@page import="java.util.Arrays"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con=null;
    Statement stmt=null;
    ResultSet rs=null;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost/library","root","12345");
   stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
   String sql="select library_id ,Seat_no from usersdata";
    rs=stmt.executeQuery(sql);
    String array[]=new String [30];
    int i=0;
    while(rs.next()){
    array[i]=rs.getString(2);
    i++;
    }
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        .container{
            height: 99vh;
            width: 99vw;
            border: 2px solid blue;
            /* background-image: url("https://images.unsplash.com/photo-1557683325-3ba8f0df79de?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGRhcmslMjBibHVlJTIwYmFja2dyb3VuZHxlbnwwfHwwfHx8MA%3D%3D");
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover; */
            background-color: rgb(62 62 255);
        }
        .container h2{
            width: 98vw;
            background-color: blanchedalmond;
            color: black;
            text-align: center;
            font-size: 30px;
            padding: 8px;
          
        }
        .innercontainer{
            border: 2px solid black;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            height:85vh;
            width: 99vw;
           
        }
     .box{
       
        display: flex;
        justify-content: center;
        align-items: center;
        height: 22vh;
        width: 9vw;
        margin: 5px;
         font-size: 25px;
       font-weight: bold;
        background-color: red;
     }
    </style>
</head>
<body>
    <div class="container">
     <h2>Seating According to Users</h2>
     <div class="innercontainer">
     <div class="box" id="seat1">Seat-1</div>
     <div class="box" id="seat2">Seat-2</div>
     <div class="box" id="seat3">Seat-3</div>
     <div class="box" id="seat4">Seat-4</div>
     <div class="box" id="seat5">Seat-5</div>
     <div class="box" id="seat6">Seat-6</div>
     <div class="box" id="seat7">Seat-7</div>
     <div class="box" id="seat8">Seat-8</div>
     <div class="box" id="seat9">Seat-9</div>
     <div class="box" id="seat10">Seat-10</div>
     <div class="box" id="seat11">Seat-11</div>
     <div class="box" id="seat12">Seat-12</div>
     <div class="box" id="seat13">Seat-13</div>
     <div class="box" id="seat14">Seat-14</div>
     <div class="box" id="seat15">Seat-15</div>
     <div class="box" id="seat16">Seat-16</div>
     <div class="box" id="seat17">Seat-17</div>
     <div class="box" id="seat18">Seat-18</div>
     <div class="box" id="seat19">Seat-19</div>
     <div class="box" id="seat20">Seat-20</div>
     <div class="box" id="seat21">Seat-21</div>
     <div class="box" id="seat22">Seat-22</div>
     <div class="box" id="seat23">Seat-23</div>
     <div class="box" id="seat24">Seat-24</div>
     <div class="box" id="seat25">Seat-25</div>
     <div class="box" id="seat26">Seat-26</div>
     <div class="box" id="seat27">Seat-27</div>
     <div class="box" id="seat28">Seat-28</div>
     <div class="box" id="seat29">Seat-29</div>
     <div class="box" id="seat30">Seat-30</div>
    </div>
    </div>
    <script>
        let javaarr=  <%= Arrays.toString(array) %>;
//        console.log(javaarr);
         for(let i=0;i<javaarr.length ;i++){
             if(javaarr[i]!==null){
                 let a=document.getElementById("seat"+javaarr[i]);
                 a.style.backgroundColor="#16eb12";
             }
         }
     </script>
</body>
</html>