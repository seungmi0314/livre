package com.livre.common;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.livre.utility.MyUtility;

@WebServlet(urlPatterns = {"/Livre", "/xxx"},
			initParams = {
					@WebInitParam(name = "todolist", value = "/WEB-INF/todolist.txt")
			}
		)
public class FrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private String todolist = null; // 할 일을 명시해둔 장부 파일
	private Map<String, SuperController> todolistMap = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		ServletContext application = config.getServletContext();
		
		this.todolist = config.getInitParameter("todolist");
		
		// 애플리케이션의 전체 경로를 매개 변수로 넘겨 줍니다.
		this.todolistMap = MyUtility.getTodolistMap(application.getRealPath(todolist));
		System.out.println("todolist Map Size : " + todolistMap.size());
		System.out.println(todolistMap.toString());
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글 깨짐 방지
		
		String command = request.getParameter("command");
		
		System.out.println("command is [" + command + "]");
		
		// controller 는 해당 command 에 상응하는 하위 컨트롤러 객체 입니다.
		SuperController controller = this.todolistMap.get(command);
		
		if(controller != null) {
			try {
				String method = request.getMethod().toLowerCase();
				if(method.equals("get")) {
					controller.doGet(request, response);
					System.out.println(controller.getClass() + " get 메소드 호출됨");
					
				}else {
					controller.doPost(request, response);
					System.out.println(controller.getClass() + " post 메소드 호출됨");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else {
			System.out.println("request command is not found");
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);
	}
}