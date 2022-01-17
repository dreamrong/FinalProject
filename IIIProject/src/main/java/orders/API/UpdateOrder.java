package orders.API;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orders.jdbc.dao.OrderDaoService;


@WebServlet("/UpdateOrder")
public class UpdateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateOrder() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String OrderId = request.getParameter("Order_id");
		String ProductId = request.getParameter("Product_id");
		String Buy_amount = request.getParameter("Buy_amount");
		String Account = request.getParameter("Account");
		String OrderDate = request.getParameter("Order_date");
		String PickupDate = request.getParameter("Pickup_date");
		String CallBackUrl = request.getParameter("CallBackUrl");
		
		OrderDaoService test = new OrderDaoService();
		test.updateOrder(OrderId, ProductId, Buy_amount, Account, OrderDate, PickupDate);
		
		PrintWriter out = response.getWriter();
		out.print(OrderId+","+ProductId+","+Buy_amount+","+Account+","+OrderDate+","+PickupDate+","+CallBackUrl);
		
		if(CallBackUrl != null && CallBackUrl != "") {
			response.sendRedirect(CallBackUrl);	
		}
		
		out.close();
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
