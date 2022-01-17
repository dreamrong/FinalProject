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
 * Servlet implementation class SendPasswordMail
 */
@WebServlet("/SendPasswordMail")
public class SendPasswordMail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SendPasswordMail() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		
		String account = request.getParameter("account");
		String mail = request.getParameter("email");
		
		MemberDaoService m = new MemberDaoService();
		String s = m.getSinglaMember(account);
		String[] result = s.split(",");
		
		PrintWriter out = response.getWriter();
		
		if(result[0].equals("Success")) {
			if(result[5].equals(mail)) {
				out.print("Success,"+result[5]+","+result[4]);	
			}else {
				out.print("Fail,Email錯誤");	
			}
		}else {
			out.print("Fail,帳號錯誤");	
		}
		
		
		out.close();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
