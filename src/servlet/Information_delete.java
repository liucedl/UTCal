package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.util.DBConnection;

/*import DTO.Datebase;*/

/**
 * Servlet implementation class Information_delete
 */
@WebServlet("/Control/Information_delete")
public class Information_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Information_delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * 
	 */
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	super.doPost(req, resp);
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String[]> temp = request.getParameterMap();
		StringBuffer temp1 = request.getRequestURL();
		String userid= request.getParameter("id");
		String str_search_date =  request.getParameter("date");
		String type =  request.getParameter("type");
		Connection con=null;
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DBConnection.getConn();
			Statement stmt = con.createStatement();
			if(type.equals("workday")){
				String sql_del = "delete from afls.overtime where over_user_id ='"+userid+"' and over_date ='"+str_search_date+"'";
				int del_rc=stmt.executeUpdate(sql_del);
				
			//System.out.println(add_rc);
				if (del_rc ==1){
				request.setAttribute("id",userid);
				request.setAttribute("msg","delete record from overtime successful! Press <strong>[Search]</strong> to get more information.");
				request.getRequestDispatcher("Information_show.jsp").forward(request, response);
				}
				}
			else{
				String sql_del2 = "'delete from afls.holiday where holi_user_id ='"+userid+"' and holi_date ='"+str_search_date ;
				int del_rc2=stmt.executeUpdate(sql_del2);
				
			//System.out.println(add_rc);
				if (del_rc2 ==1){
				request.setAttribute("id",userid);
				request.setAttribute("msg","delete record from holiday successful! Press <strong>[Search]</strong> to get more information.");
				request.getRequestDispatcher("Information_show.jsp").forward(request, response);
				}
			}
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// Duplicate entry
			/*if (e.getSQLState().equals("23000")){
				request.setAttribute("msg","This record already exists. Please reenter or Update!");
				request.getRequestDispatcher("Information_Add.jsp").forward(request, response);
			}else{*/
			e.printStackTrace();
			
		}
		
		finally 
		{
			if (con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
	}

	}


