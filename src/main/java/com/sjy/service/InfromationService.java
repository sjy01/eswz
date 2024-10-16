package com.sjy.service;

import com.sjy.domain.Information;
import com.sjy.domain.Users;

import java.util.List;
import java.util.Map;

public interface InfromationService {
    //查询求助信息
    public List<Information> allInformation(Information information,int pageNo, int pageSize);
    //查询信息数量
    public Integer getInformationCount(Information information);
    //发布求助信息
    public int intertInformation(Information information);
    //查询我的信息
    public List<Information> MyInformation(Information information, int pageNo, int pageSize, Users curUser);
    //查询我发布信息数量
    public Integer getMyInformationCount(int userid);
    //根据id查询信息
    public Information getInformationById(int id);
    //修改信息
    public int updateInformation(Information information);
    //删除信息
    public int deleteInformation(int id);
}
