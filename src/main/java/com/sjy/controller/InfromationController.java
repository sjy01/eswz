package com.sjy.controller;

import com.sjy.domain.Classification;
import com.sjy.domain.Information;
import com.sjy.domain.Users;
import com.sjy.service.ClassificationService;
import com.sjy.service.InfromationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class InfromationController {
    @Autowired
    private InfromationService infromationService;
    @Autowired
    private ClassificationService classificationService;
    //跳转到信息页面
    @RequestMapping("/toInformation")
    public String toInformation(Information information, Integer pageNo, Integer pageSize, HttpServletRequest request){
        if(pageNo==null){
            pageNo=1;
        }
        if(pageSize==null){
            pageSize=6;
        }
        information.setState(true);

        //总数
        int rowsCount=this.infromationService.getInformationCount(information);
        //页数
        int pageCount=rowsCount%pageSize==0?rowsCount/pageSize:rowsCount/pageSize+1;
        request.setAttribute("rowsCount",rowsCount);
        request.setAttribute("pageCount",pageCount);
        request.setAttribute("pageNo",pageNo);
        request.setAttribute("pageSize",pageSize);
        List<Information> InformationList=this.infromationService.allInformation(information,pageNo,pageSize);
   request.setAttribute("InformationList",InformationList);
   return "Information";
    }
//    跳转到发布信息页面
    @RequestMapping("/toinsertInformation")
    public String toinsertInformation(){
        return "InsertInformation";
    }
    @RequestMapping("/doinsertInformation")
    public void doinsertInformation(Information information, HttpSession session, HttpServletResponse response) throws IOException {
        Users curUser = (Users) session.getAttribute("curUser");
        information.setUsers(curUser);
        information.setState(false);
        int n=this.infromationService.intertInformation(information);
        if(n>0){
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("<script>alert('发布成功，等待管理员审核');location.href='index';</script>");
        }else{
            response.getWriter().print("<script>alert('发布失败');history.go(-1);</script>");
        }
    }
    //跳转到管理我的信息页面
    @RequestMapping("/toMyInformation")
    public String toMyInformation(Information information,Classification classification, Integer pageNo, Integer pageSize,HttpSession session,HttpServletRequest request){
        if(pageNo==null){
            pageNo=1;
        }
        if(pageSize==null){
            pageSize=6;
        }
        Users curUser = (Users) session.getAttribute("curUser");
        int userid=curUser.getUserid();
        //总数
        int rowsCount=this.infromationService.getMyInformationCount(userid);
        //页数
        int pageCount=rowsCount%pageSize==0?rowsCount/pageSize:rowsCount/pageSize+1;
        request.setAttribute("rowsCount",rowsCount);
        request.setAttribute("pageCount",pageCount);
        request.setAttribute("pageNo",pageNo);
        request.setAttribute("pageSize",pageSize);
        List<Information> informationList = this.infromationService.MyInformation(information,pageNo,pageSize,curUser);
request.setAttribute("informationList",informationList);
        return "MyInformation";
    }
    //跳转到管理我的信息更新页面
@RequestMapping("/toupdateInformation")
public String toupdateInformation(int id,HttpServletRequest request){
    Information informationById = this.infromationService.getInformationById(id);
request.setAttribute("informationById",informationById);
return "updateinformation";
}
@RequestMapping("/updateInformation")
    public void updateInformation(Information information,HttpServletResponse response) throws IOException {
    information.setState(false);
    int n=this.infromationService.updateInformation(information);
    if(n>0){
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().print("<script>alert('修改成功，等待管理员审核');location.href='index';</script>");
    }else{
        response.getWriter().print("<script>alert('修改失败');history.go(-1);</script>");
    }
}
@RequestMapping("/deleteInformation")
    public String deleteInformation(int id,HttpSession session){
        this.infromationService.deleteInformation(id);
    Users curUser = (Users) session.getAttribute("curUser");
    int user=curUser.getUserid();
        return "redirect:toMyInformation?iuserid="+user;
}
}
