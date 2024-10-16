package com.sjy.controller;


import com.sjy.domain.Notice;
import com.sjy.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class NoticeController {
    @Autowired
    private NoticeService noticeService;
    //跳转到公告页面
    @RequestMapping("/toNotice")
    public String toNotice(Notice notice, Integer pageNo, Integer pageSize, HttpServletRequest request){
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
        request.setAttribute("NoticeList",NoticeList);
        return "Notice";
    }
    //跳转到添加公告页面
    @RequestMapping("/toAddNotice")
    public String toAddNotice(HttpSession session){
        if(session.getAttribute("curUser")==null){
            return "redirect:toUsersLogin";
        }else{
        return "AddNotice";}
    }
    @RequestMapping("/doAddNotice")
    public void doAddNotice(Notice notice, HttpServletResponse response) throws IOException {
        int n=this.noticeService.addNotice(notice);
        if(n>0){
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("<script>alert('发布成功');location.href='toAdminNotice';</script>");
        }else{
            response.getWriter().print("<script>alert('发布失败');history.go(-1);</script>");
        }
    }
    @RequestMapping("/deleteNotice")
    public String deleteNotice(int noticeid){
        this.noticeService.deleteNotice(noticeid);
        return "redirect:toAdminNotice";
    }
}
