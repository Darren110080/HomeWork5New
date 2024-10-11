package com.systex.filter;

import com.systex.model.Member;
import com.systex.model.MemberService;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import com.fasterxml.jackson.databind.ObjectMapper;


@Component
public class AuthFilter implements Filter {

    @Autowired
    private MemberService memberService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 初始化過濾器
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        //System.out.println("Request URI: " + httpRequest.getRequestURI());  // 確認請求的 URL
        //System.out.println("Request method: " + httpRequest.getMethod());    // 確認請求的 method

        String requestURI = httpRequest.getRequestURI();
        HttpSession session = httpRequest.getSession(false);
        boolean loggedIn = (session != null && session.getAttribute("user") != null);
        boolean isAjaxRequest = "XMLHttpRequest".equals(httpRequest.getHeader("X-Requested-With"));
        
        // 印出用戶是否已登錄和是否為 Ajax 請求
        //System.out.println("Logged In: " + loggedIn);
        //System.out.println("Is Ajax Request: " + isAjaxRequest);

        // 自由訪問的頁面
        boolean loginPage = requestURI.endsWith("/login") || requestURI.endsWith("/register") || requestURI.endsWith("/loginAjax");
        //System.out.println("Is Login Page: " + loginPage); // 印出是否為登錄頁面
        
//        System.out.println(httpRequest.getContextPath());

        // POST 登入處理
        if (requestURI.equals(httpRequest.getContextPath() + "/login") && httpRequest.getMethod().equalsIgnoreCase("POST")) {
            //System.out.println("Handling login request."); // 印出處理登錄請求的消息
            handleLogin(httpRequest, httpResponse, session, false);       //處理傳統的登錄請求
        } else if (requestURI.equals(httpRequest.getContextPath() + "/loginAjax") && httpRequest.getMethod().equalsIgnoreCase("POST")) {
            //System.out.println("Handling AJAX login request."); // 印出處理 AJAX 登錄請求的消息
            handleLogin(httpRequest, httpResponse, session, true);         //處理 AJAX 登錄請求
        } else if (loggedIn || loginPage) {
            //System.out.println("User is logged in or accessing login page. Proceeding with filter chain."); // 印出用戶已登錄或訪問登錄頁的消息
            chain.doFilter(request, response);                 //檢查用戶的登錄狀態
        } else if (isAjaxRequest) {
            //System.out.println("Unauthorized AJAX request. Sending 401 error."); // 印出未授權 AJAX 請求的消息
            httpResponse.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Login required.");   //針對 AJAX 請求未授權的處理。如果用戶未登錄且嘗試進行 AJAX 操作
        } else {
            //System.out.println("Redirecting to login page."); // 印出重定向到登錄頁面的消息
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");       //在用戶未登錄且試圖訪問受保護的頁面
        }
    }

    


    
    
    


    
    
 private void handleLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session, boolean isAjax)
            throws IOException, ServletException {
        ObjectMapper objectMapper = new ObjectMapper();
        Member member;

        // 印出 AJAX 標誌
        //System.out.println("isAjax: " + isAjax);

        if (isAjax) {
            // 解析 JSON 請求體
            member = objectMapper.readValue(request.getInputStream(), Member.class);
            //System.out.println("Received AJAX request. Username: " + member.getUsername()); // 印出接收到的用戶名
        } else {
            // 非 Ajax 請求，從參數獲取數據
        	//System.out.println("NotisAjax: " + isAjax);
            member = new Member();
            member.setUsername(request.getParameter("username"));
            member.setPassword(request.getParameter("password"));
            //System.out.println("Received regular request. Username: " + member.getUsername()); // 印出接收到的用戶名
        }

        Member existingMember = memberService.findMemberByUsername(member.getUsername());
        //System.out.println("Found member: " + (existingMember != null ? existingMember.getUsername() : "null")); // 印出查詢結果

        if (existingMember != null && existingMember.getPassword().equals(member.getPassword())) {
            session = request.getSession(true);
            session.setAttribute("user", existingMember);
            
            if (isAjax) {
                // 正確處理 AJAX 的成功響應
               // System.out.println("Login successful for user: " + existingMember.getUsername()); // 印出成功信息
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                objectMapper.writeValue(out, Collections.singletonMap("success", true));
                out.flush();
            } else {
                // 非 AJAX 重定向到 index 頁面
                //System.out.println("Redirecting to index page."); // 印出重定向信息
                response.sendRedirect(request.getContextPath() + "/index");
            }
        } else {
            if (isAjax) {
               // System.out.println("Login failed for user: " + member.getUsername()); // 印出失敗信息
                // 錯誤處理 AJAX 響應：確保返回 JSON 格式
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                objectMapper.writeValue(out, Collections.singletonMap("error", "使用者名稱或密碼錯誤"));
                out.flush();
            } else {
                // 非 AJAX，轉發到 login 頁面並顯示錯誤信息
              //  System.out.println("Forwarding to login page due to error."); // 印出轉發信息
                request.setAttribute("error", "使用者名稱或密碼錯誤");
                request.getRequestDispatcher("/login").forward(request, response);
            }
        }
    }



    @Override
    public void destroy() {
        // 清理資源
    }
}
