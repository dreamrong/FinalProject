package member.API;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.jdbc.dao.MemberDaoService;

/**
 * Servlet implementation class GetOneMember
 */
@WebServlet("/GetOneMember")
public class GetOneMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public GetOneMember() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		
		String account = request.getParameter("account");
		
		
		MemberDaoService m = new MemberDaoService();
		String s = m.getSinglaMember(account);
	
		
		PrintWriter out = response.getWriter();
		
		out.print(s);	
	
		
		out.close();

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
