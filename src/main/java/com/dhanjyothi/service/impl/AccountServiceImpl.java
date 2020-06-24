package com.dhanjyothi.service.impl;

import com.dhanjyothi.dao.AccountDao;
import com.dhanjyothi.dao.BeneficiaryDao;
import com.dhanjyothi.dao.KYCDao;
import com.dhanjyothi.dao.LoginDao;
import com.dhanjyothi.dao.TransactionDao;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;
import com.dhanjyothi.model.Account;
import com.dhanjyothi.model.Beneficiaries;
import com.dhanjyothi.model.Transaction;
import com.dhanjyothi.model.User;
import com.dhanjyothi.security.config.CustomUserDetails;
import com.dhanjyothi.service.AccountService;
import com.dhanjyothi.util.DhanJyothiUtil;
import com.dhanjyothi.util.GlobalConstants;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Example;
import org.springframework.security.core.context.SecurityContextHolder;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private KYCDao kycdao;
    @Autowired
    private LoginDao loginDao;
    @Autowired
    private AccountDao accountDao;
    @Autowired
    private TransactionDao transactionDao;
    @Autowired
    private BeneficiaryDao beneficiaryDao;

    @Value("kyc.document.location")
    String saveLocation;

    public List<Account> getAccountDetails(long userId, String accountType) throws Exception {
        List<Account> accountListByUserId = this.accountDao.getAccountListByUserId(userId);
        return accountListByUserId.stream().distinct().filter(a -> a.getAcctType() == accountType.charAt(0)).collect(Collectors.toList());
    }

    public void openSavingsAccount(User user) throws Exception {
        Date currentDate = DhanJyothiUtil.getCurrentDate();
        Account savingAccount = new Account();
        savingAccount.setAcctHolder(user);
        savingAccount.setAcctType('S');
        savingAccount.setAcctBalance(GlobalConstants.OPENING_AMT);
        savingAccount.setAccountCreatedDate(currentDate);
        savingAccount.setAccountUpdatedDate(currentDate);
        savingAccount.setAcctStatus('A');

        Transaction openingAccountTransaction = new Transaction();
        openingAccountTransaction.setTranAmt(savingAccount.getAcctBalance());
        openingAccountTransaction.setTranDesc("Opening Balance");
        openingAccountTransaction.setTranType("Credit");
        openingAccountTransaction.setTranDtTime(currentDate);
        savingAccount.getTransactions().add(openingAccountTransaction);
        Account savedAccount = this.accountDao.save(savingAccount);
    }

    public void saveTransaction(long accountId, double amt, String transDesc, String transType, Beneficiaries beneficiarie) {
        Date currentDate = DhanJyothiUtil.getCurrentDate();
        Transaction accountTransaction = new Transaction();
        accountTransaction.setTranAmt(amt);
        accountTransaction.setTranDesc(transDesc);
        accountTransaction.setTranType(transType);
        accountTransaction.setTranDtTime(currentDate);
        accountTransaction.setBeneficiaries(beneficiarie);
        this.transactionDao.save(accountTransaction);
    }

    public void openTermAccount(Account termAccount, User user) throws Exception {
        Date currentDate = DhanJyothiUtil.getCurrentDate();
        termAccount.setAcctHolder(user);
        termAccount.setAccountCreatedDate(currentDate);
        termAccount.setAccountUpdatedDate(currentDate);
        termAccount.setAcctStatus('A');
        Account savedTermAccount = this.accountDao.save(termAccount);

        Account savingAccount = this.getAccountDetails(user.getUserId(), "S").get(0);
        savingAccount.setAcctBalance(savingAccount.getAcctBalance() - termAccount.getDepositeAmount());
        Transaction savingAccountTransaction = new Transaction();
        savingAccountTransaction.setTranAmt(termAccount.getDepositeAmount());
        savingAccountTransaction.setTranDesc("Term Account Opening: Term Account:#" + savedTermAccount.getAcctId());
        savingAccountTransaction.setTranType("Debit");
        savingAccountTransaction.setTranDtTime(currentDate);
        savingAccount.getTransactions().add(savingAccountTransaction);
        Account savedAccount = this.accountDao.save(savingAccount);
    }

    public List<Account> getTermAccountDetails(int userId, String accountType) throws Exception {
        return null;
    }

    public Map<Integer, String> getTenureDetails() {
        return null;
    }

    public boolean checkSavingsAccBalance(long termAmt) throws Exception {
        return true;
    }

    public void updateSavingsAccount(Account account, User cust) throws Exception {

    }

    public User getUserDetails(User user) throws Exception {
        return null;
    }

    public void saveBeneficiaries(Account account, Beneficiaries beneficiaries) throws Exception {

    }

    @Override
    public int checkAccountExists(long benAcctId) throws Exception {
        User user = ((CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
        Account savingAccount = this.getAccountDetails(user.getUserId(), "S").get(0);
        if (savingAccount != null && benAcctId == savingAccount.getAcctId()) {
            return 1;//checking for self account
        }
        List<Beneficiaries> allBeneficiaries = getAllBeneficiaries(savingAccount.getAcctId());
        if (allBeneficiaries.stream().anyMatch(b -> b.getBenAccNum() == benAcctId)) {
            return 2;//beneficiary already added
        }
        return this.accountDao.existsByAcctIdAndAcctType(benAcctId, 'S') ? 3 : 4;//3:account exists|4:account not exists
    }

    @Override
    public List<Beneficiaries> getAllBeneficiaries(long accountId) {
        List<Beneficiaries> beneficiaryListforAccount = this.beneficiaryDao.getBeneficiaryListforAccount(accountId);
        return beneficiaryListforAccount.stream().distinct().collect(Collectors.toList());
    }

    public void updateFromAccount(Account account, long transAmt, Transaction transaction) throws Exception {

    }

    public void updateToAccount(Transaction transaction) throws Exception {

    }

    @Override
    public List<Transaction> loadAllTransactions(int accId) throws Exception {
        return null;
    }

    @Override
    public List<Transaction> loadTransactionsBetweenStandEnDt(String startDate, String endDate) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        Date startDt = sdf.parse(startDate + " 00:00:00");
        Date endDt = sdf.parse(endDate + " 23:59:59");
        User user = ((CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
        List<Transaction> transactions = this.getAccountDetails(user.getUserId(), "S").get(0).getTransactions();
        return transactions.stream()
                .distinct()//get unique values
                .filter(t -> (t.getTranDtTime().after(startDt) && t.getTranDtTime().before(endDt)))//get data within st and ed date range
                .sorted(Comparator.comparing(Transaction::getTranDtTime).reversed())//sort by transaction date
                .collect(Collectors.toList());//collect elements in a list
    }

    public boolean isUserNameExists(String name) throws Exception {
        return true;
    }

    public User getUserById(int userId) throws Exception {
        return null;
    }

    @Override
    public List<User> getUserList(char userStatus) {
        List<User> allUserList = this.loginDao.getAllUserList();
        if (userStatus == 'U') {
            return allUserList.stream().distinct().collect(Collectors.toList());
        }
        List<User> filteredList = allUserList.stream().filter(u -> u.getUserStatus() == userStatus).collect(Collectors.toList());
        return filteredList.stream().distinct().collect(Collectors.toList());
    }

    @Override
    public void addBeneficiary(Beneficiaries beneficiaries) {
        try {
            User user = ((CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
            Account savingAccount = this.getAccountDetails(user.getUserId(), "S").get(0);
            beneficiaries.setOwner(savingAccount);
            System.out.println("dao>>" + beneficiaries);
            Beneficiaries save = this.beneficiaryDao.save(beneficiaries);
            System.out.println("save>>" + save);
        } catch (Exception ex) {
            Logger.getLogger(AccountServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
    }

    @Override
    public List<Beneficiaries> getAllBeneficiariesForAccount() {
        try {
            User user = ((CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
            Account savingAccount = this.getAccountDetails(user.getUserId(), "S").get(0);
            List<Beneficiaries> beneficiaryListforAccount = this.beneficiaryDao.getBeneficiaryListforAccount(savingAccount.getAcctId());
            return beneficiaryListforAccount.stream().distinct().collect(Collectors.toList());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

}
