package TRN.web.news.dao.Impl;

import java.io.IOException;
import java.io.Serializable;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.HttpClientUtils;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;





public class MyHttpclientURL  {
	
	public Elements txt ;
	public Document document;

	


	//public  Elements httpclientData(String SearchWord) {
		public  Document httpclientData1(String SearchWord) {
				
        //1.生成httpclient，相当于该打开一个浏览器
        CloseableHttpClient httpClient = HttpClients.createDefault();
        CloseableHttpResponse response = null;
        //2.创建get请求，相当于在浏览器地址栏输入 网址
        HttpGet request = new HttpGet("https://www.setn.com/search.aspx?q="+SearchWord);
        //设置请求头，将爬虫伪装成浏览器
        System.out.println("1113"+request);
        request.setHeader("User-Agent","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36");
//        HttpHost proxy = new HttpHost("60.13.42.232", 9999);
//        RequestConfig config = RequestConfig.custom().setProxy(proxy).build();
//        request.setConfig(config);
        try {
            //3.执行get请求，相当于在输入地址栏后敲回车键
            response = httpClient.execute(request);
            
            //4.判断响应状态为200，进行处理
            if(response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                //5.获取响应内容
                HttpEntity httpEntity = response.getEntity();
                String html = EntityUtils.toString(httpEntity, "utf-8");
               // System.out.println(html);
                System.out.println("------------------------------------------------------------------------------------------");
                /**
                 * 下面是Jsoup展现自我的平台
                 */
                //6.Jsoup解析html
                Document document = Jsoup.parse(html);
               // System.out.println(document);
                //像js一样，通过标签获取title
                System.out.println(document.getElementsByTag("title").first());
                //像js一样，通过id 获取文章列表元素对象
               // Element ById = document.getElementById("");
               // Elements txt = document.getElementsContainingOwnText("天氣");
                //Elements txt = document.select("div.newsimg-area-text-2");
                
                Elements txt = document.select("div.newsimg-area-text-2").select("a");
                System.out.println("URL網頁所有資料"+document);
               // for(int i = 0 ; i <=6 ; i++) {
              //  String txt = txt0.get().text();
            //    System.out.println(txt);
            //    return txt
              //  }
               // System.out.println(txt);
           //    Elements txt1 = document.getElementsByClass("mobile_hide");       
            //    Elements txt2 = document.getElementsByClass("search_list_pic");
             //   Elements txt3 = document.getElementsByClass("txt");
              //  Elements e1 = document.getElementsByTag("div");
                //System.out.println(e1);
                //System.out.println("aaaaaa"+txt0);
               // System.out.println("bbbbbb"+txt1);
               // System.out.println("cccccc"+txt2);
              //  System.out.println("dddddd"+txt3);
             //   StringBuffer tet = new StringBuffer();
             //    tet.append(txt.toString());
               
               
                
                //像js一样，通过class 获取列表下的所有博客
                //Elements postItems = postList.getElementsByClass("toctitle");
                //System.out.println(document.getElementsByClass("search_list_txt"));
                //System.out.println(document.getElementsByTag("link"));
                //循环处理每篇博客
//                for (Element postItem : postItems) {
//                    //像jquery选择器一样，获取文章标题元素
//                    Elements titleEle = postItem.select(".post_item_body a[class='titlelnk']");
//                    System.out.println("文章标题:" + titleEle.text());;
//                    System.out.println("文章地址:" + titleEle.attr("href"));
//                    //像jquery选择器一样，获取文章作者元素
//                    Elements footEle = postItem.select(".post_item_foot a[class='lightblue']");
//                    System.out.println("文章作者:" + footEle.text());;
//                    System.out.println("作者主页:" + footEle.attr("href"));
//                    System.out.println("*********************************");
//                }
                
               // System.out.println("A"+txt);
                return document;
            } else {
               // 如果返回状态不是200，比如404（页面不存在）等，根据情况做处理，这里略
                System.out.println("返回状态不是200");
                System.out.println(EntityUtils.toString(response.getEntity(), "utf-8"));
            } System.out.println("AA+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+txt);
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            //6.关闭
            HttpClientUtils.closeQuietly(response);
            HttpClientUtils.closeQuietly(httpClient);
          
        }
       
		//System.out.println("1113--------------------aa>"+txt);
		return document;
		
	
}





	public Elements getTxt() {
		return txt;
	}





	public void setTxt(Elements txt) {
		this.txt = txt;
	}


    }