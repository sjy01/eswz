package com.sjy.dao;

import com.sjy.domain.Information;

import java.util.List;
import java.util.Map;

public interface InformationDao {
    //查询求助信息
    public List<Information> allInformation(Map map);
    //查询信息数量
    public Integer getInformationCount(Information information);
    //查询我的信息
    public List<Information> MyInformation(Map map);
    //查询我发布信息数量
    public Integer getMyInformationCount(int userid);
    //发布求助信息
    public int intertInformation(Information information);
    //根据id查询信息
    public Information getInformationById(int id);
    //修改信息
    public int updateInformation(Information information);
    //删除信息
    public int deleteInformation(int id);

}
