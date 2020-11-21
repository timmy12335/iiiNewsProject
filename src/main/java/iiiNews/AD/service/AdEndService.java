package iiiNews.AD.service;

import java.util.ArrayList;
import java.util.Map;

public interface AdEndService {
	
	public Map<String, Integer> eachCateCount(ArrayList<String> array,String cpmemberId);
	
	public Map<String, Integer> eachCatePrice(String cpmemberId);
	
	public Map<String, Integer> allOrderPriceAndCount();
}
