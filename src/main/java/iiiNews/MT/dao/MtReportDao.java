package iiiNews.MT.dao;

import java.util.List;

public interface MtReportDao {
	//類別查詢For報表	
	public Long getMtArtTotalReport(String category, Integer status);
	
	//類別數量查詢For報表
	public List<Integer> getMtCateReport(String category);

}
