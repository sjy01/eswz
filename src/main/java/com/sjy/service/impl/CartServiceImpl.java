package com.sjy.service.impl;

import com.sjy.dao.CartDao;
import com.sjy.domain.Cart;
import com.sjy.domain.Goods;
import com.sjy.domain.Users;
import com.sjy.service.CartService;
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
public class CartServiceImpl implements CartService {
   @Autowired
   private CartDao CartDao;
    @Override
    public int insertCart(int goodsid, int userid) {
        Cart cart=new Cart();
cart.setGoodsid(goodsid);
cart.setUserid(userid);
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        cart.setAddtime(sim.format(new Date()));
        return this.CartDao.insertCart(cart);
    }



    @Override
    public List<Goods> getCart(String userid) {

        return this.CartDao.getCart(userid);
    }

    @Override
    public int deleteGoodsById(int goodsid) {
        return this.CartDao.deleteGoodsById(goodsid);
    }

    @Override
    public Cart getGoodsByGoodsId(int goodsid,int userid) {

        return this.CartDao.getGoodsByGoodsId(goodsid,userid);
    }





}
