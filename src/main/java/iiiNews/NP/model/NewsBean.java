package iiiNews.NP.model;

import java.io.Serializable;
import java.sql.Time;
import java.sql.Timestamp;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
@Entity
@Table(name="NewsProducts")
public class NewsBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer newsProduct_pk;
	private String newsId;
	private String memberId;
	private String companyId;
	private String newsType;
	private String title;
	private Timestamp uploadTime;
	private String location;
	private Timestamp happenTime;
	@Transient
	private String imageNum;
	@Column(columnDefinition = "nvarchar(MAX) NOT NULL")
	private String outline;
	@Column(columnDefinition = "nvarchar(MAX) NOT NULL")
	private String article;
	private String price;
	private Time limitTime;
	private Integer status;
	
	@OneToOne(cascade = CascadeType.PERSIST) 
	@JoinColumn(name = "fk_images_id")
	private ImageBean imagebean;
	
	public NewsBean() {
		
	}
	
	@Override
	public String toString() {
		return "NewsBean [newsProduct_pk=" + newsProduct_pk + ", newsId=" + newsId + ", memberId=" + memberId
				+ ", companyId=" + companyId + ", newsType=" + newsType + ", title=" + title + ", uploadTime="
				+ uploadTime + ", location=" + location + ", happenTime=" + happenTime + ", outline=" + outline
				+ ", article=" + article + ", price=" + price + ", limitTime=" + limitTime + ", status=" + status
				+ ", imagebean=" + imagebean + "]";
	}

	public NewsBean(Integer newsProduct_pk, String newsId, String memberId, String companyId, String newsType,
			String title, Timestamp uploadTime, String location, Timestamp happenTime, String outline, String article,
			String price, Time limitTime, Integer status, ImageBean imagebean) {
		super();
		this.newsProduct_pk = newsProduct_pk;
		this.newsId = newsId;
		this.memberId = memberId;
		this.companyId = companyId;
		this.newsType = newsType;
		this.title = title;
		this.uploadTime = uploadTime;
		this.location = location;
		this.happenTime = happenTime;
		this.outline = outline;
		this.article = article;
		this.price = price;
		this.limitTime = limitTime;
		this.status = status;
		this.imagebean = imagebean;
	}

	public Integer getNewsProduct_pk() {
		return newsProduct_pk;
	}
	public void setNewsProduct_pk(Integer newsProduct_pk) {
		this.newsProduct_pk = newsProduct_pk;
	}
	public String getNewsId() {
		return newsId;
	}
	public void setNewsId(String newsId) {
		this.newsId = newsId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getNewsType() {
		return newsType;
	}
	public void setNewsType(String newsType) {
		this.newsType = newsType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Timestamp getHappenTime() {
		return happenTime;
	}
	public void setHappenTime(Timestamp happenTime) {
		this.happenTime = happenTime;
	}
//	public String getImageNum() {
//		return imageNum;
//	}
//	public void setImageNum(String imageNum) {
//		this.imageNum = imageNum;
//	}
	public String getOutline() {
		return outline;
	}
	public void setOutline(String outline) {
		this.outline = outline;
	}
	public String getArticle() {
		return article;
	}
	public void setArticle(String article) {
		this.article = article;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Time getLimitTime() {
		return limitTime;
	}
	public void setLimitTime(Time limitTime) {
		this.limitTime = limitTime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
	
	
	
	
	
	
	
	
	
}
