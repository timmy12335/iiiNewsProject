package iiiNews.MT.service.Impl;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iiiNews.MT.dao.MtReportDao;
import iiiNews.MT.service.MtReportService;

@Service
@Transactional
public class MtReportServiceImpl implements MtReportService{
	
	@Autowired
	MtReportDao mtReportDao;
	
	public MtReportServiceImpl() {
	}

	@Override
	public Map<String, Long> getMtArtTotalReport() {
		Map<String, Long> map = new LinkedHashMap<>();		//用LinkedHashMap排序才會正確
		map.put("未分類", mtReportDao.getMtArtTotalReport("未分類", 1));
		map.put("生活", mtReportDao.getMtArtTotalReport("生活", 1));
		map.put("娛樂", mtReportDao.getMtArtTotalReport("娛樂", 1));
		map.put("問卦", mtReportDao.getMtArtTotalReport("問卦", 1));
		map.put("美食", mtReportDao.getMtArtTotalReport("美食", 1));
		map.put("運動", mtReportDao.getMtArtTotalReport("運動", 1));
		map.put("趣味", mtReportDao.getMtArtTotalReport("趣味", 1));
		map.put("寵物", mtReportDao.getMtArtTotalReport("寵物", 1));

		return map;
	}

	@Override
	public Integer getMtCateReport(String category) {
		List<Integer> list = mtReportDao.getMtCateReport(category);
		int sum = 0;
		for(int i = 0; i < list.size(); i++) {
			sum += list.get(i);
		}
		return sum;
	}
	
	
}
