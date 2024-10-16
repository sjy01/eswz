package com.sjy.dao;

import com.sjy.domain.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface GoodsDao {
    //返回分页查询商品
    public List<Goods> getGoods(Map map);
    //查询商品总数
    public Integer getGoodsCount(Goods goods);
    //根据商品ID查询商品（详情）
    public Goods getGoodsById(int goodsid);
    //发布商品
    public int inserGoods(Goods goods);
    //管理我的商品分页
    public List<Goods> getGoodsByUserId(Map map);
    //查询我的商品
    public List<Goods> getMyGoods(int userid);
    //查询我的商品数量
    public Integer getMyGoodsCount(int userid);
    //修改我的商品
public int updateMyGoods(Goods goods);
//删除我的商品
public int deleteMyGoods(int goodsid);

}
