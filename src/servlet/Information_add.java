package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.util.DBConnection;

/*import DTO.Datebase;*/

/**
 * Servlet implementation class Information_add
 */
@WebServlet("/Control/Information_add")
public class Information_add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Information_add() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("hd_userid");
		/*String userid = "209670";*/
		String updtype = request.getParameter("hd_type_option");
		String str_upddate = request.getParameter("hd_date");
		String updhours = request.getParameter("hd_hours");
		//string date -> sql date
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				java.util.Date util_upddate = null;
				
				try {
					util_upddate = sdf.parse(str_upddate);
				} catch (ParseException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
				java.sql.Date sql_upddate = new java.sql.Date(util_upddate.getTime());
		//convert end
		
		String sql;
		if(updtype.equals("workday")){
			sql = "insert into afls.overtime values (?,?,?)";	
			Connection con=null;
			PreparedStatement pre=null;		
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con=DBConnection.getConn();
				pre=con.prepareStatement(sql);
				pre.setString(1,userid);
				pre.setDate(2,sql_upddate);
				pre.setInt(3,Integer.parseInt(updhours));
				
				int add_rc = pre.executeUpdate();
				
				//System.out.println(add_rc);
				if (add_rc ==1){
					request.setAttribute("id",userid);
					request.setAttribute("msg","加班信息录入成功！请点击 <strong>【查询】 </strong> 获得更多信息。");
					request.getRequestDispatcher("Information_show.jsp").forward(request, response);
				}
				
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// Duplicate entry
				if (e.getSQLState().equals("23000")){
					request.setAttribute("id",userid);
					request.setAttribute("msg","该日期的记录在加班系统中已存在。请确认！");
					request.getRequestDispatcher("Information_show.jsp").forward(request, response);
				}else{
				e.printStackTrace();
				}
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
		else{
			sql = "insert into afls.holiday values (?,?,?)";
			
			Connection con=null;
			PreparedStatement pre=null;					
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con=DBConnection.getConn();
				pre=con.prepareStatement(sql);
				pre.setString(1,userid);
				pre.setDate(2,sql_upddate);
				pre.setInt(3,Integer.parseInt(updhours));
				
				int add_rc = pre.executeUpdate();
				
				//System.out.println(add_rc);
				if (add_rc ==1){
					request.setAttribute("id",userid);
					request.setAttribute("msg","休假信息录入成功！请点击 <strong>【查询】 </strong> 获得更多信息。");
					request.getRequestDispatcher("Information_show.jsp").forward(request, response);
					
				}
				
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// Duplicate entry
				if (e.getSQLState().equals("23000")){
					request.setAttribute("id",userid);
					request.setAttribute("msg","该日期的记录在休假系统中已存在。请确认！");
					request.getRequestDispatcher("Information_show.jsp").forward(request, response);
				}else{
				e.printStackTrace();
				}
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

}
