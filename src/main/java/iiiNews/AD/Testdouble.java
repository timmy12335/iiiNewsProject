package iiiNews.AD;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

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
		
		String line = "";
		Map<String,Double> map = new HashMap<>();
		try (FileInputStream fis = new FileInputStream("data/discount.txt");
				InputStreamReader isr0 = new InputStreamReader(fis, "UTF-8");
				BufferedReader br = new BufferedReader(isr0);) {
			while ((line = br.readLine()) != null) {
				String[] sa = line.split("\\|");
				map.put(sa[0],Double.valueOf(sa[1]));
			}
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		System.out.println("==========================");
		String test = "GOOD";
		
		if (map.containsKey(test)) {
			System.out.println("contain:"+map.get(test));
		}else {
			System.out.println("no no no");
		}
		
		
//		System.out.println("hello:"+map.get("HELLO"));
		
		
		
	}

}
