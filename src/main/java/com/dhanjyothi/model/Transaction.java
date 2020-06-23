package com.dhanjyothi.model;

import java.util.Date;
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
@Table(name = "transaction")
@Getter
@Setter
@ToString
public class Transaction {

    @Id
    @Column(name = "tran_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long tranId;
    @Column(name = "tran_type", columnDefinition = "VARCHAR(255) NOT NULL COMMENT 'Debit, Credit'")
    private String tranType;
    @Column(name = "tran_Desc", columnDefinition = "VARCHAR(255) NOT NULL")
    private String tranDesc;
    @Column(name = "tran_amt", precision = 10, scale = 2)
    private double tranAmt;
    @Column(name = "tran_dt_time", nullable = false)
    private Date tranDtTime;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "ben_id")
    private Beneficiaries beneficiaries;

}
