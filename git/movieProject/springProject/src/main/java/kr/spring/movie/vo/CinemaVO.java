package kr.spring.movie.vo;

public class CinemaVO {
   private String url;
   private String title;
   private String count;
   
   public String getUrl() {
      return url;
   }
   public void setUrl(String url) {
      this.url = url;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getCount() {
      return count;
   }
   public void setCount(String count) {
      this.count = count;
   }
   @Override
   public String toString() {
      return "CinemaVO [url=" + url + ", title=" + title + ", count=" + count + "]";
   }
   
}