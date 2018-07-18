package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.util.DBConnection;

import DTO.InformationDTO;

/*import DTO.Datebase;*/

/**
 * Servlet implementation class Information_show
 */
@WebServlet("/Control/Information_show")
public class Information_show extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Information_show() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = "209670";
	/*	String userid = request.getParameter("hd_userid");*/
		String fromDate = request.getParameter("search_date_from");
		String toDate = request.getParameter("search_date_to");

		
		if (fromDate.length() == 0){
			fromDate = "0000-01-01";
		}
		
		if (toDate.length() == 0){
			toDate ="9999-12-31"	;
		}
		
		String sql_user="select * from afls.user where user_id=?";
			
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs_user=null;
		boolean flag_user=false;

		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DBConnection.getConn();
			/*con=DriverManager.getConnection("jdbc:mysql://localhost:3306/afls", "root", "zaq12wsx");*/
			//con=DriverManager.getConnection(Datebase.getBluemixUrl(),Datebase.getBluemixUserName(),Datebase.getBluemixPassword());
			
			pre=con.prepareStatement(sql_user);
			pre.setString(1,userid);
		
			rs_user=pre.executeQuery();
			if (rs_user.next()) {
			flag_user=true;
			
			}
			if(flag_user) 
			{
				//request.setAttribute("id",search_userid);
				/*request.getRequestDispatcher("LoginSuccessful").forward(request, response);*/
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				Date dt_search_date_from = sdf.parse(fromDate);
				Date dt_search_date_to = sdf.parse(toDate);
				List<InformationDTO> search_result = new ArrayList<InformationDTO>();	
				
				ResultSet rs_overtime = overtime_query(userid,dt_search_date_from,dt_search_date_to,con);
				
				while(rs_overtime.next()){
					InformationDTO informationdto = new InformationDTO();
					informationdto.setUserid(userid);
					informationdto.setDate(rs_overtime.getDate("over_date").toString());
					informationdto.setHours(rs_overtime.getString("over_hours"));
					informationdto.setType("workday");
					//informationdto.setTest_comment(rs_test.getString("test_comment"));
					search_result.add(informationdto);
				}
				
				ResultSet rs_holiday = holiday_query(userid,dt_search_date_from,dt_search_date_to,con);
				while(rs_holiday.next()){
					InformationDTO informationdto = new InformationDTO();
					informationdto.setUserid(userid);
					informationdto.setDate(rs_holiday.getDate("holi_date").toString());
					informationdto.setHours(rs_holiday.getString("holi_hours"));
					informationdto.setType("vocation");
					//informationdto.setTest_comment(rs_test.getString("test_comment"));
					search_result.add(informationdto);
				}
				
				request.setAttribute("id",userid);
				request.setAttribute("from", request.getParameter("search_date_from"));
				request.setAttribute("to", request.getParameter("search_date_to"));
				request.setAttribute("result", search_result);
				request.getRequestDispatcher("Information_show.jsp").forward(request, response);

			}
			else //user not exists
			{request.setAttribute("msg","*Userid not exists in userdb");
			//System.out.println(request.getAttribute("msg"));
			request.getRequestDispatcher("Information_show.jsp").forward(request, response);
			}
			
		} 
	
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
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


	// select overtime
	private ResultSet overtime_query(String search_userid, Date search_date_from, Date search_date_to,Connection con) throws SQLException {
		String sql;
		sql = "select * from afls.overtime where over_user_id = ? and over_date between ? and ?";
	
		PreparedStatement pre = con.prepareStatement(sql);
		
		java.sql.Date date_from = new java.sql.Date(search_date_from.getTime());
		java.sql.Date date_to = new java.sql.Date(search_date_to.getTime());
		pre.setString(1,search_userid);
		//pre.setString(2,search_date_from);
		pre.setDate(2, date_from);
		pre.setDate(3, date_to);
		
		
		return pre.executeQuery();
		
	}
	
	private ResultSet holiday_query(String search_userid, Date search_date_from, Date search_date_to,Connection con) throws SQLException {
		// select holiday
		String sql;
		sql = "select * from afls.holiday where holi_user_id = ? and holi_date between ? and ?";
		PreparedStatement pre = con.prepareStatement(sql);
		
		java.sql.Date date_from = new java.sql.Date(search_date_from.getTime());
		java.sql.Date date_to = new java.sql.Date(search_date_to.getTime());
		pre.setString(1,search_userid);
		//pre.setString(2,search_date_from);
		pre.setDate(2, date_from);
		pre.setDate(3, date_to);
		
		
		return pre.executeQuery();
		
	}

}
