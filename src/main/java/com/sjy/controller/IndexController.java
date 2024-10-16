package com.sjy.controller;


import com.sjy.dao.GoodsDao;
import com.sjy.domain.Classification;
import com.sjy.domain.Goods;

import com.sjy.domain.Users;
import com.sjy.service.GoodsService;
import com.sjy.service.ClassificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private ClassificationService classificationService;
@RequestMapping("/index")
    public String index(Goods goods,Classification classification, Integer pageNo, Integer pageSize, HttpServletRequest request){

    if(pageNo==null){
        pageNo=1;
    }
    if(pageSize==null){
        pageSize=8;
    }
    //状态
    goods.setState(true);
    //总数
    int rowsCount=this.goodsService.getGoodsCount(goods);
    //页数
    int pageCount=rowsCount%pageSize==0?rowsCount/pageSize:rowsCount/pageSize+1;
    request.setAttribute("rowsCount",rowsCount);
    request.setAttribute("pageCount",pageCount);
    request.setAttribute("pageNo",pageNo);
    request.setAttribute("pageSize",pageSize);
    classification.setState(true);
    List<Goods> goodsList=this.goodsService.getGoods(goods,pageNo,pageSize);
request.setAttribute("goodsList",goodsList);
List<Classification> classificationList=this.classificationService.getAllClassification(classification);
request.setAttribute("classificationList",classificationList);
    return "firstpage";
}
}
