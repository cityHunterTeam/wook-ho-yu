package ReviewComment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Formatter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


@WebServlet("/comment/*")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
        CommentVO cvo;
        CommentDAO cdao;

	
	public void init(ServletConfig config) throws ServletException {
		cdao = new CommentDAO();
		cvo = new CommentVO();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doHandle(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo(); //경로를 지정하는 아이
		System.out.println("action:" + action);
		HttpSession session = request.getSession();
		
		PrintWriter out = response.getWriter();
		
		if(action.equals("/comment.do")) { //댓글쓰기
			String comment = request.getParameter("comment");	//content내용 받아옴 , id content 
						
			
			try {
					
				
				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObject = (JSONObject)jsonParser.parse(comment);
				
				cvo.setC_content((String)jsonObject.get("content"));
				cvo.setC_id((String)jsonObject.get("id"));
				cvo.setBnum(Integer.parseInt(jsonObject.get("bnum").toString()));
				
				cdao.insertComment(cvo); // 글작성 DB에 넣어줌. cnum값이 생성되나, cnum값을 못받음. 위에 bnum id content값만 있음.
				CommentVO cvo2 = cdao.getLastComment(); //마지막 댓글의 모든정보를 가져옴.
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("c_content", cvo2.getC_content()); //jsonobject객체에 정보를 담음.
				jsonObj.put("c_id",cvo2.getC_id());
				jsonObj.put("c_date",cvo2.getC_date());
				jsonObj.put("cnum",cvo2.getCnum());
								
				SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				String today = null;
				today = formatter.format(cal.getTime());
				Timestamp ts = Timestamp.valueOf(today);
				
				jsonObj.put("c_date",formatter.format(ts));
				
				System.out.print(jsonObj.toString());
				out.print(jsonObj.toString()); //에이잭스로 전송
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(action.equals("/deleteComment.do")) {//댓글삭제
			String deleteComment = request.getParameter("deleteComment"); // id cnum
			
			try {
				
				CommentVO cvo = new CommentVO();
				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObject = (JSONObject)jsonParser.parse(deleteComment);
				cvo.setC_id((String)jsonObject.get("c_id")); // 작성자
				cvo.setCnum(Integer.parseInt(jsonObject.get("cnum").toString())); //댓글번호
				
				int result = cdao.deleteComment(cvo);
				
				if(result==1) {				
					out.print("success");
				}else{
					out.print("fail");				
				}

			}catch(Exception e) {
				System.out.println("deleteComment.do메소드에서 예외발생 : " + e.toString());
			}
			
		}
		
	}

}
