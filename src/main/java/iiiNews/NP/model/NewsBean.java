package iiiNews.NP.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name="NP_NewsProducts")
public class NewsBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer newsProduct_pk;
	private String newsId;
	private String memberId;
	private String newsType;
	private String title;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	private Timestamp uploadTime;
	private String location;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss", timezone="Asia/Taipei")
	private String happenTime;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone="Asia/Taipei")
	private Date happenDate;
	
	@Column(columnDefinition = "nvarchar(MAX) NOT NULL")
	private String outline;
	@Column(columnDefinition = "nvarchar(MAX) NOT NULL")
	private String article;
	private Integer price;
	private Time limitTime;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd HH:mm:ss", timezone="Asia/Taipei")
	private Timestamp futureTime;
	@JsonIgnore
	private Integer status;
	@JsonIgnore
	private String pic_One;
	@JsonIgnore
	private String pic_Two;
	@JsonIgnore
	private String pic_Three;
	@JsonIgnore
	private Blob img_I;
	@JsonIgnore
	private Blob img_II;
	@JsonIgnore
	private Blob img_III;
	@JsonIgnore
	@Transient
	private MultipartFile[] productImage;
	
	
	public NewsBean() {
		
	}
	
	

	public NewsBean(Integer newsProduct_pk, String newsId, String memberId, String newsType,
			String title, Timestamp uploadTime, String location, String happenTime, String outline, String article,
			Integer price, Time limitTime, Integer status) {
		super();
		this.newsProduct_pk = newsProduct_pk;
		this.newsId = newsId;
		this.memberId = memberId;
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
	public String getHappenTime() {
		return happenTime;
	}
	public void setHappenTime(String happenTime) {
		this.happenTime = happenTime;
	}

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
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Time getLimitTime() {
		return limitTime;
	}
	public void setLimitTime(Time limitTime) {
		this.limitTime = limitTime;
	}
	public Timestamp getFutureTime() {
		return futureTime;
	}
	public void setFutureTime(Timestamp futureTime) {
		this.futureTime = futureTime;
	}

	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getPic_One() {
		return pic_One;
	}

	public void setPic_One(String pic_One) {
		this.pic_One = pic_One;
	}

	public String getPic_Two() {
		return pic_Two;
	}

	public void setPic_Two(String pic_Two) {
		this.pic_Two = pic_Two;
	}

	public String getPic_Three() {
		return pic_Three;
	}

	public void setPic_Three(String pic_Three) {
		this.pic_Three = pic_Three;
	}

	public Blob getImg_I() {
		return img_I;
	}

	public void setImg_I(Blob img_I) {
		this.img_I = img_I;
	}

	public Blob getImg_II() {
		return img_II;
	}

	public void setImg_II(Blob img_II) {
		this.img_II = img_II;
	}

	public Blob getImg_III() {
		return img_III;
	}

	public void setImg_III(Blob img_III) {
		this.img_III = img_III;
	}
	public MultipartFile[] getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile[] productImage) {
		this.productImage = productImage;
	}

	public Date getHappenDate() {
		return happenDate;
	}

	public void setHappenDate(Date happenDate) {
		this.happenDate = happenDate;
	}
		
	
}
