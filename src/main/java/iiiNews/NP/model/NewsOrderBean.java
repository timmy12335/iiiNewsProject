package iiiNews.NP.model;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "NewsOrder")
public class NewsOrderBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer newsProduct_pk;
	private Integer order_pk;
	private String orderId;
	private String memberId;
	private String companyId;
	private String newsId;
	private Integer orderPrice;
	private Timestamp soldTime;
	
	
	
	
	public NewsOrderBean() {
	}
	
	@Override
	public String toString() {
		return "NewsOrderBean [newsProduct_pk=" + newsProduct_pk + ", order_pk=" + order_pk + ", orderId=" + orderId
				+ ", memberId=" + memberId + ", companyId=" + companyId + ", newsId=" + newsId + ", orderPrice="
				+ orderPrice + ", soldTime=" + soldTime + "]";
	}

	public NewsOrderBean(Integer newsProduct_pk, Integer order_pk, String orderId, String memberId, String companyId,
			String newsId, Integer orderPrice, Timestamp soldTime) {
		super();
		this.newsProduct_pk = newsProduct_pk;
		this.order_pk = order_pk;
		this.orderId = orderId;
		this.memberId = memberId;
		this.companyId = companyId;
		this.newsId = newsId;
		this.orderPrice = orderPrice;
		this.soldTime = soldTime;
	}

	public Integer getOrder_pk() {
		return order_pk;
	}
	public void setOrder_pk(Integer order_pk) {
		this.order_pk = order_pk;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
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
	public String getNewsId() {
		return newsId;
	}
	public void setNewsId(String newsId) {
		this.newsId = newsId;
	}
	public Integer getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(Integer orderPrice) {
		this.orderPrice = orderPrice;
	}
	public Timestamp getSoldTime() {
		return soldTime;
	}
	public void setSoldTime(Timestamp soldTime) {
		this.soldTime = soldTime;
	}
	
	

}
