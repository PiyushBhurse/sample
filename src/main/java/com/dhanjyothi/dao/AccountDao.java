package com.dhanjyothi.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.dhanjyothi.model.Account;

public interface AccountDao extends JpaRepository<Account, Long> {

	@Query("select a from Account a left join a.acctHolder u where a.acctHolder.userId=:userId")
	public List<Account> getAccountListByUserId(@Param("userId") long userId);

	boolean existsByAcctIdAndAcctType(long acctId, char acctType);

	public Account getAccountByAcctId(long accountId);

}
