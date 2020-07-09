package board;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import board.BoardDAO;
import board.BoardVO;

@WebServlet("/brd/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	BoardDAO dao;
	
	public void init(ServletConfig config) throws ServletException {
		dao = new BoardDAO();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);

	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		if(action.equals("/list.do")) {
			//전체 글개수
			int count = dao.getBoardCount();
			
			//하나의 화면마다 보여줄 글 개수 15
			System.out.println(count);
			int pageSize = 10;
			
			//현재 보여질(선택한) 페이지번호 가져오기
			String pageNum = request.getParameter("pageNum");
			
			//현재 보여질(선택한) 페이지번호가 없으면 1페이지 처리 
			if(pageNum == null) {
				pageNum = "1";
			}
			
			//현재 보여질(선택한) 페이지번호 "1"을 -> 기본정수 1로 변경
			int currentPage = Integer.parseInt(pageNum);
			
			//(현재 보여질 페이지번호 -1) * 한페이지당 보여줄 글개수 15
			int startRow = (currentPage-1) * pageSize;
			
			//게시판 글객체(BoardBean)를 저장하기 위한 용도 
			List<BoardVO> articleList = null;
			
			//만약 게시판에 글이 있다면..
			if(count > 0) {
				//글목록 가져오기
				//getBoardList(각 페이지마다 맨 위에 첫번째로 보여질 시작 글번호, 한페이지당 보여줄 글개수) 
				articleList = dao.getReadBoardList(startRow, pageSize);
			}
			
			//전체 페이지수 구하기 글 20개 한 페이지 보여줄 글수 10개 => 2페이지
			// 글 25개 한페이지 보여줄 글 수 10개 => 3페이지 
			// 조건 (삼항)연산자 조건? 참 : 거짓 
			//전체 페이지수 = 전체글/ 한페이지에 보여줄 글 수 + (전체글수를 한페이지에 보여줄 글수로 나눈 나머지값) 
			int pageCount = count/pageSize+(count%pageSize == 0?0:1);
			int pageBlock = 3;
			
			/* 시작페이지 번호 구하기 */
			// 1 ~ 10 => 1 11~ 20 => 11 21~30 => 21
			//현재 보여질 (선택한) 페이지 번호/ 한화면(한블럭)에 보여줄 페이지수)-
			//(현재 보여질(선택한) 페이지 번호를 한화면에 보여줄 페이지수로 나눈 나머지값)) * 
			//한화면(한블럭)에 보여줄 페이지수 + 1
			int startPage = ((currentPage/pageBlock)-(currentPage%pageBlock == 0? 1:0))*pageBlock + 1;
			
			
			//끝페이지 번호 구하기 1~ 10 => 10 11~ 20 => 20 21~30 => 30 
			int endPage = startPage + pageBlock-1; //시작페이지번호 + 현재블럭에 보여줄 페이지수 -1
			
			//끝페이지번호가 전체페이지수보다 클때...
			if(endPage > pageCount) {
				//끝페이지번호를 전체페이지수로 저장
				endPage = pageCount;
			}
			request.setAttribute("count", count);
			request.setAttribute("articleList", articleList);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("pageCount",pageCount);
			
			nextPage = "/Board/listArticles.jsp";
		}else if(action.equals("/write.do")){
			nextPage = "/Board/write.jsp";
		}else if(action.equals("/writePro.do")) {
			String id = request.getParameter("id");
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			BoardVO vo = new BoardVO(id, title, content);
			dao.insertBoard(vo);	//insert명령!
			
			nextPage = "/brd/list.do";
		}
			
		
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}

}
