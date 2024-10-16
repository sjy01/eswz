package com.sjy.service.impl;

import com.sjy.dao.InformationDao;
import com.sjy.domain.Information;
import com.sjy.domain.Users;
import com.sjy.service.InfromationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
@Transactional
public class InfromationServiceImpl implements InfromationService {
    @Autowired
    private InformationDao informationDao;
    @Override
    public List<Information> allInformation(Information information,int pageNo, int pageSize) {
        Map map=new HashMap();
        map.put("currentIndex",(pageNo-1)*pageSize);
        map.put("pageSize",pageSize);;
        map.put("information",information);
        return this.informationDao.allInformation(map);
    }

    @Override
    public Integer getInformationCount(Information information) {
        return this.informationDao.getInformationCount(information);
    }

    @Override
    public int intertInformation(Information information) {
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        information.setAddtime(sim.format(new Date()));
        return this.informationDao.intertInformation(information);
    }

    @Override
    public List<Information> MyInformation(Information information, int pageNo, int pageSize, Users curUser) {
        Map map=new HashMap();
        map.put("currentIndex",(pageNo-1)*pageSize);
        map.put("pageSize",pageSize);
        information.setUsers(curUser);
        map.put("information",information);
        return this.informationDao.MyInformation(map);
    }

    @Override
    public Integer getMyInformationCount(int userid) {
        return this.informationDao.getMyInformationCount(userid);
    }

    @Override
    public Information getInformationById(int id) {
        return this.informationDao.getInformationById(id);
    }

    @Override
    public int updateInformation(Information information) {
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        information.setAddtime(sim.format(new Date()));
        return this.informationDao.updateInformation(information);
    }

    @Override
    public int deleteInformation(int id) {
        return this.informationDao.deleteInformation(id);
    }
}
