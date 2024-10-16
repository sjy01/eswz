package com.sjy.service.impl;

import com.sjy.dao.GoodsDao;
import com.sjy.domain.Goods;
import com.sjy.domain.Users;
import com.sjy.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
@Transactional
public class GoodsServiceImpl implements GoodsService {
@Autowired
private GoodsDao goodsDao;

    @Override
    public List<Goods> getGoods(Goods goods ,int pageNo, int pageSize) {
        Map map = new HashMap();
        map.put("currentIndex",(pageNo-1)*pageSize);
        map.put("pageSize",pageSize);
        map.put("goods",goods);
        return this.goodsDao.getGoods(map);
    }

    @Override
    public Integer getGoodsCount(Goods goods) {
        return this.goodsDao.getGoodsCount(goods);
    }

    @Override
    public Goods getGoodsById(int goodsid) {

        return this.goodsDao.getGoodsById(goodsid);
    }

    @Override
    public int inserGoods(Goods goods,Integer userid) {
        goods.setUserid(userid);
       goods.setState(false);
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        goods.setNewtime(sim.format(new Date()));
        return this.goodsDao.inserGoods(goods);
    }

    @Override
    public List<Goods> getGoodsByUserId(Goods goods,int userid,Integer pageNo,Integer pageSize) {
        Map map=new HashMap();
        map.put("currentIndex",(pageNo-1)*pageSize);
        map.put("pageSize",pageSize);
        goods.setUserid(userid);
        map.put("goods",goods);
        return this.goodsDao.getGoodsByUserId(map);
    }

    @Override
    public List<Goods> getMyGoods(int userid)
    {
        return this.goodsDao.getMyGoods(userid);
    }

    @Override
    public Integer getMyGoodsCount(int userid) {
        return this.goodsDao.getMyGoodsCount(userid);
    }

    @Override
    public int updateMyGoods(Goods goods) {
        goods.setState(false);
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        goods.setNewtime(sim.format(new Date()));
        return this.goodsDao.updateMyGoods(goods);
    }

    @Override
    public int deleteMyGoods(int goodsid) {
        return this.goodsDao.deleteMyGoods(goodsid);
    }
}
