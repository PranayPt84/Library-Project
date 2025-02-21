<%-- 
    Document   : Adminpage
    Created on : 30 Jan 2025, 10:53:37 pm
    Author     : Pranay Patidar
--%>

<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con=null;
    Statement stmt=null;
    ResultSet rs=null;
   
    try{
    
    Class.forName("com.mysql.jdbc.Driver");
   con=DriverManager.getConnection("jdbc:mysql://localhost/library","root","12345");
      stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    }
    catch(Exception e){
    e.printStackTrace();
    }

           boolean idmatch=false;
           try{ 
             
           String sql="select library_id from usersdata";
           rs=stmt.executeQuery(sql);
           
//           String libraryid=request.getParameter("libraryid");
//           PrintWriter writer = response.getWriter();
//           if(libraryid !=null){
////               System.out.println(libraryid);
//                rs.beforeFirst();
//                
//                while(rs.next()){
////                System.out.println(rs.getString(1));
//                if(libraryid.equals(rs.getString(1)))
//                {
//               
//                idmatch=true;
//                System.out.println(idmatch);
//                break;
//           }
//           }
//           }
           }
           catch(Exception e){
           e.printStackTrace();
           }
       %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <style>
        * {
            margin: 0px;
            padding: 0px;
        }

        .container {
            height: 100vh;
            width: 100vw;
            background-image: url("https://img.freepik.com/free-vector/gradient-blue-abstract-technology-background_23-2149213765.jpg?ga=GA1.2.1691869105.1723291109&semt=ais_hybrid");
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;

        }

        .navbar ul {
            position: absolute;
            top: 11vh;
            left: 5vw;
            width: 93vw;

        }

        .navbar ul li {
            display: inline-block;
            margin: 10px;
            margin-left: 0px;
            list-style: none;
            margin: 10px 53px 16px 29px;

            border-radius: 10px;

        }

        .navbar ul li a {
            text-decoration: none;
            padding: 6px 52px;
            margin: 5px;
            color: rgb(40 89 119);
            font-weight: bold;
            background-color: #e3e4ef;
            font-size: 21px;
            margin: 13px 0px 5px 3px;
            border-radius: 13px;

        }

        .navbar ul li a:hover {
            background-color: #393e7e;
            color: grey;
            text-decoration: underline;
        }

        .innerbox {

            height: 65vh;
            width: 75vw;
            background-image: url("https://img.freepik.com/free-vector/gradient-blue-background_23-2149331354.jpg?t=st=1738235606~exp=1738239206~hmac=cb86d28700de2e8a074b53a53adfe25b9423a9f897f4b44013b8b55338f7b5cd&w=996");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            /* border: 2px solid red; */
            position: absolute;
            top: 21vh;
            left: 13vw;
            display: flex;
            justify-content: space-evenly;
            box-shadow: 5px 5px 3px #191614;
        }

        .box {
            height: 34vh;
            width: 17vw;
            display: inline-block;
            position: relative;

            top: 12vh;
            display: flex;
            justify-content: center;
            background-color: #b5c789;
            box-shadow: 4px 3px 2px gray;


        }

        .head {
            color: white;
            font-weight: bold;
            font-size: 25px;
            position: absolute;
            text-shadow: 3px 1px 2px black;
        }

        .innerbox h3 {
            /* background-color: aqua; */
            color: #e0d2d2;
            text-align: center;
            width: 98%;
            position: absolute;
            padding: 10px;
            font-size: 32px;
        }

        .btn {
            position: absolute;
            width: 95%;
            text-align: center;
            top: 22vh;
            left: 0vw;
            background-color: rgb(39, 49, 238);
            text-decoration: none;
            font-weight: bold;
            color: #cfe0dd;
            padding: 5px;
            font-size: 20px;
            border: 2px solid black;

        }

        .btn:hover {
            background-color: rgb(94, 94, 238);
            color: rgb(58, 56, 56);
            text-decoration: underline;
            text-shadow: none;
        }

        .form {
            /* border: 2px solid red; */
            position: absolute;
            top: 5vh;
            height: 18vh;
            width: 14vw;
        }

        .input {
            display: inline-block;
            width: 13vw;
            font-size: 16px;
            padding: 3px;
            text-align: center;

        }

        label {
            display: block;
            font-size: 17px;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="container">
        <nav class="navbar">
            <ul>
                <li><a href="Library.html">Home</a></li>
                <li><a href="SeatOccupency.jsp">Seat Dashboard</a></li>
                <li><a href="">About_Us</a></li>
                <li><a href="LibraryRegistration.html">Registration</a></li>
                <li><a href="Login.html">Log-in</a></li>
            </ul>
        </nav>
        <div class="innerbox">
            <h3>Admin's Work Place</h3>

            <div class="box">
                <heading class="head">Provide Seat</heading>
                <div class="form">
                    <form action="ProvideSeat" method="get" onsubmit="return provide()">
                        <label for="libraryid">Library-id :-</label>
<!--                        <input type="number" name="libraryid" id="libraryid" placeholder="Enter Library_id"
                            class="input" required>-->
<select name="libraryid" id="libraryid" class="input" required>
    <option value="">Select User id</option>
    <%try{
        rs.beforeFirst();
        while(rs.next()){
       out.print("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
        }
    }
    catch(Exception e){
    e.printStackTrace();
        }
    %>
</select>
        
                        <label for="seatno">Seat-no :-</label>
                        <input type="number" name="seatno" id="seatno" placeholder="seat no between 1 to 30"
                            class="input" required>
                        <input type="submit" value="Provide" class="btn">
                    </form>
                </div>
            </div>
            <div class="box">
                <heading class="head">Replace Seat</heading>
                <div class="form">
                    <form action="ProvideSeat" method="get" onsubmit="return replace()">
                        <label for="relpacelibraryid">Library-id :-</label>
                        <select name="libraryid" id="replacelibraryid" class="input" required>
    <option value="">Select User id</option>
    <%try{
        rs.beforeFirst();
        while(rs.next()){
       out.print("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
        }
    }
    catch(Exception e){
    e.printStackTrace();
        }
    %>
</select>

                        <label for="previousseat">Previous seat :- </label>
                        <input type="number" name="previousseat" id="previousseat" placeholder="Enter your previousseat"
                            class="input" required>
                        <label for="updateseat">Seat User Want :-</label>
                        <input type="number" name="seatno" id="updateseat" placeholder="Seat no between 1 to 30 "
                            class="input" required>
                        <input type="submit" value="Replace" class="btn">
                    </form>
                </div>
            </div>
            <div class="box">
                <heading class="head">Remove User</heading>
                <div class="form">
                    <form action="RemoveUser" method="get" onsubmit="return remove()">
                        <label for="removelibraryid">Library-id :-</label>
                       <select name="removelibraryid" id="removelibraryid" class="input" required>
    <option value="">Select User id</option>
    <%try{
        rs.beforeFirst();
        while(rs.next()){
       out.print("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
        }
    }
    catch(Exception e){
    e.printStackTrace();
        }
    %>
</select>

                        <label for="name">Name :-</label>
                        <input type="text" name="name" id="name" placeholder="Enter users Name" class="input" required>
                        <label for="contactno"> Contact-no :-</label>
                        <input type="number" name="contactno" id="contactno" placeholder="Enter your Contact_no"
                            class="input" required>
                        <input type="submit" value="Remove" class="btn">
                    </form>
                </div>
            </div>
        </div>

    </div>
    <script>
//         let idmatch=<%= idmatch ? "true" : "false" %>;
       function provide(){
           let libraryid=document.getElementById("libraryid").value;
        let seatno=document.getElementById("seatno").value;
        if(seatno>0 && seatno<30){
            if(confirm("Confirm that your user id "+libraryid+" has Seat no"+seatno))
            {
            return true;
            }
            else{
                 return false;
                 }
             }         
        else{
            alert("!..Please enter Seat no between 1 to 30 ");
            return false;
        }
    
    }
    function remove(){
        let libraryid=document.getElementById("libraryid").value;
        if(confirm("Are You Sure to Delete "+libraryid+" permanently")){
            return true;
        }
        else{
            return false;
        }
    }
    </script>
</body>

</html>