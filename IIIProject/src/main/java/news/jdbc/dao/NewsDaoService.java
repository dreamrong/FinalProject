package news.jdbc.dao;

import com.google.gson.Gson;

import news.jdbc.bean.News;

public class NewsDaoService {

	public String insertNews(String date, String title, String content) {

		date = date == null ? "" : date;
		title = title == null ? "" : title;
		content = content == null ? "" : content;

		if (date == "" || title == "" || content == "") {
			System.out.println("Fail,所有輸入值不能為0");
			return "Fail,所有輸入值不能為0";
		}
		News n = new News();
		n.setDate(date);
		n.setTitle(title);
		n.setContent(content);
		NewsDaoImpl tdao = new NewsDaoImpl();
		tdao.insertNews(n);
		System.out.println("Success,新增成功");
		Gson gson = new Gson();
		return gson.toJson(n);

	}

	public String updateNews(String newsId, String date, String title, String content) {
		newsId = newsId == null ? "" : newsId;
		date = date == null ? "" : date;
		title = title == null ? "" : title;
		content = content == null ? "" : content;

		if (newsId == "" || date == "" || title == "" || content == "") {
			System.out.println("Fail,所有輸入值不能為0");
			return "Fail,所有輸入值不能為0";
		}
		News n = new News();
		n.setNewsId(Integer.valueOf(newsId));
		n.setDate(date);
		n.setTitle(title);
		n.setContent(content);
		NewsDaoImpl tdao = new NewsDaoImpl();
		tdao.updateNews(n);
		System.out.println("Success,更新成功");
		Gson gson = new Gson();
		return gson.toJson(n);

	}

	public String deleteNews(String newsId) {

		if (newsId == "" || newsId == null) {
			System.out.println("Fail,newsId不能為空值");
			return "Fail,newsId不能為空值";
		}
		Integer newsIdNumber = Integer.valueOf(newsId);
		NewsDaoImpl tdao = new NewsDaoImpl();
		News n = tdao.findNews(newsIdNumber);
		
		if(n.getNewsId() != 0) {
			Gson gson = new Gson();
			tdao.deleteNews(newsIdNumber);
			System.out.println("Success,刪除成功");
			return gson.toJson(n);	
		}else {
			System.out.println("Fail,無此newsId");
			return "Fail,無此newsId";
		}
		
		
		
		

	}

}
