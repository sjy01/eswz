package com.sjy.service;


import com.sjy.domain.Cart;
import com.sjy.domain.Goods;

import java.util.List;

public interface CartService {
    //插入收藏夹
    public int insertCart(int goodsid,int userid);
    //查询收藏夹
    public List<Goods> getCart(String userid);
    //删除收藏夹商品
    public int deleteGoodsById(int goodsid);
    //根据商品Id查询收藏夹内是否有该商品
    public Cart getGoodsByGoodsId(int goodsid,int userid);

}
