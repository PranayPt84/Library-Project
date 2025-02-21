

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;


public class ProvideSeat extends HttpServlet {

Connection con;
PreparedStatement pstmt;
    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String libraryid=req.getParameter("libraryid");
        String seatno=req.getParameter("seatno");
        String sql="update usersdata set seat_no=? where library_id=?";
        PrintWriter out = res.getWriter();
        try{  
        pstmt=con.prepareStatement(sql);
        pstmt.setString(1, seatno);
        pstmt.setString(2,libraryid);
       int i= pstmt.executeUpdate();
         
          out.println(i+" Row Successfully updated");
        }
        catch(Exception e){
           out.println("Seat you Provided is already Provided");
        }
        }
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  public void init(){
       try{
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost/library","root","12345");
           
       }
       catch(Exception e){
           e.printStackTrace();
       }
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
