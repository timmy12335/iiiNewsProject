package iiiNews.AD.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "AdProduct")
public class AdBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer adPk;			//資料庫自增編號
	
	private String adNo;			//我們去撰寫的產品編號
	private Timestamp uploadDate;	//上傳的日期戳記
	private String memberId;		//上傳的會員編號
	
	private String categoryNo;		//廣告欄位的位置分類
	private Double width;			//紀錄欄位的寬
	private Double height;			//紀錄欄位的高
	private Date adDate;			//欄位要販賣的日期
	private Integer price;			//價格（單價）
	private Integer stock;			//庫存量
	
	
	//要留一個外鍵欄位>>定義一個儲存一方的實例變數
	//商品項目是多方
	
	
	//預設建構子
	public AdBean() {
	}

	//傳參數建構子
	public AdBean(String adNo, Timestamp uploadDate, String memberId, String categoryNo, Double width, Double height,
			Date adDate, Integer price, Integer stock) {
		this.adNo = adNo;
		this.uploadDate = uploadDate;
		this.memberId = memberId;
		this.categoryNo = categoryNo;
		this.width = width;
		this.height = height;
		this.adDate = adDate;
		this.price = price;
		this.stock = stock;
	}
	

	//所有對應的getter setter
	public Integer getAdPk() {
		return adPk;
	}

	public void setAdPk(Integer adPk) {
		this.adPk = adPk;
	}

	public String getAdNo() {
		return adNo;
	}

	public void setAdNo(String adNo) {
		this.adNo = adNo;
	}

	public Timestamp getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Timestamp uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	public Double getWidth() {
		return width;
	}

	public void setWidth(Double width) {
		this.width = width;
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public Date getAdDate() {
		return adDate;
	}

	public void setAdDate(Date adDate) {
		this.adDate = adDate;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}
	
	

}
