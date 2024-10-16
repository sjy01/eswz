package com.sjy.dao;

import com.sjy.domain.Cart;
import com.sjy.domain.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CartDao {
//添加商品到购物车
    public int insertCart(Cart cart);
    //更具用户Id查询购物车
    public List<Goods> getCart(String userid);
    //根据商品ID删除购物车商品
    public int deleteGoodsById(int goodsid);
   //根据商品Id查询购物车内是否有该商品@Param的作用就是给参数命名
    public Cart getGoodsByGoodsId(@Param("goodsid") int goodsid,@Param("userid") int userid);
}
