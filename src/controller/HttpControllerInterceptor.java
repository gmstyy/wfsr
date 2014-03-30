
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.founder.fasf.beans.Order;
import com.founder.fasf.beans.Page;

public class HttpControllerInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (handler instanceof AbstractController) {
			AbstractController con = (AbstractController) handler;
			con.setRequest(request);
			con.setResponse(response);
			if (request.getParameter(Page.CURRENT_PAGE) != null) {
				con.setPage(new Page(Page.DEFAULT_PAGE_SIZE, Integer.parseInt(request.getParameter(Page.CURRENT_PAGE))));
			}
			if (request.getParameter(Order.ORDER) != null) {
				// TODO add orders if needed
				// Order order=new Order(fieldName)
				// con.setPage(new Page(20,
				// Integer.parseInt(request.getParameter("indexPage"))));
			}
			ModelAndView mav = new ModelAndView();
			con.setMav(mav);
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		// TODO Auto-generated method stub
	}
}
