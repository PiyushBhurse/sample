package com.dhanjyothi.model;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "account")
@Getter
@Setter
@ToString
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "acct_id")
    private long acctId;

    @ManyToOne(cascade = CascadeType.MERGE, targetEntity = User.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "acct_holder_id")
    private User acctHolder;

    @Column(name = "acct_type", columnDefinition = "CHAR(1) NOT NULL COMMENT 'S = S/B Acct, T = Term Deposit Acct' DEFAULT 'S'")
    private char acctType;

    @Column(name = "int_rate", precision = 10, scale = 2)
    private double intRate;

    @Column(name = "acct_balance", precision = 10, scale = 2, nullable = false)
    private double acctBalance;

    @Column(name = "deposite_tenure", length = 10)
    private long depositeTenure;

    @Column(name = "deposite_amount", length = 10)
    private long depositeAmount;

    @Column(name = "maturity_amt", precision = 10, scale = 2)
    private double maturityAmt;

    @Column(name = "account_created_date")
    private Date accountCreatedDate;

    @Column(name = "account_updated_date")
    private Date accountUpdatedDate;

    @Column(name = "acct_status", columnDefinition = "CHAR(1) NOT NULL COMMENT 'A = Active, I = Inactive'")
    private char acctStatus;

    @OneToMany(cascade = CascadeType.ALL, targetEntity = Transaction.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "acct_id", referencedColumnName = "acct_id")
    private List<Transaction> transactions;

    public Account() {
        this.transactions = new LinkedList<>();
    }

}
