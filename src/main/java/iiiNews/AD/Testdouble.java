package iiiNews.AD;

import java.math.BigDecimal;

public class Testdouble {

	public Testdouble() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		Integer money = 5675;
		Double discount = 0.9;
		Double pay = money * discount;
		System.out.println("pay:"+pay);
		Integer count = (new BigDecimal(pay).setScale(0, BigDecimal.ROUND_HALF_UP)).intValue();
		System.out.println(count);
	}

}
