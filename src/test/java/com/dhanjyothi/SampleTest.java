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

    }

}
