package com.dhanjyothi.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.dhanjyothi.model.User;
import com.dhanjyothi.security.config.CustomUserDetails;
import com.dhanjyothi.service.LoginService;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/home/login", method = RequestMethod.GET)
    public String showRegister() {
        return "home/login";
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    public String validateUser(@ModelAttribute("user") User user, HttpServletRequest request, Model model) {
        return null;
    }

    @RequestMapping("/accsummary")
    public String loadAccSummary(HttpServletRequest request, Model model) {
        return null;
    }

    @RequestMapping("/adduser")
    public String addUser(HttpServletRequest request, Model model) {
        return null;
    }

    @GetMapping("/logout")
    public String logoutPage(HttpServletRequest request) {

        return null;
    }

    @RequestMapping(value = "/home/index")
    public String indexPage(HttpServletRequest request) {
        CustomUserDetails name = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Collection<? extends GrantedAuthority> authorities = ((CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getAuthorities();
        return (authorities.contains(new SimpleGrantedAuthority("C")))?"redirect:../account/accountSummary":"redirect:../customer/customerList";
    }

}
