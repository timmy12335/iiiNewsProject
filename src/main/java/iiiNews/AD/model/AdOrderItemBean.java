package iiiNews.AD.model;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="AdOrderItems")
public class AdOrderItemBean {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer itemPk;			//資料庫自增編號
	
	private Integer adId;				//商品的編號 (廣告的編號)
	private Double unitPrice;			//商品的價格 (廣告的價格)
	private Integer quantity;			//訂購的數量
	private String sellerMemberId;		//^^^^賣家會員帳號
	
	private Blob adImage;				//客戶上傳的照片
	private String adImageName;			//客戶上傳照片的檔名
	
	private String buyerMemberId;		//賣家會員帳號
	
//	@Transient
//	private MultipartFile productImage;		//$$$$image 處理上傳圖片的問題
	
	@ManyToOne
	@JoinColumn(name = "FK_AdOrderBean_orderNo")
	AdOrderBean adOrderBean;
	//雙向多對一  多方內有個儲存一方物件參考的實例變數
	//外鍵在多方 定義說明外鍵的名字是什麼是誰
	
	
	public AdOrderItemBean() {
	}


	public Integer getItemPk() {
		return itemPk;
	}


	public void setItemPk(Integer itemPk) {
		this.itemPk = itemPk;
	}


	public Integer getAdId() {
		return adId;
	}


	public void setAdId(Integer adId) {
		this.adId = adId;
	}


	public Double getUnitPrice() {
		return unitPrice;
	}


	public void setUnitPrice(Double unitPrice) {
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
	
	
	

}
