package com.sjy.controller;

import com.sjy.domain.Cart;
import com.sjy.domain.Classification;
import com.sjy.domain.Goods;
import com.sjy.domain.Users;
import com.sjy.service.CartService;
import com.sjy.service.ClassificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@Transactional
public class CartController {
    @Autowired
    private CartService cartService;
    @Autowired
    private ClassificationService classificationService;
    @RequestMapping("/insertCart")
    public String insertCart(HttpSession session, HttpServletResponse response,int goodsid) throws IOException {

        if(session.getAttribute("curUser")==null){
            return "redirect:toUsersLogin";
        }else{
            Users curUser = (Users) session.getAttribute("curUser");
            int userid=curUser.getUserid();
            Cart goodsByGoodsId = this.cartService.getGoodsByGoodsId(goodsid,userid);
            if(goodsByGoodsId!=null){
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print("<script>alert('该商品以在购物车中');history.go(-1);</script>");
            }else{
                //从session中取出登入用户
                this.cartService.insertCart(goodsid,userid);
            }
            return "redirect:getCart?userid="+userid;
        }
        }

    //跳转到收藏夹页面
    @RequestMapping("/getCart")
    public String getCart(String userid, Classification classification,HttpServletRequest request,HttpSession session,HttpServletResponse response) throws IOException {
        //判断用户是否登录
        Users curUser = (Users) session.getAttribute("curUser");
        if(curUser==null){
            return "redirect:toUsersLogin";
        }else{
            String uid=Integer.toString(curUser.getUserid());
            //判断是否为当前登入的用户访问
            if(uid.equals(userid)){
                classification.setState(true);
                List<Classification> classificationList=this.classificationService.getAllClassification(classification);
                request.setAttribute("classificationList",classificationList);
                List<Goods> cartList = this.cartService.getCart(userid);
                request.setAttribute("cartList",cartList);
                return "ShoppingCart";
            }else{
                return "err";
            }

        }

    }
    @RequestMapping("/deleteGoods")
    public String deleteGoods(int goodsid, HttpSession session) throws IOException {
        Users curUser = (Users) session.getAttribute("curUser");
        int user=curUser.getUserid();
       this.cartService.deleteGoodsById(goodsid);
       //重定向
        return "redirect:getCart?userid="+user;

    }

}
