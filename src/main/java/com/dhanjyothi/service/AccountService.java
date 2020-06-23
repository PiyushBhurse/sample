package com.dhanjyothi.service;

import com.dhanjyothi.dto.SignupDTO;
import java.util.List;
import java.util.Map;

import com.dhanjyothi.model.Account;
import com.dhanjyothi.model.Beneficiaries;
import com.dhanjyothi.model.Transaction;
import com.dhanjyothi.model.User;

public interface AccountService {

    User getUserDetails(User user) throws Exception;

    List<User> getUserList(char userStatus);

    List<Account> getAccountDetails(long userId, String accountType) throws Exception;

    void openSavingsAccount(User user) throws Exception;

    void openTermAccount(Account account, User user) throws Exception;

    List<Account> getTermAccountDetails(int userId, String accountType)
            throws Exception;

    Map<Integer, String> getTenureDetails();

    boolean checkSavingsAccBalance(long termAmt) throws Exception;

    void updateSavingsAccount(Account account, User user) throws Exception;

    void saveBeneficiaries(Account account, Beneficiaries beneficiaries) throws Exception;

    int checkAccountExists(long acctId) throws Exception;

    List<Beneficiaries> getAllBeneficiaries(long accountId);

    void updateFromAccount(Account account, long transAmt, Transaction transaction) throws Exception;

    void updateToAccount(Transaction transaction) throws Exception;

    List<Transaction> loadAllTransactions(int accId) throws Exception;

    public List<Transaction> loadTransactionsBetweenStandEnDt(String startDate, String endDate) throws Exception;

    boolean isUserNameExists(String name) throws Exception;

//    Account checkAccountExists(int accountId) throws Exception;
    User getUserById(int userId) throws Exception;

    void addBeneficiary(Beneficiaries beneficiaries);
}
