package iiiNews.AD.model;

import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "AdOrders")
public class AdOrderBean {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer adOrderPk;		//資料庫自增編號
	
	private String adOrderNo;		//我們去撰寫的訂單編號
	
	private String buyerMemberId;	//^^^^ 訂購者帳號
	private Integer totalAmount;		//訂單總額
	private Timestamp orderDate;			//訂單成立時間
	
	private String payingDetail; 	//$$$$ 其他資訊 先備用
	
	@OneToMany(mappedBy="adOrderBean", cascade=CascadeType.ALL)
	Set<AdOrderItemBean> items = new LinkedHashSet<>();
	//雙向多對一  一方有個多 儲存多方的物件 告訴他本類別沒有外鍵 提供外鍵的相關資訊給他
	
	
	public AdOrderBean() {
	}
	
	//有傳參數的建構子
	public AdOrderBean(Integer adOrderPk, String adOrderNo, String buyerMemberId, Integer totalAmount, Timestamp orderDate,
			String payingDetail, Set<AdOrderItemBean> items) {
		super();
		this.adOrderPk = adOrderPk;
		this.adOrderNo = adOrderNo;
		this.buyerMemberId = buyerMemberId;
		this.totalAmount = totalAmount;
		this.orderDate = orderDate;
		this.payingDetail = payingDetail;
		this.items = items;
	}
	

	public Integer getAdOrderPk() {
		return adOrderPk;
	}


	public void setAdOrderPk(Integer adOrderPk) {
		this.adOrderPk = adOrderPk;
	}


	public String getAdOrderNo() {
		return adOrderNo;
	}


	public void setAdOrderNo(String adOrderNo) {
		this.adOrderNo = adOrderNo;
	}


	public String getBuyerMemberId() {
		return buyerMemberId;
	}


	public void setBuyerMemberId(String buyerMemberId) {
		this.buyerMemberId = buyerMemberId;
	}


	public Integer getTotalAmount() {
		return totalAmount;
	}


	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}


	public Timestamp getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}


	public String getPayingDetail() {
		return payingDetail;
	}


	public void setPayingDetail(String payingDetail) {
		this.payingDetail = payingDetail;
	}


	public Set<AdOrderItemBean> getItems() {
		return items;
	}


	public void setItems(Set<AdOrderItemBean> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "AdOrderBean [adOrderPk=" + adOrderPk + ", adOrderNo=" + adOrderNo + ", buyerMemberId=" + buyerMemberId
				+ ", totalAmount=" + totalAmount + ", orderDate=" + orderDate + ", payingDetail=" + payingDetail + "]";
	}

	
	
}
