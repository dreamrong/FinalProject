package member.API;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.jdbc.dao.MemberDaoService;

@WebServlet("/DeleteMember")
public class DeleteMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteMember() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		response.setHeader("Access-Control-Allow-Origin", "*");

		String account = request.getParameter("account");

		PrintWriter out = response.getWriter();

		MemberDaoService de = new MemberDaoService();
		String res = de.deleteMember(account);
		out.print(res);
		out.close();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
