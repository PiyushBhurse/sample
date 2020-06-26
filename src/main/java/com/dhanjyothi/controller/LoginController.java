package com.dhanjyothi.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dhanjyothi.security.config.CustomUserDetails;

@Controller
public class LoginController {

	@RequestMapping(value = "/home/login", method = RequestMethod.GET)
	public String showRegister(HttpServletRequest request, ModelMap model) {

		model.addAttribute("msg", ServletRequestUtils.getStringParameter(request, "msg", ""));
		return "home/login";
	}

	@RequestMapping(value = "/home/index")
	public String indexPage(HttpServletRequest request) {
		Collection<? extends GrantedAuthority> authorities = ((CustomUserDetails) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal()).getAuthorities();
		return (authorities.contains(new SimpleGrantedAuthority("C"))) ? "redirect:../account/accountSummary"
				: "redirect:../home/customerList";
	}

}
