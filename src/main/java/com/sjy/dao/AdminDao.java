package com.sjy.dao;

import com.sjy.domain.Goods;
import com.sjy.domain.Information;
import com.sjy.domain.Users;

import java.util.List;

public interface AdminDao {
    //查询所有用户
    public List<Users> getAllUsers(Users users);
    //更新用户状态
    public Integer updateUserState(Users users);
//更新商品状态
    public Integer updateGoodsState(Goods goods);
    //更新信息状态
    public int updateAdminInformation(Information information);
}
