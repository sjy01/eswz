package com.sjy.controller;

import com.sjy.domain.*;
import com.sjy.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Transactional
public class AdminController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private ClassificationService classificationService;
    @Autowired
    private NoticeService noticeService;
    @Autowired
    private InfromationService infromationService;
    @Autowired
    private UsersService usersService;
    //跳转到管理用户页面
    @RequestMapping("/toAllUsers")
    private String toAllUsers(Users users, HttpServletRequest request, HttpSession session,@RequestParam("state") Boolean state){
        if(session.getAttribute("curUser")==null){
            return "redirect:toUsersLogin";
        }else{
            users.setAdministrators(false);
            if(state==false){
                users.setState(false);
            }else{
               users.setState(true);
            }
            List<Users> allUsers = this.adminService.getAllUsers(users);
            request.setAttribute("allUsers",allUsers);
            return "AllUsers";
        }
    }
    @RequestMapping("/updateUserState")
    public String updateUserState(Users users,@RequestParam("state") Boolean state, @RequestParam("userid") int userid){
        users.setUserid(userid);
        if(state==false){
            users.setState(true);
        }else{
            users.setState(false);
        }

        this.adminService.updateUserState(users);
        //重定向
        return "redirect:toAllUsers?state="+false;
    }
    //跳转到管理商品页面
    @RequestMapping("/toAllGoods")
    public String toAllGoods(Goods goods,Classification classification, Integer pageNo, Integer pageSize,HttpServletRequest request,@RequestParam("state") Boolean state,HttpSession session){
        if(session.getAttribute("curUser")==null){
            return "redirect:toUsersLogin";
        }else{
        if(pageNo==null){
            pageNo=1;
        }
        if(pageSize==null){
            pageSize=8;
        }
        if(state==false){
            goods.setState(false);
        }else{
            goods.setState(true);
        }

        //总数
        int rowsCount=this.goodsService.getGoodsCount(goods);
        //页数
        int pageCount=rowsCount%pageSize==0?rowsCount/pageSize:rowsCount/pageSize+1;
        request.setAttribute("rowsCount",rowsCount);
        request.setAttribute("pageCount",pageCount);
        request.setAttribute("pageNo",pageNo);
        request.setAttribute("pageSize",pageSize);
        List<Goods> goodsList=this.goodsService.getGoods(goods,pageNo,pageSize);
        request.setAttribute("goodsList",goodsList);
        classification.setState(true);
        List<Classification> classificationList=this.classificationService.getAllClassification(classification);
        request.setAttribute("classificationList",classificationList);
        return "AllGoods";}
    }

    @RequestMapping("updateGoodsState")
    public String updateGoodsState(Goods goods,@RequestParam("goodsid") int goodsid,@RequestParam("state") Boolean state){
        goods.setGoodsid(goodsid);
        if(state==false){
            goods.setState(true);
        }else{
            goods.setState(false);
        }
        this.adminService.updateGoodsState(goods);
        //重定向
        return "redirect:toAllGoods?state="+false;
    }
    //跳转到管理类别页面
    @RequestMapping("/toClassification")
    public String toClassification(HttpServletRequest request,Classification classification,HttpSession session){
        if(session.getAttribute("curUser")==null){
            return "redirect:toUsersLogin";
        }else{
        List<Classification> classificationList=this.classificationService.getAllClassification(classification);
        request.setAttribute("classificationList",classificationList);}
    return "Classification";
    }
    //增加类别
    @RequestMapping("/addClassification")
    public String addClassification(Classification classification){
        this.classificationService.addClassification(classification);
        return "redirect:toClassification";
    }
    //更新
    @RequestMapping("/updateClassification")
    public String updateClassification(Classification classification){
        this.classificationService.updateClassification(classification);
        return "redirect:toClassification";
    }
    @RequestMapping("/updateState")
    public String updateState(Classification classification,@RequestParam("classificationid") int classificationid,@RequestParam("state") Boolean state){
        classification.setClassificationid(classificationid);
        if(state==false){
            classification.setState(true);
        }else{
            classification.setState(false);
        }
        this.classificationService.updateState(classification);
        return "redirect:toClassification";
    }
    //管理公告
    @RequestMapping("/toAdminNotice")
    public String toAdminNotice(HttpSession session,Notice notice, Integer pageNo, Integer pageSize, HttpServletRequest request){
        if(session.getAttribute("curUser")==null){
            return "redirect:toUsersLogin";
        }else{
        if(pageNo==null){
            pageNo=1;
        }
        if(pageSize==null){
            pageSize=8;
        }

        //总数
        int rowsCount=this.noticeService.getNoticeCount(notice);
        //页数
        int pageCount=rowsCount%pageSize==0?rowsCount/pageSize:rowsCount/pageSize+1;
        request.setAttribute("rowsCount",rowsCount);
        request.setAttribute("pageCount",pageCount);
        request.setAttribute("pageNo",pageNo);
        request.setAttribute("pageSize",pageSize);
        List<Notice> NoticeList=this.noticeService.getAllNotice(notice,pageNo,pageSize);
        request.setAttribute("NoticeList",NoticeList);}
        return "AdminNotice";
    }
    //管理信息
    @RequestMapping("/toAdminInformation")
    public String toAdminInformation(HttpSession session,Information information, @RequestParam("state") Boolean state,Integer pageNo, Integer pageSize, HttpServletRequest request){
        if(session.getAttribute("curUser")==null){
            return "redirect:toUsersLogin";
        }else{
        if(pageNo==null){
            pageNo=1;
        }
        if(pageSize==null){
            pageSize=8;
        }
        information.setState(state);

        //总数
        int rowsCount=this.infromationService.getInformationCount(information);
        //页数
        int pageCount=rowsCount%pageSize==0?rowsCount/pageSize:rowsCount/pageSize+1;
        request.setAttribute("rowsCount",rowsCount);
        request.setAttribute("pageCount",pageCount);
        request.setAttribute("pageNo",pageNo);
        request.setAttribute("pageSize",pageSize);
        List<Information> AllInformation=this.infromationService.allInformation(information,pageNo,pageSize);
        request.setAttribute("AllInformation",AllInformation);}
        return "AdminInformation";
    }
@RequestMapping("/updateinfromationState")
    public String updateinfromationState(Information information,@RequestParam("id") int id,@RequestParam("state") Boolean state){
        information.setId(id);
    if(state==false){
        information.setState(true);
    }else{
        information.setState(false);
    }
    this.adminService.updateAdminInformation(information);
    return "redirect:toAdminInformation?state="+false;
}
@RequestMapping("/phoneUser")
    public String phoneUser(String phonenumber,HttpServletRequest request){
        Users users=this.usersService.getPhonenumber(phonenumber);
        request.setAttribute("users",users);
        return "AllUser";
}

}
