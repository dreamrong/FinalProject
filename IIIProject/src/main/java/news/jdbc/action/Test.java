package news.jdbc.action;

import java.util.List;

import com.google.gson.Gson;

import news.jdbc.bean.News;
import news.jdbc.dao.NewsDaoImpl;

public class Test {

	public static void main(String[] args) {
		// DaoImpl
		// ========================================
		System.out.println("切割--------------------");
		// 查詢一筆
//		NewsDaoImpl tdao = new NewsDaoImpl();
//		News n = tdao.findNews(9);
//		System.out.println(n.getNewsId());
//		System.out.println(n.getDate());
//		System.out.println(n.getTitle());
//		System.out.println(n.getContent());

		// 查詢全部
//		NewsDaoImpl tdao = new NewsDaoImpl();
//		List<News> n = tdao.findAllNews();
//		for(News news:n) {
//			System.out.print(news.getNewsId()+",");
//			System.out.print(news.getDate()+",");
//			System.out.print(news.getTitle()+",");
//			System.out.print(news.getContent());
//			System.out.println();
//		}
//		Gson gson = new Gson();
//		gson.toJson(n);
//		System.out.println(n);//透過Gson把Object轉換成JSON

		// 新增
//		News n = new News();
//		n.setDate("2021-07-07 13:01");
//		n.setTitle("title04");
//		n.setContent("content04");
//		NewsDaoImpl tdao = new NewsDaoImpl();
//		tdao.insertNews(n);

		// 更新
//		News n = new News();
//		n.setNewsId(3);
//		n.setDate("2021-10-07 13:01");
//		n.setTitle("title03");
//		n.setContent("content03");
//		NewsDaoImpl tdao = new NewsDaoImpl();
//		tdao.updateNews(n);

		// 刪除
//		News n = new News();
//		NewsDaoImpl tdao = new NewsDaoImpl();
//		tdao.deleteNews(5);

	}

}
