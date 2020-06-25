package com.dhanjyothi.controller;

import com.dhanjyothi.model.KYC;
import com.dhanjyothi.model.User;
import com.dhanjyothi.service.AccountService;
import com.dhanjyothi.service.LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

@Controller
public class RegisterController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private AccountService accountService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(value = "/home/signup", method = RequestMethod.GET)
    public String showRegister(HttpServletRequest request, ModelMap model) {
        model.addAttribute("registration", new User());
        return "home/signup";
    }

    @RequestMapping(value = "/registerCustomer/save", method = RequestMethod.POST)
    public String saveRegister(@ModelAttribute("registration") User user, BindingResult bindingResult, ModelMap model) {
        try {
            if (user.getKycData().size() < 4) {
                return "home/signup?error=Upload All KYC Documents";
            } else {
                for (KYC kyc : user.getKycData()) {
                    if (kyc.getDocumentDesc().trim().length() < 1 || kyc.getFile().isEmpty()) {
                        model.addAttribute("registration", user);
                        return "redirect:../home/signup?error=Upload all KYC files with desc";
                    }

                }
            }
            long saveUser = this.loginService.saveUser(user);
            return "redirect:../home/login?msg=Account Created Successfully";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("registration", user);
            return "home/signup?error=" + e.getMessage();
        }
    }

    @RequestMapping(value = "/home/customerList")//getAll
    public String getAllUsers(HttpServletRequest request, ModelMap model) {
        String userStatusString = (ServletRequestUtils.getStringParameter(request, "userStatus", "u")).trim(); //u-undefined n-new a-active
        List<User> userList = this.accountService.getUserList(userStatusString.toUpperCase().charAt(0));
        model.addAttribute("userList", userList);
        model.addAttribute("registration", new User());
        model.addAttribute("userStatus", userStatusString);
        return "customer/customerList";
    }

    @RequestMapping(value = "/home/activateCustomer", method = RequestMethod.POST)
    public String showActivateCustomer(HttpServletRequest request, ModelMap model) {
        long userId = ServletRequestUtils.getLongParameter(request, "userId", 0);
        model.addAttribute("registration", this.loginService.getUserByUserId(userId));
        return "customer/activateNewCustomer";
    }

    @RequestMapping(value = "/home/confirmCustomer", method = RequestMethod.POST)
    public String activateCustomer(HttpServletRequest request, ModelMap model) {
        long userId = ServletRequestUtils.getLongParameter(request, "userId", 0);
        String active = ServletRequestUtils.getStringParameter(request, "active", "");
        this.loginService.updateCustomerUserStatus(userId, active.charAt(0));
        return "redirect:../home/customerList";
    }

}
