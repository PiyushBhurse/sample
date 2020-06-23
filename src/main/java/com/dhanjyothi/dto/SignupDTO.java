/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dhanjyothi.dto;

import com.dhanjyothi.model.KYC;
import com.dhanjyothi.model.User;
import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author hp
 */
@Getter
@Setter
@ToString
public class SignupDTO implements Serializable {

    private User user;
    private List<KYC> kycData;

    public SignupDTO() {
        this.user = new User();
        this.kycData = new LinkedList<>();
    }

}
