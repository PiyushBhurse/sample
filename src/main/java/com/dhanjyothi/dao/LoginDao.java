package com.dhanjyothi.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.dhanjyothi.model.User;
import java.util.List;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

public interface LoginDao extends JpaRepository<User, Long> {

    @Transactional
    @Query("SELECT u FROM User u left join u.kycData k WHERE u.username = :username")
    public User getUserByUsername(@Param("username") String username);

    @Query("SELECT u FROM User u left join u.kycData k WHERE u.userRole ='C' ")
    public List<User> getAllUserList();

    @Transactional
    @Modifying
    @Query("UPDATE User u set u.userStatus=:userStatus WHERE u.userId=:userId")
    public void updateCustomerUserStatus(@Param("userId") long userId, @Param("userStatus") char userStatus);
    
    boolean existsByUsername(String username);
}
