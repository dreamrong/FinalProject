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
 * Servlet implementation class SearchOneOrder
 */
@WebServlet("/DetailsOrder")
public class DetailsOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DetailsOrder() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		
		PrintWriter out = response.getWriter();
		
		String OrderId = request.getParameter("OrderId");
		String ProductId = request.getParameter("ProductId");
		System.out.println("getParameter: "+OrderId);
		System.out.println("getParameter: "+ProductId);
		OrderDaoService test = new OrderDaoService();
		String res = test.searchDetailsOrderByOrderIdAndProductId(OrderId,ProductId);
		
		out.print(res);
		out.close();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
