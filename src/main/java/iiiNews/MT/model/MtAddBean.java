package iiiNews.MT.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "MtArticleAdd")
public class MtAddBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer pkey;			//PK
	private String articleId;		//文章編號
	@Column(columnDefinition = "datetime2(7)")	//修改型態，預設為datetime2(7)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	private Timestamp updateDate;	//上傳時間
	private String memberId;		//會員編號
	private String articleStatus;	//文章狀態
	private String category;		//標籤分類
	private String title;			//標題
	@JsonIgnore
	private Blob imgLink;			//圖片連結
	private String imgName;			//圖片名字
	@Column(columnDefinition = "varchar(MAX)")
	private String videoLink;		//影片連結
	private String article;			//內文
	private String comment;			//留言
	private Integer status;			//文章狀態
	private String add2;
	private String add3;
	
	@JsonIgnore
	@OneToMany(mappedBy="mtAddBean", cascade=CascadeType.ALL ,fetch=FetchType.EAGER)
	List<MtCommentBean> items = new ArrayList<>();
	//雙向多對一  一方有個多 儲存多方的物件 告訴他本類別沒有外鍵 提供外鍵的相關資訊給他
	
	@Transient
	private MultipartFile Image;
	
//	@JsonIgnore
	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}


	public MtAddBean() {
	}
	
	public MtAddBean(Integer pkey, String articleId, Timestamp updateDate, String memberId, String articleStatus,
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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

	public List<MtCommentBean> getItems() {
		return items;
	}

	public void setItems(List<MtCommentBean> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "MtAddBean [items=" + items + "]";
	}
	
}
