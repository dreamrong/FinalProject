package news.API;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import news.jdbc.bean.News;
import news.jdbc.dao.NewsDaoImpl;
import news.jdbc.dao.NewsDaoService;
 
/**
 * Servlet implementation class News
 */
@WebServlet("/NewsAPI/*")
public class NewsAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Gson gson = new Gson();

	public NewsAPI() {
		super();

	}

	private void sendAsJson(HttpServletRequest request, HttpServletResponse response, Object obj) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods", "PUT, POST, GET, DELETE, OPTIONS");
		response.setContentType("application/json");

		String res = gson.toJson(obj);

		PrintWriter out = response.getWriter();

		out.print(res);
		out.flush();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pathInfo = request.getPathInfo();

		NewsDaoImpl tdao = new NewsDaoImpl();

		if (pathInfo == null || pathInfo.equals("/")) {// 查詢全部資料
			List<News> n = tdao.findAllNews();
			sendAsJson(request, response, n);

			return;
		}

		String[] splits = pathInfo.split("/");
		if (splits.length != 2) {// 輸入不對的url路徑 ex: /1/2
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}

		Integer newsId = Integer.valueOf(splits[1]);// 抓參數 ex: /1
		News n = tdao.findNews(newsId);// 搜尋單筆資料
		if (n.getNewsId() == 0) {// 如果該筆資料不存在
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}

		sendAsJson(request, response, n);// 送出單筆資料查詢
		return;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pathInfo = request.getPathInfo();

		if (pathInfo.equals("/Insert")) {
			
			String date = request.getParameter("Date");
			String title = request.getParameter("Title");
			String content = request.getParameter("Content");

			
			System.out.println("Date: " + date);
			System.out.println("Title: " + title);
			System.out.println("Content: " + content);

			NewsDaoService newsService = new NewsDaoService();

			sendAsJson(request, response, newsService.insertNews(date, title, content));// 
			return;
			
		}
		if (pathInfo.equals("/Update")) {

			String newsId = request.getParameter("NewsId");
			String date = request.getParameter("Date");
			String title = request.getParameter("Title");
			String content = request.getParameter("Content");

			System.out.println("NewsId: " + newsId);
			System.out.println("Date: " + date);
			System.out.println("Title: " + title);
			System.out.println("Content: " + content);

			NewsDaoService newsService = new NewsDaoService();

			sendAsJson(request, response, newsService.updateNews(newsId, date, title, content));// ����update
			return;

		}

		if (pathInfo.equals("/Delete")) {
			String newsId = request.getParameter("NewsId");
			System.out.println("NewsId: " + newsId);
			NewsDaoService newsService = new NewsDaoService();
			sendAsJson(request, response, newsService.deleteNews(newsId));
			return;
		}
		
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;

	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
