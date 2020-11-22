package iiiNews.MT.service;

import java.util.Map;

public interface MtReportService {
	//將類別筆數塞進map
	Map<String, Long> getMtArtTotalReport();
	
	//將類別數量放進map
	public Integer getMtCateReport(String category);

}
