package TRN.web.news.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import TRN.web.news.model.trkNewsBean;
import TRN.web.news.service.trkNewsService;
@Controller
public class counttrkNewsContoller {
 
	@Autowired
	trkNewsService service;
	
	@Autowired
	public void setService(trkNewsService service) {
		this.service = service;
	}
	                                              //這裡目的要取id後更新點擊量
	@PutMapping(value = "/editNews5/{NewsId}",   //Ajax update 先取id再更新 
			consumes= {"application/json"}, produces= {"application/json"})
	public @ResponseBody Map<String, String> updatetrkNews(
            @RequestBody trkNewsBean trkNewsBean, @PathVariable Integer NewsId) {
		System.out.println("1112key----->"+trkNewsBean);
		System.out.println(trkNewsBean.getClicnum());
		Integer c = trkNewsBean.getClicnum();
		Integer i = trkNewsBean.getTrackId();
		System.out.println("ID="+i);
		System.out.println("Click="+c);
		trkNewsBean trkNewsBean0=null;
//		if (key != null) {
		trkNewsBean0 = service.findByPrimaryKey(NewsId);
		System.out.println("1107CC----->"+trkNewsBean0);
			//member0原本舊資料
//			if (member0 == null) {
//				throw new RuntimeException("鍵值不存在, key=" + key);
//			}
//			serviceUpdate.evictMember(member0);
//		} else {
//			throw new RuntimeException("鍵值不存在, key=" + key);
//		}
		
		//members 新植入資料
				copyUnupdateField(trkNewsBean0, trkNewsBean);
				System.out.println("1112AA----->"+trkNewsBean0); 
				System.out.println("1112bBB----->"+trkNewsBean); //
				Map<String, String> map = new HashMap<>();
				try {
		     		service.updateNews(i, c);;
		     		
					map.put("success", "更新成功");
				} catch(Exception e) {
					e.printStackTrace();
					map.put("fail", "更新失敗");
				}
				//System.out.println("1107CC"+map);
				return map;
	}
	private void copyUnupdateField(trkNewsBean trkNewsBean0, trkNewsBean trkNewsBean) {
		trkNewsBean.setExtra(trkNewsBean0.getExtra()); //取得未更新的值
	}
}
