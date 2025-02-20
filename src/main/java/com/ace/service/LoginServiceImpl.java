package com.ace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ace.dao.LoginDao;
import com.ace.domain.Login;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginDao loginDao;

    @Override
    public Login loginCheck(Login login) {
       
        Login result = loginDao.loginCheck(login);

        if (result != null) {

            if (result.getPassword().equals(login.getPassword())) {
                return result; 
            }
        }
        return null;
    }
}
