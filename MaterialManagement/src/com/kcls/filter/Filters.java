package com.kcls.filter;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Filters implements Filter {
	private String encoding;
	
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		String path = request.getServletPath();
		String Ip = request.getRemoteAddr();//��Ip��ַ
//		String contextPath = request.getContextPath();//������
//		String uri = request.getRequestURI();//�õ�·��
		System.out.println("Filter ������");
		chain.doFilter(request, response);
	}
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		encoding = config.getInitParameter("encoding");
	}

}
