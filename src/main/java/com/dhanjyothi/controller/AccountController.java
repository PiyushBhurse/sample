package com.dhanjyothi.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.dhanjyothi.model.Account;
import com.dhanjyothi.model.Beneficiaries;
import com.dhanjyothi.model.User;
import com.dhanjyothi.security.config.CustomUserDetails;
import com.dhanjyothi.service.AccountService;
import com.dhanjyothi.util.DhanJyothiUtil;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/account/")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @GetMapping("/createSavingsAccount")
    public String loadAccountCreationPage(Model model, HttpServletRequest request) {
        User curUser = ((CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
        try {
            this.accountService.openSavingsAccount(curUser);
            return "redirect:../account/accountSummary?msg=Account created successfully";
        } catch (Exception ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
            return "redirect:../account/accountSummary?error=Error in Opening Saving Account";
        }

    }

    @RequestMapping(value = "/createTermAccount", method = RequestMethod.POST)
    public String createTermAccount(@ModelAttribute("account") Account account, Model model, HttpServletRequest request, BindingResult bindingResult) {
        User curUser = ((CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
        try {
            this.accountService.openTermAccount(account, curUser);
            return "redirect:../account/accountSummary?msg=Term Account created successfully";
        } catch (Exception ex) {
            Logger.getLogger(AccountController.class.getName()).log(Level.SEVERE, null, ex);
            return "redirect:../account/accountSummary?error=Error in Opening Saving Account";
        }
    }

    @GetMapping("accountSummary")
    public String accountHome(ModelMap model, HttpServletRequest request) throws Exception {
        User user = ((CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Date date = new Date();
        String startDate = simpleDateFormat.format(date);
        String endDate = simpleDateFormat.format(date);
        List<Account> savingAccount = this.accountService.getAccountDetails(user.getUserId(), "S");
        model.addAttribute("savingAccount", (savingAccount != null && !savingAccount.isEmpty()) ? savingAccount.get(0) : null);
        model.addAttribute("termAccount", this.accountService.getAccountDetails(user.getUserId(), "T"));
        model.addAttribute("account", new Account());
        model.addAttribute("tenure", DhanJyothiUtil.getTenureDetails());
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        return "account/accountsummary";
    }

    @GetMapping("beneficiaryAndTransfer")
    public String showFundtransferView(ModelMap model, HttpServletRequest request) throws Exception {
        User user = ((CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Date date = new Date();
        String startDate = simpleDateFormat.format(date);
        String endDate = simpleDateFormat.format(date);
        List<Account> savingAccount = this.accountService.getAccountDetails(user.getUserId(), "S");
        model.addAttribute("savingAccount", (savingAccount != null && !savingAccount.isEmpty()) ? savingAccount.get(0) : null);
        model.addAttribute("termAccount", this.accountService.getAccountDetails(user.getUserId(), "T"));
        model.addAttribute("account", new Account());
        model.addAttribute("tenure", DhanJyothiUtil.getTenureDetails());
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        return "account/beneficiaryAndTransfer";
    }

    @RequestMapping(value = "addBeneficiary", method = RequestMethod.POST)
    public String addBeneficiary(@ModelAttribute("beneficiary") Beneficiaries beneficiaries, HttpServletRequest request) {
        return "redirect:../account/accountSummary";
    }

    @RequestMapping(value = "fundTransfer", method = RequestMethod.POST)
    public String transferFundsToAccount(@ModelAttribute("beneficiary") Beneficiaries beneficiaries, HttpServletRequest request) {
        return "redirect:../account/accountSummary";
    }
}
