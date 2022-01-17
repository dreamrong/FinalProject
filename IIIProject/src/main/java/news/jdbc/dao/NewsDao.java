package news.jdbc.dao;

import java.util.List;

import news.jdbc.bean.News;

public interface NewsDao {

	//Read
	News findNews(Integer newsId);
	
	//Read All
	List<News> findAllNews();

	//Create
	void insertNews(News n);
	
	//update
	void updateNews(News n);
	
	//delete
	void deleteNews(Integer newsId);
}
