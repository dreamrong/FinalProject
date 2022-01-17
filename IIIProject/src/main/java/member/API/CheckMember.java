package member.API;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.jdbc.dao.MemberDaoService;


@WebServlet("/CheckMember")
public class CheckMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CheckMember() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setHeader("Access-Control-Allow-Origin", "*");
	    
		String account = request.getParameter("account");
		PrintWriter out = response.getWriter();
	     
		MemberDaoService m = new MemberDaoService();
		String s = m.signAccountOAuth(account);
		out.print(s);
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
