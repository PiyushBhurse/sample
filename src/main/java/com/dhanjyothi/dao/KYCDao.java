/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dhanjyothi.dao;

import com.dhanjyothi.model.KYC;
import org.springframework.data.jpa.repository.JpaRepository;

public interface KYCDao extends JpaRepository<KYC, Long> {

}
