
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

public class LoginCheck extends HttpServlet {

    Connection con;
    Statement stmt;
    ResultSet rs;

    public void init() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/library", "root", "12345");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String logid = req.getParameter("logid");
        String logpassword = req.getParameter("logpassword");

//        System.out.println(logid+" "+logpassword);
        try {

            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select library_id ,Password from usersdata";
            rs = stmt.executeQuery(sql);
            PrintWriter out = res.getWriter();
            boolean datamatch=false;
            while (rs.next()) {
              if(logid.equals(rs.getString(1)) && logpassword.equals(rs.getString(2)))
              {
                  datamatch=true;
                  break;
              }
            }
            String adminsql =" select admin_id ,admin_password from admin";
            rs=stmt.executeQuery(adminsql);
            rs.beforeFirst();
            boolean adminmatch=false;
            while(rs.next()){
                if(logid.equals(rs.getString("Admin_id"))&&logpassword.equals(rs.getString("Admin_Password"))){
                   adminmatch=true;
                   break;
                }
            }
            if(adminmatch){
              String path= req.getContextPath();
              String finalpath=path+"/Adminpage.jsp";
              res.sendRedirect(finalpath);
            }
           else if (datamatch) {
              String path= req.getContextPath();
              String finalpath=path+"/SeatOccupency.jsp";
              res.sendRedirect(finalpath);

            }
           else {
                out.println("Please check login and password");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    public void destroy() {
        try {
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
