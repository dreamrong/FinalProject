package member.API;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.jdbc.dao.MemberDaoService;

@WebServlet("/UpdateMember")
public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateMember() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		
		String name = request.getParameter("name");
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String birthdate = request.getParameter("birthDate");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String status = request.getParameter("status");
		String page = request.getParameter("page");
		String callBackUrl = request.getParameter("callBackUrl");
		if(gender == null) {
			gender="";
		}
		

		MemberDaoService up = new MemberDaoService();
		String res = up.updateMember(name,account,password,email,birthdate,
				gender,address,phone,status);
		
//		if(page.equals("admin")) {
//			response.sendRedirect("http://localhost/AdminPage/MemberAdmin.html");	
//		}else if(page.equals("member")){
//			response.sendRedirect("http://localhost/MemberCenter/MemberData.html");
//		}
		
		response.sendRedirect(callBackUrl);
		
		System.out.println("更新會員帳號:"+account);
		System.out.println("更新會員密碼:"+password);
		System.out.println("更新會員名稱:"+name);
		
		return;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
