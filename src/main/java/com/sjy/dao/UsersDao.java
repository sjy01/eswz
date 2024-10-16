package com.sjy.dao;

import com.sjy.domain.Users;

public interface UsersDao {
    //查询用户信息
    public Users getAllUsers(Users users);
    //注册用户
    public Integer userRegister(Users users);
    //根据名字查询用户
    public Users getName(String username);
    //根据用户手机号查询
    public Users getPhonenumber(String phonenumber);
//修改用户信息(根据用户ID查询信息)
  public Users getUserid(int userid);
//更新用户信息
    public int updateUser(Users users);
//根据卖家ID查询用户
public Users getGoodsUserid(int userid);

}
