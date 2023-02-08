package com.project_catmoa.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.project_catmoa.dto.IntroDto;

public class CatInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception{
		String uri = req.getRequestURI(); //현재 요청 경로
		HttpSession session = req.getSession();
		IntroDto intro = (IntroDto)session.getAttribute("loginuser");
		if (intro == null) { // 로그인 하지 않은 사용자
				
			resp.sendRedirect(req.getContextPath() + "/");
			return false; // 예정된 컨트롤러 호출을 취소
		} else { // 로그인한 사용자
			if (uri.contains("/admins/")) { 
				int loginuserAdmin = intro.getAdmin();	
				if (loginuserAdmin != 1) { // 관리자가 아니라면
					resp.sendRedirect(req.getContextPath() + "/");
					return false; // 예정된 컨트롤러 호출을 취소
				}
			}
		}
		return true; // 예정대로 컨트롤러 호출을 수행
	}
	
//	} else {
//	if (loginuserAdmin == 1) { // 관리자 권한이 있는 사용자
//		return true;
//} else {
//	if(uri.contains("/admins/")) {
//		session.removeAttribute("loginuser");
//		resp.sendRedirect(req.getContextPath() + "/");
//		return false;
//	}
//	return false;
//}
//return true;
//}
	
	 // 컨트롤러 처리가 끝난 후에 호출되는 메서드
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
       ModelAndView modelAndView) throws Exception {
    }
    
    // View 처리까지 끝난 후에 호출되는 메서드
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
       throws Exception {
    }
}
