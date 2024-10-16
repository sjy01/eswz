package com.sjy.service;

import com.sjy.domain.Goods;

import java.util.List;



public interface GoodsService {
    //返回分页查询商品
    public List<Goods> getGoods(Goods goods,int pageNo, int pageSize);
    //查询商品总数
    public Integer getGoodsCount(Goods goods);
    //根据商品ID查询商品（详情）
    public Goods getGoodsById(int goodsid);
    //发布商品
    public int inserGoods(Goods goods,Integer userid);
    //管理我的商品
    public List<Goods> getGoodsByUserId(
            Goods goods,int userid,Integer pageNo,Integer pageSize);

    //查询我的商品
    public List<Goods> getMyGoods(int userid);
    //查询我的商品数量
    public Integer getMyGoodsCount(int userid);
    //修改我的商品
    public int updateMyGoods(Goods goods);
    //删除我的商品
    public int deleteMyGoods(int goodsid);
}
