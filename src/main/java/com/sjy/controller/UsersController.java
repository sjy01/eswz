package com.sjy.controller;

import com.sjy.domain.Classification;
import com.sjy.domain.Goods;
import com.sjy.domain.Users;
import com.sjy.interceptor.FileTypeInterceptor;
import com.sjy.service.ClassificationService;
import com.sjy.service.GoodsService;
import com.sjy.service.UsersService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@Transactional
public class UsersController {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private UsersService usersService;
    @Autowired
    private ClassificationService classificationService;
    //跳转登录页面
    @RequestMapping("/toUsersLogin")
    public String toUsersLogin(){
        return "Login";
        }
        //跳转到管理员页面
        @RequestMapping("/toadministrators")
        public String toadministrators(Goods goods, Classification classification,Integer pageNo, Integer pageSize, HttpServletRequest request){
            if(pageNo==null){
                pageNo=1;
            }
            if(pageSize==null){
                pageSize=8;
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

        return "page";
        }
        @RequestMapping("/toIndex")
        public String toIndex(HttpServletRequest request){
            HttpSession session=request.getSession();
            session.invalidate();
        return "redirect:index";
        }
        //1.request.getParameter(“参数名”)
        //2.用@RequestParam注解获取
        //3.Springmvc默认支持的数据类型接收参数，可直接通过controller方法参数对应jsp中请求参数name直接获取
        @RequestMapping("/usersLogin")
        public void usersLogin(Users users, HttpSession session, HttpServletResponse response) throws IOException {
            Users n=this.usersService.getPhonenumber(users.getPhonenumber());
            response.setContentType("text/html;charset=utf-8");
            if(n==null){
                response.getWriter().print("<script>alert('手机号未注册');history.go(-1);</script>");
            }
            else if(n.getState()==false){
                response.getWriter().print("<script>alert('账号被封');history.go(-1);</script>");
            }else{

                Users curUser=this.usersService.getAllUsers(users);


                if(curUser!=null){
                    session.setAttribute("curUser",curUser);
                    if(curUser.getAdministrators()==false){
                        response.getWriter().print("<script>alert('登录成功');location.href='index';</script>");
                    }else{
                        response.getWriter().print("<script>alert('登录成功');location.href='toadministrators';</script>");
                    }
                }else{
                    response.getWriter().print("<script>alert('登录失败');history.go(-1);</script>");
                }
            }

        }
    //跳转到注册页面
    @RequestMapping("toUserRegister")
    public String toUserRegister(){
        return "register";
    }
@RequestMapping("/userRegister")
    public void userRegister(Users users, MultipartFile uploadFile, HttpServletResponse response,HttpServletRequest request) throws Exception {
    response.setContentType("text/html;charset=utf-8");
        FileTypeInterceptor f=new FileTypeInterceptor();
Boolean t=f.preHandle(request,response,users.getImg());
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
        users.setImg(newFileName);
    }
}else if(t==false){
    response.getWriter().print("<script>alert('文件类型不符,请选择jpg,gif,png,ico,bmp,jpeg格式');history.go(-1);</script>");
    return ;
}


        Users name=this.usersService.getName(users.getUsername());
   Users n=this.usersService.getPhonenumber(users.getPhonenumber());
    if(name!=null){
        response.getWriter().print("<script>alert('名字太受欢迎了');history.go(-1);</script>");

    }else if(n!=null){
        response.getWriter().print("<script>alert('手机号以注册');history.go(-1);</script>");

    }else{
        users.setState(true);
        users.setAdministrators(false);
        this.usersService.userRegister(users);
        response.getWriter().print("<script>alert('注册成功');location.href='index';</script>");
    }
}
    //跳转到个人中心页面
@RequestMapping("/toMyUser")
public String toMyUser(Classification classification,HttpServletRequest request,HttpSession session){
    classification.setState(true);
    List<Classification> classificationList=this.classificationService.getAllClassification(classification);
    request.setAttribute("classificationList",classificationList);
    Users curUser = (Users) session.getAttribute("curUser");
    Integer userid=curUser.getUserid();
    Users userList= this.usersService.getUserid(userid);
    request.setAttribute("userList",userList);
    List<Goods> goodsByUserId = this.goodsService.getMyGoods(userid);
    request.setAttribute("goodsByUserId",goodsByUserId);
    return "User";
}
    //跳转到更新个人信息页面
@RequestMapping("/toupdateUser")
public String  toupdateUser(HttpServletRequest request,HttpSession session){

    Users curUser = (Users) session.getAttribute("curUser");
    int userid=curUser.getUserid();
    Users userList= this.usersService.getUserid(userid);
    request.setAttribute("userList",userList);
    return "updateUser";
}
@RequestMapping("updateUser")
public void updateUser(HttpSession session,MultipartFile uploadFile,Users users,@RequestParam("username") String username,@Param("phonenumber") String phonenumber,HttpServletResponse response,HttpServletRequest request) throws Exception {
    response.setContentType("text/html;charset=utf-8");
    FileTypeInterceptor f=new FileTypeInterceptor();
    Boolean t=f.preHandle(request,response,users.getImg());
    if(t==true){
        //上传文件
    if (!uploadFile.isEmpty()) {
        String originalFileName = uploadFile.getOriginalFilename();
        //重命名文件名
        String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf('.'));
        //上传目录
        String dirPath = request.getServletContext().getRealPath("img");
        File filePath = new File(dirPath);
        if (!filePath.exists()) {
            filePath.mkdir();
        }
        //上传文件
        uploadFile.transferTo(new File(dirPath, newFileName));
        //图片放入对象
        users.setImg(newFileName);
    }}else if(t==false){
        response.getWriter().print("<script>alert('文件类型不符,请选择jpg,gif,png,ico,bmp,jpeg格式');history.go(-1);</script>");
        return ;
    }
    Users curUser = (Users) session.getAttribute("curUser");

    Users name = this.usersService.getName(username);
    Users n = this.usersService.getPhonenumber(phonenumber);
    if (name != null) {
        if (name.getUserid() != curUser.getUserid()) {
            response.getWriter().print("<script>alert('名字太受欢迎了');history.go(-1);</script>");
        } else if(n != null) {
            if (n.getUserid() != curUser.getUserid()) {
                response.getWriter().print("<script>alert('手机号以注册');history.go(-1);</script>");
            }
            this.usersService.updateUser(users);
            response.getWriter().print("<script>alert('更新信息成功');location.href='loginout';</script>");
        }else{
            this.usersService.updateUser(users);
            response.getWriter().print("<script>alert('更新信息成功');location.href='loginout';</script>");
        }
    } else{

        this.usersService.updateUser(users);
        response.getWriter().print("<script>alert('更新信息成功');location.href='loginout';</script>");
    }
}
//他人主页
@RequestMapping("toGoodsUser")
public String toGoodsUser(Integer userid,HttpServletRequest request){
    Users userList = this.usersService.getGoodsUserid(userid);
    request.setAttribute("userList",userList);
    List<Goods> goodsByUserId = this.goodsService.getMyGoods(userid);
    request.setAttribute("goodsByUserId",goodsByUserId);
    return "User";

}
//注销
    @RequestMapping("/loginout")
    public String loginout(HttpServletRequest request){
        HttpSession session=request.getSession();
        session.invalidate();
        return "index";
    }
}
