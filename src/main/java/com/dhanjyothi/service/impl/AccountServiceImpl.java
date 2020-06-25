package com.dhanjyothi.service.impl;

import com.dhanjyothi.dao.AccountDao;
import com.dhanjyothi.dao.BeneficiaryDao;
import com.dhanjyothi.dao.KYCDao;
import com.dhanjyothi.dao.LoginDao;
import com.dhanjyothi.dao.ServiceRequestDao;
import com.dhanjyothi.dao.TransactionDao;
import java.util.List;
import org.springframework.stereotype.Service;
import com.dhanjyothi.model.Account;
import com.dhanjyothi.model.Beneficiaries;
import com.dhanjyothi.model.ServiceRequest;
import com.dhanjyothi.model.Transaction;
import com.dhanjyothi.model.User;
import com.dhanjyothi.security.config.CustomUserDetails;
import com.dhanjyothi.service.AccountService;
import com.dhanjyothi.util.DhanJyothiUtil;
import com.dhanjyothi.util.GlobalConstants;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Transactional;

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
    @Autowired
    private ServiceRequestDao serviceRequestDao;

    @Value("kyc.document.location")
    String saveLocation;

    @Override
    public List<Account> getAccountDetails(long userId, String accountType) throws Exception {
        List<Account> accountListByUserId = this.accountDao.getAccountListByUserId(userId);
        return accountListByUserId.stream().distinct().filter(a -> a.getAcctType() == accountType.charAt(0)).collect(Collectors.toList());
    }

    @Override
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

    @Override
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

    @Override
    public boolean isUserNameExists(String name) throws Exception {
        return this.loginDao.existsByUsername(name);
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
            Beneficiaries save = this.beneficiaryDao.save(beneficiaries);
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

    @Override
    @Transactional
    public void transferFundsToBeneficiary(Transaction transaction) {
        try {
            Date currentDate = DhanJyothiUtil.getCurrentDate();
            User user = ((CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
            Account savingAccount = this.getAccountDetails(user.getUserId(), "S").get(0);
            savingAccount.setAcctBalance(savingAccount.getAcctBalance() - transaction.getTranAmt());

            transaction.setTranDtTime(currentDate);
            savingAccount.getTransactions().add(transaction);
            Account savedAccount = this.accountDao.save(savingAccount);

            Account beneficiaryAccount = this.getAccountByAccountId(transaction.getBeneficiaries().getBenAccNum());
            beneficiaryAccount.setAcctBalance(beneficiaryAccount.getAcctBalance() + transaction.getTranAmt());
            Transaction beneficiaryAccountTransaction = transaction;
            beneficiaryAccountTransaction.setTranDesc(beneficiaryAccountTransaction.getTranDesc() + "/ transfered by account#" + savingAccount.getAcctId());
            beneficiaryAccountTransaction.setTranType("Credit");
            beneficiaryAccountTransaction.setTranDtTime(currentDate);
            beneficiaryAccountTransaction.setBeneficiaries(null);
            beneficiaryAccount.getTransactions().add(beneficiaryAccountTransaction);
            this.accountDao.save(beneficiaryAccount);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void saveServiceRequest(ServiceRequest serviceRequest) {
        try {
            Map<Integer, String> chequeRequestList = DhanJyothiUtil.getChequeRequestList();
            int chequeRequestCharges = chequeRequestList.entrySet().stream().filter(entry -> entry.getValue().equals(serviceRequest.getReqDesc())).map(Map.Entry::getKey).findFirst().get();
            Date currentDate = DhanJyothiUtil.getCurrentDate();
            User user = ((CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
            Account savingAccount = this.getAccountDetails(user.getUserId(), "S").get(0);
            savingAccount.setAcctBalance(savingAccount.getAcctBalance() - chequeRequestCharges);

            Transaction serviceRequestTransaction = new Transaction();
            serviceRequestTransaction.setTranAmt(chequeRequestCharges);
            serviceRequestTransaction.setTranDesc("Cheque Request of " + serviceRequest.getReqDesc());
            serviceRequestTransaction.setTranType("Debit");
            serviceRequestTransaction.setTranDtTime(currentDate);
            savingAccount.getTransactions().add(serviceRequestTransaction);
            Account savedAccount = this.accountDao.save(savingAccount);

            serviceRequest.setOwner(savedAccount);
            this.serviceRequestDao.save(serviceRequest);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Account getAccountByAccountId(long accountId) {
        return this.accountDao.getAccountByAcctId(accountId);
    }
}
