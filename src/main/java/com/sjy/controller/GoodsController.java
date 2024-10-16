package com.sjy.controller;

import com.sjy.domain.Classification;
import com.sjy.domain.Goods;
import com.sjy.domain.Users;
import com.sjy.interceptor.FileTypeInterceptor;
import com.sjy.service.CartService;
import com.sjy.service.GoodsService;
import com.sjy.service.ClassificationService;
import com.sjy.service.InfromationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class GoodsController {
@Autowired
private GoodsService goodsService;
@Autowired
private ClassificationService classificationService;

    @Autowired
    private CartService cartService;
//商品详情
    @RequestMapping("/detailGoods")
    public String detailGoods(Integer goodsid, Classification classification,HttpServletRequest request,HttpSession session){
        Goods goods= this.goodsService.getGoodsById(goodsid);
        session.setAttribute("goods",goods);
        classification.setState(true);
        List<Classification> classificationList=this.classificationService.getAllClassification(classification);
        request.setAttribute("classificationList",classificationList);
        return "details";
    }
    //跳转到发布页面
    @RequestMapping("/toAddGoods")
    public String toAddGoods(HttpServletRequest request,Classification classification){
        classification.setState(true);
        List<Classification> classificationList=this.classificationService.getAllClassification(classification);
        request.setAttribute("classificationList",classificationList);
        return "AddGoods";
    }
    //发布商品
    @RequestMapping("/doAddGoods")
    public void doAddGoods(Goods goods, MultipartFile uploadFile, HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        FileTypeInterceptor f=new FileTypeInterceptor();
        Boolean t=f.preHandle(request,response,goods.getImage());
        if(t==true){
        //上传文件
        if(!uploadFile.isEmpty()){
            String originalFileName=uploadFile.getOriginalFilename();
            //重命名文件名
            String newFileName= UUID.randomUUID()+originalFileName.substring(originalFileName.lastIndexOf('.'));
            //上传目录
            String dirPath=request.getServletContext().getRealPath("img");
            File filePath=new File(dirPath);
            if(!filePath.exists()){
                filePath.mkdir();
            }
            //上传文件
            uploadFile.transferTo(new File(dirPath,newFileName));
            //图片放入对象
goods.setImage(newFileName);
        }}else if(t==false){
            response.getWriter().print("<script>alert('文件类型不符,请选择jpg,gif,png,ico,bmp,jpeg格式');history.go(-1);</script>");
            return ;
        }
        Users curUser = (Users) session.getAttribute("curUser");
        int userid=curUser.getUserid();

        int n=goodsService.inserGoods(goods,userid);
        if(n>0){

            response.getWriter().print("<script>alert('发布成功，等待管理员审核');location.href='index';</script>");
        }else{
            response.getWriter().print("<script>alert('发布失败');history.go(-1);</script>");
        }
    }
    //跳转到我的商品页面
@RequestMapping("/toMyGoods")
    public String toMyGoods(Goods goods,Classification classification,Integer pageNo,Integer pageSize,HttpServletRequest request,HttpSession session){

    if(pageNo==null){
        pageNo=1;
    }
    if(pageSize==null){
        pageSize=8;
    }
    Users curUser = (Users) session.getAttribute("curUser");
    int userid=curUser.getUserid();
    int rowsCount=this.goodsService.getMyGoodsCount(userid);
    int pageCount=rowsCount%pageSize==0?rowsCount/pageSize:rowsCount/pageSize+1;
    request.setAttribute("rowsCount",rowsCount);
    request.setAttribute("pageCount",pageCount);
    request.setAttribute("pageNo",pageNo);
    classification.setState(true);
    request.setAttribute("pageSize",pageSize);
    List<Classification> classificationList=this.classificationService.getAllClassification(classification);
    request.setAttribute("classificationList",classificationList);
    List<Goods> goodsByUserId = this.goodsService.getGoodsByUserId(goods,userid,pageNo,pageSize);
    request.setAttribute("goodsByUserId",goodsByUserId);
    return "MyGoods";
}
//跳转修改页面
@RequestMapping("/toUpdateGoods")
    public String toUpdateGoods(Integer goodsid,Classification classification,HttpServletRequest request){
    classification.setState(true);
    List<Classification> classificationList=this.classificationService.getAllClassification(classification);
    request.setAttribute("classificationList",classificationList);
    Goods goodsById = this.goodsService.getGoodsById(goodsid);
    request.setAttribute("goodsById",goodsById);
    return "UpdateGoods";
}
//修改我的商品
    @RequestMapping("/updateGoods")
    public void updateGoods(Goods goods,MultipartFile uploadFile,HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        FileTypeInterceptor f=new FileTypeInterceptor();
        Boolean t=f.preHandle(request,response,goods.getImage());
        if(t==true){
        //上传文件
        if(!uploadFile.isEmpty()){
            String originalFileName=uploadFile.getOriginalFilename();
            //重命名文件名
            String newFileName= UUID.randomUUID()+originalFileName.substring(originalFileName.lastIndexOf('.'));
            //上传目录
            String dirPath=request.getServletContext().getRealPath("img");
            File filePath=new File(dirPath);
            if(!filePath.exists()){
                filePath.mkdir();
            }
            //上传文件
            uploadFile.transferTo(new File(dirPath,newFileName));
            //图片放入对象
            goods.setImage(newFileName);
        }}else if(t==false){
            response.getWriter().print("<script>alert('文件类型不符,请选择jpg,gif,png,ico,bmp,jpeg格式');history.go(-1);</script>");
            return ;
        }
        int n=this.goodsService.updateMyGoods(goods);
        if(n>0){

            response.getWriter().print("<script>alert('更新商品成功,等待管理员审核');location.href='toMyGoods';</script>");
        }else{
            response.getWriter().print("<script>alert('更新商品失败');history.go(-1);</script>");
        }

    }
//    删除我的商品
@RequestMapping("/deleteMyGoods")
    public String deleteMyGoods(int goodsid,HttpSession session){
        this.goodsService.deleteMyGoods(goodsid);
    Users curUser = (Users) session.getAttribute("curUser");
    int user=curUser.getUserid();
    //重定向
    return "redirect:toMyGoods?userid="+user;
}
}
