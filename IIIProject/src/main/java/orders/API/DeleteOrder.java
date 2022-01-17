package orders.API;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orders.jdbc.dao.OrderDaoService;

@WebServlet("/DeleteOrder")
public class DeleteOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteOrder() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		response.setHeader("Access-Control-Allow-Origin", "*");

		String OrderId = request.getParameter("Order_id");
		String ProductId = request.getParameter("Product_id");

		PrintWriter out = response.getWriter();
		
		OrderDaoService req = new OrderDaoService();
		String res = req.DeleteOrder(OrderId,ProductId);
		out.print(res);
		out.close();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
