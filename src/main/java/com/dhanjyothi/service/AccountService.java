package com.dhanjyothi.service;

import java.util.List;

import com.dhanjyothi.model.Account;
import com.dhanjyothi.model.Beneficiaries;
import com.dhanjyothi.model.ServiceRequest;
import com.dhanjyothi.model.Transaction;
import com.dhanjyothi.model.User;

public interface AccountService {

	public List<User> getUserList(char userStatus);

	public List<Account> getAccountDetails(long userId, String accountType) throws Exception;

	public void openSavingsAccount(User user) throws Exception;

	public void openTermAccount(Account account, User user) throws Exception;

	public int checkAccountExists(long acctId) throws Exception;

	public List<Beneficiaries> getAllBeneficiaries(long accountId);

	public List<Transaction> loadAllTransactions(int accId) throws Exception;

	public List<Transaction> loadTransactionsBetweenStandEnDt(String startDate, String endDate) throws Exception;

	public boolean isUserNameExists(String name) throws Exception;

	public void addBeneficiary(Beneficiaries beneficiaries);

	public Account getAccountByAccountId(long accountId);

	public List<Beneficiaries> getAllBeneficiariesForAccount();

	public void transferFundsToBeneficiary(Transaction transaction);

	public void saveServiceRequest(ServiceRequest serviceRequest);
}
