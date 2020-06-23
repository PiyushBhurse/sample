/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dhanjyothi.controller;

import com.dhanjyothi.model.Transaction;
import com.dhanjyothi.service.AccountService;
import com.dhanjyothi.util.DhanJyothiUtil;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author hp
 */
@RestController
@RequestMapping("/ajax")
public class AjaxController {

    @Autowired
    private AccountService accountService;
//    

    @GetMapping("/calculateInterestAndMatAmount")
    public Map<String, Object> calculateInterestAndMatAmount(HttpServletRequest request) {
        double depositeAmt = ServletRequestUtils.getDoubleParameter(request, "depAmt", 0);
        int tenure = ServletRequestUtils.getIntParameter(request, "tenure", 0);
        float interstRate = DhanJyothiUtil.getInterstRate(tenure, ((Double) depositeAmt).longValue());
        double calculatedMaturityAmount = DhanJyothiUtil.calculateMaturityAmount(((Double) depositeAmt).longValue(), tenure, interstRate);
        Map<String, Object> map = new HashMap<>();
        map.put("intRate", interstRate);
        map.put("maturityAmt", calculatedMaturityAmount);
        return map;
    }

    @GetMapping("/getAccountTransactions")
    public List<Transaction> getAccountTransaction(HttpServletRequest request) throws Exception {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Date date = new Date();
        String startDate = simpleDateFormat.format(date);
        String endDate = simpleDateFormat.format(date);
        String stDt = ServletRequestUtils.getStringParameter(request, "startDate", startDate);
        String spDt = ServletRequestUtils.getStringParameter(request, "endDate", endDate);
        return this.accountService.loadTransactionsBetweenStandEnDt(stDt, spDt);
    }

    @GetMapping("/checkIfAccountExist")
    public String checkIfAccountExist(HttpServletRequest request) throws Exception {
        long acctId = ServletRequestUtils.getLongParameter(request, "acctId", 0);
        int checkAccountExists = this.accountService.checkAccountExists(acctId);
        System.out.println("check>" + checkAccountExists);
        switch (checkAccountExists) {
            case 1:
                return "You can't transfer funds to self";
            case 2:
                return "Beneficiary already added";
            case 3:
                return "";
            case 4:
                return "Invalid account no";
            default:
                return "";
        }
    }

}
