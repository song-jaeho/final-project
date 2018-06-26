package kr.co.ducktube.web.interceptor;

import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginCheckInterceptor implements HandlerInterceptor {

	private Set<String> urls;
	
	public void setUrls(Set<String> urls) {
		this.urls = urls;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//System.out.println("request uri : " + request.getRequestURI());
		//System.out.println("request url : " + request.getRequestURL());
		//System.out.println();
		
		if(urls.contains(request.getRequestURI())) {
			//System.out.println("login 필요하지않은 서비스 : " + request.getRequestURI());
			return true;
		} else {
			//System.out.println("login 필요한 서비스 : " + request.getRequestURI());
			//response.sendRedirect("/ducktube/user/loginform?error=deny");
			return true;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}