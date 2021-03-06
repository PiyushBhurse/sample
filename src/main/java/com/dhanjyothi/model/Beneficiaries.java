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

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "beneficiaries")
@Getter
@Setter
@ToString
@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
public class Beneficiaries {

	@Id
	@Column(name = "ben_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long benId;

	@Column(name = "ben_type", updatable = true, columnDefinition = "CHAR(1) NOT NULL COMMENT 'I = Internal, E = External'")
	private char benType;

	@Column(name = "ben_nick_name", length = 100, nullable = false)
	private String benNickName;

	@Column(name = "ben_name", length = 100, nullable = false)
	private String benName;

	@Column(name = "ben_acc_num", length = 10, nullable = false)
	private long benAccNum;

	@Column(name = "ben_bank", length = 100, nullable = false)
	private String benBank;

	@Column(name = "ben_bank_IFSC", length = 11, nullable = false)
	private String benBankIFSC;

	@ManyToOne(cascade = CascadeType.ALL, targetEntity = Account.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "acct_id")
	@JsonIgnore
	private Account owner;
}
