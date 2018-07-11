package Filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebFilter(filterName="Filter_InformationShowFilter",urlPatterns={"/Control/Information_Show"})
public class InformationShowFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession session = request.getSession(false);
		String authority =(String) session.getAttribute("authority");
		authority = authority.toLowerCase();
		if (authority.equals("admin") ){			
			chain.doFilter(req, resp);
		}else{
			request.setAttribute("id",request.getParameter("test_userid"));
			request.setAttribute("msg","For admin only!");
			request.getRequestDispatcher("Information_Show.jsp").forward(request, response);
			//response.sendRedirect(request.getHeader("referer")+"?msg=For admin only!");
			
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
