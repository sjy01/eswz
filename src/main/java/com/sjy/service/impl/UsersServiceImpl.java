package com.sjy.service.impl;

import com.sjy.dao.UsersDao;
import com.sjy.domain.Users;
import com.sjy.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service
@Transactional
public class UsersServiceImpl implements UsersService {
    @Autowired
    private UsersDao usersDao;
//    查询用户信息
    @Override
    public Users getAllUsers(Users users) {

        return this.usersDao.getAllUsers(users);

    }
    //注册
    @Override
    public Integer userRegister(Users users) {
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        users.setTime(sim.format(new Date()));
        return this.usersDao.userRegister(users);
    }

    @Override
    public Users getName(String username) {
        return this.usersDao.getName(username);
    }

    @Override
    public Users getPhonenumber(String phonenumber) {
        return this.usersDao.getPhonenumber(phonenumber);
    }

    @Override
    public Users getUserid(int userid) {
        return usersDao.getUserid(userid);
    }

    @Override
    public int updateUser(Users users) {

        return this.usersDao.updateUser(users);
    }

    @Override
    public Users getGoodsUserid(int userid) {
        return this.usersDao.getGoodsUserid(userid);
    }


}
