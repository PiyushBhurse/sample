package com.dhanjyothi.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhanjyothi.dao.LoginDao;
import com.dhanjyothi.model.User;
import com.dhanjyothi.service.LoginService;
import com.dhanjyothi.util.GlobalConstants;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginDao loginDao;

    String saveLocation = "D:/dhanjyothiDocs/";
    private static Integer count = 0;

    @Override
    public long saveUser(User user) {
        // TODO Auto-generated method stub        
        String uniqueconstrain = new SimpleDateFormat("ddMMyyhhmmssSS").format(new Date());
        count = 1;
        String realPathtoUploads = GlobalConstants.FILE_LOCATION;
        user.getKycData().stream().filter(kyc -> !kyc.getFile().isEmpty()).forEach(kyc -> {
            try {
                if (!new File(realPathtoUploads).exists()) {
                    new File(realPathtoUploads).mkdir();
                }
                String fileName = uniqueconstrain + count + kyc.getFile().getOriginalFilename();
                count++;
                String filePath = realPathtoUploads + fileName;
                File dest = new File(filePath);
                kyc.getFile().transferTo(dest);
                kyc.setDocumentLoc(fileName);
            } catch (IOException | IllegalStateException e) {
                e.printStackTrace();
                int x = 1 / 0;
            }
        });
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        user.setPassword(encoder.encode(user.getPassword()));;
        user = this.loginDao.save(user);
        return user.getUserId();
    }

    @Override
    public User getUserByUserId(long userId) {
        // TODO Auto-generated method stub
        Optional<User> u = this.loginDao.findById(userId);
        if (u.isPresent()) {
            return u.get();
        } else {
            return null;
        }
    }

    @Override
    public User getUserByUserName(String userName) {
        // TODO Auto-generated method stub
        return this.loginDao.getUserByUsername(userName);
    }

    @Override
    public void updateCustomerUserStatus(long userId, char userStatus) {
        this.loginDao.updateCustomerUserStatus(userId, userStatus);
    }

}
