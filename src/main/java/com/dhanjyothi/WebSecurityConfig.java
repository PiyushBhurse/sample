/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dhanjyothi;

import com.dhanjyothi.security.config.UserDetailsServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailsServiceImpl();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(11);
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/css/**", "/js/**", "/imgs/**").permitAll()
                .antMatchers("/forgotPassword.htm").permitAll()
                .antMatchers("/home/signup**").permitAll()
                .antMatchers("/registerCustomer/save**").permitAll()
                .antMatchers("/home/index").permitAll()
                .antMatchers("/ajax/**").permitAll()
                .antMatchers("/h2console/**").permitAll()
                .antMatchers("/home/customerList**").hasAnyAuthority("M")
                .antMatchers("/home/activateCustomer**").hasAnyAuthority("M")
                .antMatchers("/home/confirmCustomer**").hasAnyAuthority("M")
                .antMatchers("/download/kyc**").hasAnyAuthority("M")
                .antMatchers("/account/accountSummary**").hasAnyAuthority("C")
                .antMatchers("/account/createSavingsAccount**").hasAnyAuthority("C")
                .antMatchers("/account/openTermAccount**").hasAnyAuthority("C")
                .antMatchers("/account/createTermAccount**").hasAnyAuthority("C")
                .antMatchers("/account/beneficiaryAdd**").hasAnyAuthority("C")
                .antMatchers("/account/addBeneficiary**").hasAnyAuthority("C")
                .antMatchers("/account/transferFunds**").hasAnyAuthority("C")
                .antMatchers("/account/fundTransfer**").hasAnyAuthority("C")
                .anyRequest().denyAll()
                .and()
                .exceptionHandling().accessDeniedPage("/errors/accessDenied")
                .and()
                .formLogin()
                .loginPage("/home/login").defaultSuccessUrl("/home/index", true).permitAll()
                .and()
                .logout().permitAll()
                .logoutSuccessUrl("/home/login?logout")
                .and().sessionManagement().maximumSessions(1).expiredUrl("/home/login?expired");
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }
}
