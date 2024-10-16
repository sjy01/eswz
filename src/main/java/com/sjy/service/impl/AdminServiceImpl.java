package com.sjy.service.impl;

import com.sjy.dao.AdminDao;
import com.sjy.domain.Goods;
import com.sjy.domain.Information;
import com.sjy.domain.Users;
import com.sjy.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    @Override
    public List<Users> getAllUsers(Users users) {
        return this.adminDao.getAllUsers(users);
    }

    @Override
    public Integer updateUserState(Users users) {
        return this.adminDao.updateUserState(users);
    }

    @Override
    public Integer updateGoodsState(Goods goods) {
        return this.adminDao.updateGoodsState(goods);
    }

    @Override
    public int updateAdminInformation(Information information) {
        return this.adminDao.updateAdminInformation(information);
    }

}
