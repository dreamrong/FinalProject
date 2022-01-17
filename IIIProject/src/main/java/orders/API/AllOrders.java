package orders.API;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orders.jdbc.dao.OrderDaoService;

/**
 * Servlet implementation class AllOrders
 */
@WebServlet("/AllOrders")
public class AllOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AllOrders() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setHeader("Access-Control-Allow-Origin", "*");
	     
		PrintWriter out = response.getWriter();
		
		OrderDaoService test = new OrderDaoService();
		String res = test.getAllOrders();
		
		out.print(res);
		out.close();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
