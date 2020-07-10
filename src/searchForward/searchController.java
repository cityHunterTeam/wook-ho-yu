package searchForward;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import reservation.ReservationVO;
import search.GetTagValue;

@WebServlet("/json/*")
public class searchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		doHandle(request, response);
	}
    
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String depPlaceId = request.getParameter("code1");
		String arrPlaceId = request.getParameter("code2");

		String trainGradeCode = request.getParameter("form_control");
	
		String date =request.getParameter("datepicker_1");


		String month = date.substring(0,2);
		String nal = date.substring(3,5);
		String year = date.substring(6,date.length());
		String depPlandTime = year + month + nal;
		String action = request.getPathInfo();
		System.out.println("action:" + action);
	        StringBuilder urlBuilder = new StringBuilder("http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=sOy5hEZhdouT3bt0KCjqLrVKs9CplOTB%2F8ZV%2BTxKxftTiPvsPtd1IiIAxjy66VtyIiQRk7r5AP0SNnW7J5yArw%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("50", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("depPlaceId","UTF-8") + "=" + URLEncoder.encode(depPlaceId, "UTF-8")); /*출발기차역ID*/
	        urlBuilder.append("&" + URLEncoder.encode("arrPlaceId","UTF-8") + "=" + URLEncoder.encode(arrPlaceId, "UTF-8")); /*도착기차역ID*/
	        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(depPlandTime, "UTF-8")); /*출발일*/
	        urlBuilder.append("&" + URLEncoder.encode("trainGradeCode","UTF-8") + "=" + URLEncoder.encode(trainGradeCode, "UTF-8")); /*차량종류코드*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	            
	        }
	        System.out.println(sb.toString());
	        try {
	        	Node arrplacename = null;
	        	Node depplacename = null;
	        	DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	        	DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
	        	
	        	ServletContext context = this.getServletContext();
	        	String path = context.getRealPath("PM");
	        	File dir = new File(path);
	        	if(!dir.exists())dir.mkdir();
	        	File file = new File(dir,"search");
	        	PrintWriter output = new PrintWriter(new BufferedWriter(new FileWriter(file)));	        	
	        	output.print(sb.toString());
	        	output.close();
	        	
	        	Document doc = dBuilder.parse(path+"/search");
	        	doc.getDocumentElement().normalize();
	        	
	        	NodeList nList = doc.getElementsByTagName("item");
	        	List list = new ArrayList();
	        	GetTagValue gt = new GetTagValue();
	        	for(int temp=0; temp < nList.getLength(); temp++) {
	        		Node nNode = nList.item(temp);
	        		if(nNode.getNodeType() == Node.ELEMENT_NODE) {
	        			Element eElement = (Element) nNode;
	        			Map hash = new HashMap();
	                	
	        			System.out.println("출발역 :" +gt.getTagValue("depplacename",eElement));
	        			hash.put("depplacename",gt.getTagValue("depplacename",eElement));
	        			System.out.println("도착역 :" +gt.getTagValue("arrplacename",eElement));
	        			hash.put("arrplacename",gt.getTagValue("arrplacename",eElement));
	        			System.out.println("어른 요금 :" + gt.getTagValue("adultcharge", eElement));
	        			hash.put("adultcharge",gt.getTagValue("adultcharge",eElement));
	        			System.out.println("출발일 :" + gt.getTagValue("depplandtime", eElement));
	        			String depplandtime = gt.getTagValue("depplandtime", eElement);
	        			hash.put("traingradename",gt.getTagValue("traingradename", eElement));
	        			year = depplandtime.substring(0,4);
	        			month = depplandtime.substring(4,6);
	        			nal = depplandtime.substring(6,8);
	        			String hour = depplandtime.substring(8,10);
	        			String min = depplandtime.substring(10,12);
	        			String sec = depplandtime.substring(12,14);

	        			depplandtime = year+"-"+month+"-"+nal+" "+hour+":"+min+":"+sec;
	        			java.sql.Timestamp time = java.sql.Timestamp.valueOf(depplandtime);
	        			hash.put("depplandtime",time);
	        			hash.put("trainno",gt.getTagValue("trainno", eElement));
	        			list.add(hash);
	        		}
	        	}
	        	request.setAttribute("hashlist", list);
	        	
	        }catch (Exception e) {
	        	e.printStackTrace();
	        }
	        rd.close();
	        conn.disconnect();
			nextPage = "/search/searchlist.jsp";
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
	}


