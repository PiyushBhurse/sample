package com.dhanjyothi.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "beneficiaries")
@Getter
@Setter
@ToString
public class Beneficiaries {

    @Id
    @Column(name = "ben_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long benId;

    @Column(name = "user_status", updatable = true, columnDefinition = "CHAR(1) NOT NULL COMMENT 'I = Internal, E = External'")
    private char benType;

    @Column(name = "ben_nick_name", length = 100, nullable = false)
    private String benNickName;
   
    @Column(name = "ben_name", length = 100, nullable = false)
    private String benName;
    
    @Column(name = "ben_acc_num", length = 10, nullable = false)
    private long benAccNum;
    
    @Column(name = "ben_bank", length = 100, nullable = false)
    private long benBank;
    
    @Column(name = "ben_bank_IFSC", length = 11, nullable = false)
    private long benBankIFSC;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "acct_id")
    private Account owner;
}
