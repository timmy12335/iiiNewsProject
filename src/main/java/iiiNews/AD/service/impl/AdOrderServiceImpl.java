package iiiNews.AD.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import iiiNews.AD.dao.AdOrderDao;
import iiiNews.AD.model.AdOrderBean;
import iiiNews.AD.service.AdOrderService;

@Service
public class AdOrderServiceImpl implements AdOrderService {
	
	@Autowired
	AdOrderDao adOrderDao;
	
	public AdOrderServiceImpl() {
	}

	@Override
	public List<AdOrderBean> getMemberOrderList(int memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public String createOrderNo() {
		/*處理廣告編號問題
		 * 編號命名方式 ADorder+日期+編號 ADorder2020102500001
		 * 取得最後一筆編號資料進行判斷
		 * 如果不是今天日期 代表今天沒資料 則是今天日期然後編號是00001
		 * 如果有今天日期 則後面數字加一*/
		
		String noStr = null;
		java.util.Date dnow = new java.util.Date();
		//取得最後一筆的編號資料
		AdOrderBean lastRecord = adOrderDao.getLastRecord();

		String lastRecordNo = null;
		String lastRecordNoDate = null;
		//設定時間格式	取得現在時間	將時間轉成想要的格式並設為Date型態以供比對
		SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMdd");
		
		if(lastRecord == null) {
			noStr = "ADorder"+ft.format(dnow)+"00001";
		}else {
			lastRecordNo = lastRecord.getAdOrderNo();
			lastRecordNoDate = lastRecordNo.substring(7,15);
			
			noStr = "ADorder"+ft.format(dnow);
			
			//用字串的方式進行比較
			if(ft.format(dnow).equals(lastRecordNoDate)) {
				noStr += String.format("%05d",(Integer.parseInt(lastRecordNo.substring(15))+1));
			}else {
				noStr = "ADorder"+ft.format(dnow)+"00001";
			}
			System.out.println(noStr);
		}
		return noStr;
	}

	@Override
	@Transactional
	public int saveOrders(AdOrderBean aob) {
		int n = 0;
		adOrderDao.saveOrders(aob);
		n++;
		return n;
	}

}
