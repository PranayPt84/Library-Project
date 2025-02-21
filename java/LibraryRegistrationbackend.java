

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class LibraryRegistrationbackend extends HttpServlet {

Connection con;
public void init(){
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost/library","root","12345");
    }
    catch(Exception e){
        e.printStackTrace();
    }
}
    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        
       String name=req.getParameter("name");
       String libraryid=req.getParameter("libraryid");
       String password=req.getParameter("password");
       String email=req.getParameter("email");
       String age=req.getParameter("age");
       String gender=req.getParameter("gender");
       String contactno =req.getParameter("contactno");
       String fieldname =req.getParameter("fieldname");
//       System.out.println(name+" "+libraryid+" "+password+" "+email+" "+age+" "+gender+" "+contactno+" "+fieldname);
     String sql=" insert into usersdata (Name ,Library_id,Password ,E_mail ,Age,Gender ,Contact_no,Field_Name) values(?,?,?,?,?,?,?,?)";   
        try{
            PreparedStatement pstmt=con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, libraryid);
            pstmt.setString(3, password);
            pstmt.setString(4, email);
            pstmt.setString(5, age);
            pstmt.setString(6, gender);
            pstmt.setString(7, contactno);
            pstmt.setString(8, fieldname);
             
            pstmt.executeUpdate();
            PrintWriter out=res.getWriter();
            out.println("<!DOCTYPE html>\n" +
"<html lang=\"en\">\n" +
"\n" +
"<head>\n" +
"    <meta charset=\"UTF-8\">\n" +
"    <meta name=\"viewport\" content=\"width=, initial-scale=1.0\">\n" +
"    <title>Data_Added</title>\n" +
"    <style>\n" +
"        body {\n" +
"            margin: 0px;\n" +
"            padding: 0px;\n" +
"            background-color: black;\n" +
"            color: white;\n" +
"            font-family: Georgia, 'Times New Roman', Times, serif;\n" +
"        }\n" +
"\n" +
"        .container {\n" +
"            height: 40vh;\n" +
"            width: 100%;\n" +
"            background-color: #32ad09;\n" +
"            margin-top: 0px;\n" +
"            padding: 0px;\n" +
"\n" +
"        }\n" +
"\n" +
"        h2 {\n" +
"            text-align: center;\n" +
"            font-size: 30px;\n" +
"            position: relative;\n" +
"            top: 13vh;\n" +
"            margin: 0px;\n" +
"\n" +
"        }\n" +
"        .btn{\n" +
"            position: absolute;\n" +
"            left: 43vw;\n" +
"            top: 31vh;\n" +
"    background-color: rgb(100, 100, 224);\n" +
"    color: white;\n" +
"    height: 3vh;\n" +
"    width: 10vw;\n" +
"    text-align: center;\n" +
"    padding: 8px;\n" +
"    border-radius: 5px;\n" +
"    font-size: 20px;\n" +
"    text-decoration: none;\n" +
"    font-weight: bold;\n" +
"        }\n" +
"        .btn:hover{\n" +
"            background-color: rgb(73, 73, 134);\n" +
"            color: gray;\n" +
"            text-decoration: underline;\n" +
"        }\n" +
"    </style>\n" +
"</head>\n" +
"\n" +
"<body>\n" +
"    <div class=\"container\">\n" +
"        <h2>\n" +
"            Successfully Data Added !!\n" +
"        </h2>\n" +
"       <a href=\"index.html\" class=\"btn\" >OK</a>\n" +
"    </div>\n" +
"    \n" +
"</body>\n" +
"\n" +
"</html> ");
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    

   
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        processRequest(req, res);
    }

    
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        processRequest(req, res);
    }
public void destroy(){
    try{
        con.close();
    }
    catch(Exception e){
        e.printStackTrace();
    }
}
    

}
