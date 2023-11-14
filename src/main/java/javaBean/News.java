package javaBean;

public class News {
	private int news_id;
	private String title;
	private String author;
	private String category;
	private String cover_url;
	private String content;
	private int view_count;
	private String create_time;
	private String updateTime;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCover_url() {
		return cover_url;
	}
	public void setCover_url(String cover_url) {
		this.cover_url = cover_url;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreat_time(String creat_time) {
		this.create_time = creat_time;
	}
	public String getUpdate_Time() {
		return updateTime;
	}
	public void setUpdate_Time(String updateTime) {
		this.updateTime = updateTime;
	}
		public int getNews_id() {
		return news_id;
	}
	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}
	
	public News(int news_id, String title,String author,String category,String cover_url,String content,int view_count,String creat_time,String updateTime) {
		this.news_id=news_id;
		this.title=title;
		this.author=author;
		this.category=category;
		this.cover_url=cover_url;
		this.content=content;
		this.view_count=view_count;
		this.create_time=creat_time;
		this.updateTime=updateTime;
}
	public News() {
		// TODO Auto-generated constructor stub
	}

}
