/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dhanjyothi.dao;

import com.dhanjyothi.model.Beneficiaries;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface BeneficiaryDao extends JpaRepository<Beneficiaries, Long> {

    @Query("select b from Beneficiaries b left join b.owner a where a.acctId=:acctId")
    public List<Beneficiaries> getBeneficiaryListforAccount(@Param("acctId") long acctId);
}
