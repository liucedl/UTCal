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
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
	/*	String userid = "209670";*/
		String userid = request.getParameter("hd_userid");
		String fromDate = request.getParameter("search_date_from");
		String toDate = request.getParameter("search_date_to");
		
		//获取当年的年份
		Date now = new Date();
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR); 
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
        
		
		if (fromDate.length() == 0){
			fromDate = year+"-01-01";
		}
		
		if (toDate.length() == 0){
			toDate =sf.format(now);
		}
		
		request.setAttribute("fromDate",fromDate);
		request.setAttribute("toDate",toDate);
		
		//user check
		String sql_user="select * from afls.user where user_id=?";
			
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs_user=null;
		boolean flag_user=false;
		int desi_Count = 0;
		int overtime_hours_sum = 0;
		int vocation_hours_sum = 0;
/*		int workday_count = 0;*/

		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con=DBConnection.getConn();		
			pre=con.prepareStatement(sql_user);
			pre.setString(1,userid);
		
			rs_user=pre.executeQuery();
			if (rs_user.next()) {
			flag_user=true;
			
			}
			if(flag_user) 
			{
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");				
				Date dt_search_date_from = sdf.parse(fromDate);
				Date dt_search_date_to = sdf.parse(toDate);
				
				//designholiday check
				ResultSet rs_desi=null;
				boolean flag_desi=false;
				java.sql.Date date_from1 = new java.sql.Date(dt_search_date_from.getTime());
				java.sql.Date date_to1 = new java.sql.Date(dt_search_date_to.getTime());
				String sql_desi = "select * from afls.designholiday where desi_date between ? and ?";
				pre=con.prepareStatement(sql_desi);	
				pre.setDate(1, date_from1);
				pre.setDate(2, date_to1);	
						
				rs_desi=pre.executeQuery();
				//designholiday count
				while(rs_desi.next()) {
					desi_Count++;
					}
				/*System.out.println("desi_Count="+desi_Count);*/
				
				List<InformationDTO> search_result = new ArrayList<InformationDTO>();	
				//overtime check
				ResultSet rs_overtime = overtime_query(userid,dt_search_date_from,dt_search_date_to,con);
				
				while(rs_overtime.next()){
					InformationDTO informationdto = new InformationDTO();
					informationdto.setUserid(userid);
					informationdto.setDate(rs_overtime.getDate("over_date").toString());
					informationdto.setHours(rs_overtime.getString("over_hours"));
					informationdto.setType("加班");
					search_result.add(informationdto);
					overtime_hours_sum=overtime_hours_sum+Integer.parseInt(informationdto.getHours());
				}
				//holiday check
				ResultSet rs_holiday = holiday_query(userid,dt_search_date_from,dt_search_date_to,con);
				while(rs_holiday.next()){
					InformationDTO informationdto = new InformationDTO();
					informationdto.setUserid(userid);
					informationdto.setDate(rs_holiday.getDate("holi_date").toString());
					informationdto.setHours(rs_holiday.getString("holi_hours"));
					informationdto.setType("休假");
					search_result.add(informationdto);
					vocation_hours_sum=vocation_hours_sum+Integer.parseInt(informationdto.getHours());
				}
				/*System.out.println("overtime_hours_sum="+overtime_hours_sum);
				System.out.println("vocation_hours_sum="+vocation_hours_sum);*/
				
				//workday calculate
				int workday_count=0;
		        if (dt_search_date_from.after(dt_search_date_to)){
		        	request.setAttribute("id",userid);
		        	request.setAttribute("msg","日期范围非法！");
		        	request.getRequestDispatcher("Information_show.jsp").forward(request, response);
		        	}else{
		        		workday_count = workdaycalculate(dt_search_date_from,dt_search_date_to);
		        		/*System.out.println("workday_count="+workday_count);*/
		        	}				
				//UT calculate
				int ut_a = workday_count * 8 - desi_Count * 8 - vocation_hours_sum + overtime_hours_sum;
				int ut_b = workday_count * 8;
				float ut = ut_a*100/ut_b;
/*				System.out.println("ut_a="+ut_a);
				System.out.println("ut_b="+ut_b);
				System.out.println("ut="+ut);*/
				
				request.setAttribute("vocation",vocation_hours_sum);
				request.setAttribute("ot",overtime_hours_sum);
				request.setAttribute("desi",desi_Count);
				request.setAttribute("ut",ut);
				request.setAttribute("workhours",ut_b);
				
				request.setAttribute("id",userid);
				request.setAttribute("from", request.getParameter("search_date_from"));
				request.setAttribute("to", request.getParameter("search_date_to"));
				request.setAttribute("result", search_result);
				request.getRequestDispatcher("Information_show.jsp").forward(request, response);

				
			}
			else //user not exists
			{request.setAttribute("msg","*该用户不存在！");
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
		pre.setDate(2, date_from);
		pre.setDate(3, date_to);
		
		return pre.executeQuery();
		
	}
	// select holiday
	private ResultSet holiday_query(String search_userid, Date search_date_from, Date search_date_to,Connection con) throws SQLException {
		String sql;
		sql = "select * from afls.holiday where holi_user_id = ? and holi_date between ? and ?";
		PreparedStatement pre = con.prepareStatement(sql);
		
		java.sql.Date date_from = new java.sql.Date(search_date_from.getTime());
		java.sql.Date date_to = new java.sql.Date(search_date_to.getTime());
		pre.setString(1,search_userid);
		pre.setDate(2, date_from);
		pre.setDate(3, date_to);
		
		
		return pre.executeQuery();
		
	}
	//workday calculate
	private int workdaycalculate(Date search_date_from, Date search_date_to) {
			int rs_workdays = 0;
	        Date begDate = search_date_from;
	        Date endDate = search_date_to;
	            	// 总天数
	            	int days = (int) ((endDate.getTime() - begDate.getTime()) / (24 * 60 * 60 * 1000)) + 1;
	            	// 总周数
	            	int weeks = days / 7;
	            	// 总周数
	            	if (days % 7 == 0) {
	            		rs_workdays = days - 2 * weeks;
	            	}
	            	else {
	            		Calendar begCalendar = Calendar.getInstance();
	            		Calendar endCalendar = Calendar.getInstance();
	            		begCalendar.setTime(begDate);
	            		endCalendar.setTime(endDate);
	            		// 周日为1，周六为7
	            		int beg = begCalendar.get(Calendar.DAY_OF_WEEK);
	            		int end = endCalendar.get(Calendar.DAY_OF_WEEK);
	            		if (beg > end) {
	            			rs_workdays = days - 2 * (weeks + 1);
	            		} else if (beg < end) {
	            			if (end == 7) {
	            				rs_workdays = days - 2 * weeks - 1;
	            			} else {
	            				rs_workdays = days - 2 * weeks;
	            			}
	            		} else {
	            			if (beg == 1 || beg == 7) {
	            				rs_workdays = days - 2 * weeks - 1;
	            			} else {
	            				rs_workdays = days - 2 * weeks;
	            			}
	            		}
	            	}

	return rs_workdays;
	}
}
			
