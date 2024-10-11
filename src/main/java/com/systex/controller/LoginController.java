package com.systex.controller;

import com.systex.model.Member;
import com.systex.model.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;




@Controller
public class LoginController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("member", new Member());
        return "register";
    }

    @PostMapping("/register")
    public String registerMember(Member member, Model model) {
        Member existingMember = memberService.findMemberByUsername(member.getUsername());
        if (existingMember != null) {
            model.addAttribute("error", "帳號重複，請輸入其他帳號。");
            return "register";
        }

        memberService.saveMember(member);
        model.addAttribute("successMessage", "註冊成功，請登入");
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLoginForm(Model model) {
        return "login";
    }

   @PostMapping("/login")                        //一般登入後
   public String showAfterLogin(Model model) {
       return "index";
   }
    
   
   @GetMapping("/loginAjax")
   public String showLoginAjaxForm(Model model) {
       return "loginAjax";
   }
   
   @PostMapping("/loginAjax")                    //Ajax登入後
   public String showAfterAjaxLogin(Model model) {
       return "index";
   }
   
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/index")
    public String showIndex(Model model) {
        return "index";
    }
}
