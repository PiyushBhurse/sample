package com.dhanjyothi.dao;

import java.util.List;

import com.dhanjyothi.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AccountDao extends JpaRepository<Account, Long>{

    @Query("select a from Account a left join a.acctHolder u where a.acctHolder.userId=:userId")
    public List<Account> getAccountListByUserId(@Param("userId")long userId);
	
//	User getUserDetails(User user) throws Exception;
//	
//	Account getAccountDetails(int userId, String accountType) throws Exception;
//	
//	void openSavingsAccount(Account account,boolean isSavingsAccountExists) throws Exception;
//	
//	void openTermAccount(Account account) throws Exception;
//	
//	List<Account> getTermAccountDetails(int userId, String accountType) throws Exception;
//	
//	void saveBeneficiaries(Beneficiaries beneficiaries) throws Exception;
//	
//	Account checkAccountExists(int accountId) throws Exception;
//	
//	List<Beneficiaries> getAllBeneficiaries(int accountId) throws Exception;
//	
//	void updateTransactionDetails(Transaction transaction) throws Exception;
//	
//	List<Transaction> loadAllTransactions(int accountId) throws Exception;
//	
//	User isUserNameExists(String name) throws Exception;
//	
//	User getUserById(int userId) throws Exception;

}
