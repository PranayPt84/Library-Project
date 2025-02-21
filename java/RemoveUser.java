
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

public class RemoveUser extends HttpServlet {

    Connection con;
    Statement stmt;
    ResultSet rs;    
    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String libraryid=req.getParameter("removelibraryid");
        String name=req.getParameter("name");
        String contactno=req.getParameter("contactno");
        String sql=" select library_id , Name ,Contact_no from usersdata";
      
        try{
           PrintWriter out= res.getWriter();
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
           rs= stmt.executeQuery(sql);
           rs.beforeFirst();
           while(rs.next()){
               if(libraryid.equals(rs.getString(1)) && name.equals(rs.getString(2)) && contactno.equals(rs.getString(3)))
               {
                  rs.deleteRow();
                  out.println("Successfully data deleted");
                  break;
               }
           
            out.println("Please Check your details");
                   }
           
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
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
