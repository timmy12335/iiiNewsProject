package iiiNews.MT.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "MtArticleAdd")
public class MtAddBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer pkey;			//PK
	private String articleId;		//文章編號
	@Column(columnDefinition = "datetime2(2)")	//修改型態，預設為datetime2(7)
	private Timestamp updateDate;	//上傳時間
	private Integer memberId;		//會員編號
	private String articleStatus;	//文章狀態
	private String category;		//標籤分類
	private String title;			//標題
//	@JsonIgnore
	private Blob imgLink;			//圖片連結
	private String imgName;			//圖片名字
	@Column(columnDefinition = "varchar(MAX)")
	private String videoLink;		//影片連結
	private String article;			//內文
	private String comment;			//留言
	private String add1;
	private String add2;
	private String add3;
	
	@Transient
	private MultipartFile Image;

	public MtAddBean(Integer pkey, String articleId, Timestamp updateDate, Integer memberId, String articleStatus,
			String category, String title, Blob imgLink, String videoLink, String article, String comment) {
		super();
		this.pkey = pkey;
		this.articleId = articleId;
		this.updateDate = updateDate;
		this.memberId = memberId;
		this.articleStatus = articleStatus;
		this.category = category;
		this.title = title;
//		this.imgLink = imgLink;
		this.videoLink = videoLink;
		this.article = article;
		this.comment = comment;
	}

	public MtAddBean() {
	}

	public Integer getPkey() {
		return pkey;
	}

	public void setPkey(Integer pkey) {
		this.pkey = pkey;
	}

	public String getArticleId() {
		return articleId;
	}

	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}

	public Timestamp getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getArticleStatus() {
		return articleStatus;
	}

	public void setArticleStatus(String articleStatus) {
		this.articleStatus = articleStatus;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Blob getImgLink() {
		return imgLink;
	}

	public void setImgLink(Blob imgLink) {
		this.imgLink = imgLink;
	}

	public String getVideoLink() {
		return videoLink;
	}

	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}

	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getAdd1() {
		return add1;
	}

	public void setAdd1(String add1) {
		this.add1 = add1;
	}

	public String getAdd2() {
		return add2;
	}

	public void setAdd2(String add2) {
		this.add2 = add2;
	}

	public String getAdd3() {
		return add3;
	}

	public void setAdd3(String add3) {
		this.add3 = add3;
	}

	public MultipartFile getImage() {
		return Image;
	}

	public void setImage(MultipartFile image) {
		Image = image;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	
}
