CREATE TABLE if not exists `user` (
  `user_id` bigint(20) NOT NULL,
  `aadhar_id` bigint(20) DEFAULT NULL,
  `add_line1` varchar(255) NOT NULL,
  `add_line2` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `pan` varchar(10) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `pin` int(11) NOT NULL,
  `state` varchar(50) NOT NULL,
  `user_role` char(1) NOT NULL COMMENT 'C = Customer,M = Manager',
  `user_status` char(1) NOT NULL COMMENT 'N = New,A = Active',
  `user_name` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK_lqjrcobrh9jc8wpcar64q1bfh` (`user_name`)
);

CREATE TABLE if not exists `kyc` (
  `kyc_id` bigint(20) NOT NULL,
  `document_desc` varchar(255) NOT NULL,
  `document_loc` varchar(255) NOT NULL,
  `kyc_type` char(1) NOT NULL COMMENT 'B = Date of Birth, A = Proof of Addess D=AADHAR, P = PAN',
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`kyc_id`),
  KEY `FK670ssa8i9pr4idg4vh7q0dq7c` (`user_id`)
);

CREATE TABLE if not exists `account` (
  `acct_id` bigint(20) NOT NULL,
  `account_created_date` datetime DEFAULT NULL,
  `account_updated_date` datetime DEFAULT NULL,
  `acct_balance` double NOT NULL,
  `acct_status` char(1) NOT NULL COMMENT 'A = Active, I = Inactive',
  `acct_type` char(1) NOT NULL DEFAULT 'S' COMMENT 'S = S/B Acct, T = Term Deposit Acct',
  `deposite_amount` bigint(20) DEFAULT NULL,
  `deposite_tenure` bigint(20) DEFAULT NULL,
  `int_rate` double DEFAULT NULL,
  `maturity_amt` double DEFAULT NULL,
  `acct_holder_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`acct_id`),
  KEY `FKdxpgjy70eb9djfmftc3v4qpsf` (`acct_holder_id`)
);

CREATE  TABLE if not exists `beneficiaries` (
  `ben_id` bigint(20) NOT NULL,
  `ben_acc_num` bigint(20) NOT NULL,
  `ben_bank` bigint(20) NOT NULL,
  `ben_bank_ifsc` bigint(20) NOT NULL,
  `ben_name` varchar(100) NOT NULL,
  `ben_nick_name` varchar(100) NOT NULL,
  `user_status` char(1) NOT NULL COMMENT 'I = Internal, E = External',
  `acct_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ben_id`),
  KEY `FKkr06fei63a7jgtwovsolp3m91` (`acct_id`)
);

CREATE  TABLE if not exists `service_request` (
  `req_id` bigint(20) NOT NULL,
  `req_desc` varchar(255) NOT NULL,
  `acct_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`req_id`),
  KEY `FK1q8seu3y54u5rwtnk5i4er5e0` (`acct_id`)
) ;

CREATE  TABLE if not exists `transaction` (
  `tran_id` bigint(20) NOT NULL,
  `tran_amt` double DEFAULT NULL,
  `tran_desc` varchar(255) NOT NULL,
  `tran_dt_time` datetime NOT NULL,
  `tran_type` varchar(255) NOT NULL COMMENT 'Debit, Credit',
  `acct_id` bigint(20) DEFAULT NULL,
  `ben_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`tran_id`),
  KEY `FKkldbotl5yjqkcn6bixwdt9inl` (`acct_id`),
  KEY `FK3clswh06blr0sg8xibay3jodq` (`ben_id`)
);