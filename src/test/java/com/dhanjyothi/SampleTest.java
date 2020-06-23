/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dhanjyothi;

import com.dhanjyothi.util.DhanJyothiUtil;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Value;

/**
 *
 * @author hp
 */
public class SampleTest {

    @Value("${file.location}")
    static String location;

    public static void main(String[] args) {
//        for (int i = 1; i < 7; i++) {
//            long amt = 1000;
//            for (int j = 1; j < 6; j++) {
//                System.out.println("ten:" + i + " amt:" + amt + " >" + DhanJyothiUtil.getInterstDate(i, amt));
//                amt *= 10;
//            }
//        }
        double calculateMaturityAmount1 = DhanJyothiUtil.calculateMaturityAmount(100000, 1, 6); // amt, tenure, intRate
        System.out.println("calculateMaturityAmount>>" + calculateMaturityAmount1);
        double calculateMaturityAmount2 = DhanJyothiUtil.calculateMaturityAmount(100000, 2, 6); // amt, tenure, intRate
        System.out.println("calculateMaturityAmount>>" + calculateMaturityAmount2);
    }

}
