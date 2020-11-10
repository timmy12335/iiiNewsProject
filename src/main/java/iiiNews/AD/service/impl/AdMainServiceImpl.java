package iiiNews.AD.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iiiNews.AD.dao.AdMainDao;
import iiiNews.AD.model.AdBean;
import iiiNews.AD.service.AdMainService;

@Service
public class AdMainServiceImpl implements AdMainService {
	
	@Autowired
	AdMainDao adMaindao;
	
	
	public AdMainServiceImpl() {
	}

	@Override
	@Transactional
	public int saveAds(AdBean ab) {
		int n = 0;
		adMaindao.saveAds(ab);
		n++;
		return n;
	}
	
	@Override
	@Transactional
	public String createAdNo() {
		/*處理廣告編號問題
		 * 編號命名方式 AD+日期+編號 AD2020102500001
		 * 取得最後一筆編號資料進行判斷
		 * 如果不是今天日期 代表今天沒資料 則是今天日期然後編號是00001
		 * 如果有今天日期 則後面數字加一*/
		
		String noStr = null;
		java.util.Date dnow = new java.util.Date();
		//取得最後一筆的編號資料
		AdBean lastRecord = adMaindao.getLastRecord();
		String lastRecordNo = null;
		String lastRecordNoDate = null;
		//設定時間格式	取得現在時間	將時間轉成想要的格式並設為Date型態以供比對
		SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMdd");
		
		if(lastRecord == null) {
			noStr = "AD"+ft.format(dnow)+"00001";
		}else {
			lastRecordNo = lastRecord.getAdNo();
			lastRecordNoDate = lastRecordNo.substring(2,10);
			
			noStr = "AD"+ft.format(dnow);
			
			//用字串的方式進行比較
			if(ft.format(dnow).equals(lastRecordNoDate)) {
				noStr += String.format("%05d",(Integer.parseInt(lastRecordNo.substring(10))+1));
			}else {
				noStr = "AD"+ft.format(dnow)+"00001";
			}
			System.out.println(noStr);
			
		}
		return noStr;
	}

	@Override
	@Transactional
	public List<AdBean> getAllAds() {
		return adMaindao.getAllAds();
	}

	@Override
	@Transactional
	public AdBean getLastRecord() {
		return adMaindao.getLastRecord();
	}
	
	
	@Override
	@Transactional
	public List<AdBean> getCpMemberAdList(String cpmemberId) {
		return adMaindao.getCpMemberAdList(cpmemberId);
	}

	@Override
	@Transactional
	public int deleteAdByMemberPkid(int pkId) {
		int n = 0;
		adMaindao.deleteAdByMemberPkid(pkId);
		n++;
		return n;
	}

	@Override
	@Transactional
	public AdBean getOneAdByadPk(int adPk) {
		return adMaindao.getOneAdByadPk(adPk);
	}
	
	@Override
	@Transactional
	public void changeStatus() {
		adMaindao.changeStatus();
	}
	
	//ajax
	@Override
	@Transactional
	public List<AdBean> getPageAds(Integer pageNo) {
		return adMaindao.getPageAds(pageNo);
	}
	
	//ajax
	@Override
	@Transactional
	public int getTotalPageCount() {
		return adMaindao.getTotalPageCount();
	}

	
	


	
	

}
