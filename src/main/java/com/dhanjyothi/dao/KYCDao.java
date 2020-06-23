/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dhanjyothi.dao;

import com.dhanjyothi.model.KYC;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author hp
 */
public interface KYCDao extends JpaRepository<KYC, Long> {

//    @Transactional
//    @Modifying
//    @Query("UPDATE KYC k set k.userId=:userId WHERE k.kycId = :kycId")
//    public void updateKycUseId(@Param("userId") long userId, @Param("kycId") long kycId);
}
