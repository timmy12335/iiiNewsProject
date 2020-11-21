package iiiNews.AD.model;

import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="AdOrderItems")
public class AdOrderItemBean {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer itemPk;			//資料庫自增編號
	
	
	private Integer adPk;				//商品(廣告的)的編號資料庫自增編號
	private String adNo;				//商品的編號 (廣告的編號)
	
	
	private Integer unitPrice;			//商品的價格 (廣告的價格)
	private Integer quantity;			//訂購的數量
	
	private String sellerMemberId;		//^^^^賣家會員帳號
	private String sellerMemberName;		//^^^^賣家會員帳號
	private String buyerMemberId;		//賣家會員帳號
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	private Timestamp soldDate;	//上傳的日期戳記
	@JsonIgnore
	private Blob adImage;				//客戶上傳的照片
	private String adImageName;			//客戶上傳照片的檔名
	
	
	
	private String categoryNo;		//廣告欄位的位置分類
	private Double width;			//紀錄欄位的寬
	private Double height;			//紀錄欄位的高
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone="Asia/Taipei")
	private Date adDate;			//欄位要販賣的日期
	
	@Transient
	private MultipartFile productImage;		//$$$$image 處理上傳圖片的問題
	
	@ManyToOne
	@JoinColumn(name = "FK_AdOrderBean_orderNo")
	AdOrderBean adOrderBean;
	//雙向多對一  多方內有個儲存一方物件參考的實例變數
	//外鍵在多方 定義說明外鍵的名字是什麼是誰
	
	
	public AdOrderItemBean() {
	}

	//有傳參數的建構子
	public AdOrderItemBean(Integer itemPk,Integer adPk, String adNo, Integer unitPrice, Integer quantity, String sellerMemberId,
			String sellerMemberName, String buyerMemberId, String categoryNo, Double width, Double height, Date adDate, Timestamp soldDate) {
		super();
		this.itemPk = itemPk;
		this.adPk = adPk;
		this.adNo = adNo;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.sellerMemberId = sellerMemberId;
		this.buyerMemberId = buyerMemberId;
		this.categoryNo = categoryNo;
		this.width = width;
		this.height = height;
		this.adDate = adDate;
		this.soldDate = soldDate;
		this.sellerMemberName = sellerMemberName;
	}

	public Integer getItemPk() {
		return itemPk;
	}

	public void setItemPk(Integer itemPk) {
		this.itemPk = itemPk;
	}
	
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


	public Integer getUnitPrice() {
		return unitPrice;
	}


	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}


	public Integer getQuantity() {
		return quantity;
	}


	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}


	public String getSellerMemberId() {
		return sellerMemberId;
	}


	public void setSellerMemberId(String sellerMemberId) {
		this.sellerMemberId = sellerMemberId;
	}


	public Blob getAdImage() {
		return adImage;
	}


	public void setAdImage(Blob adImage) {
		this.adImage = adImage;
	}


	public String getAdImageName() {
		return adImageName;
	}


	public void setAdImageName(String adImageName) {
		this.adImageName = adImageName;
	}


	public String getBuyerMemberId() {
		return buyerMemberId;
	}


	public void setBuyerMemberId(String buyerMemberId) {
		this.buyerMemberId = buyerMemberId;
	}


	public AdOrderBean getAdOrderBean() {
		return adOrderBean;
	}


	public void setAdOrderBean(AdOrderBean adOrderBean) {
		this.adOrderBean = adOrderBean;
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

	@Override
	public String toString() {
		return "AdOrderItemBean [itemPk=" + itemPk + ", adPk=" + adPk + ", adNo=" + adNo + ", unitPrice=" + unitPrice + ", quantity="
				+ quantity + ", sellerMemberId=" + sellerMemberId + ", adImage=" + adImage + ", adImageName="
				+ adImageName + ", buyerMemberId=" + buyerMemberId + ", adOrderBean=" + adOrderBean + "]";
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public Timestamp getSoldDate() {
		return soldDate;
	}

	public void setSoldDate(Timestamp soldDate) {
		this.soldDate = soldDate;
	}

	public String getSellerMemberName() {
		return sellerMemberName;
	}

	public void setSellerMemberName(String sellerMemberName) {
		this.sellerMemberName = sellerMemberName;
	}
	
	
	

}
