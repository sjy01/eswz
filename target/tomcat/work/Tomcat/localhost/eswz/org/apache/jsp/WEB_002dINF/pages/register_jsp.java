/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2023-04-19 08:41:36 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.pages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <title>注册</title>\r\n");
      out.write("</head>\r\n");
      out.write("<!-- 必须引入国际标准字符集 -->\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<!-- 移动设备优先-->\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("\r\n");
      out.write("<!-- 引入Bootstrap 中CSS 文件库-->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"bootstrap-5.1.3-dist/css/bootstrap.min.css\">\r\n");
      out.write("<!--\t  引入第三方字体图标-->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"font-awesome-4.7.0/css/font-awesome.css\">\r\n");
      out.write("<!-- 引入Bootstrap Bundle，包括Papper-->\r\n");
      out.write("<script src=\"bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js\" ></script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body style=\"background: url(");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/img/beijinglogin.jpg) no-repeat ;background-size: 130%\">\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html lang=\"zh-CN\">\r\n");
      out.write("\r\n");
      out.write("<div class=\"ccontainer-fluid\">\r\n");
      out.write("\r\n");
      out.write("    <div class=\"row\">\r\n");
      out.write("        <div class=\"col-md-6\"></div>\r\n");
      out.write("        <div class=\"col-md-3 my-4\" >\r\n");
      out.write("            <h3 class=\"text-center my-3\">__欢迎您__</h3>\r\n");
      out.write("            <form id=\"regForm\" method=\"post\" action=\"userRegister\" enctype=\"multipart/form-data\">\r\n");
      out.write("                <div class=\"input-group mb-3 my-3\"> <span class=\"input-group-text\" id=\"basic-addon1\">&nbsp&nbsp昵&nbsp&nbsp&nbsp&nbsp称&nbsp</span>\r\n");
      out.write("                    <input type=\"text\" class=\"form-control\"  aria-label=\"Username\" aria-describedby=\"basic-addon1\" name=\"username\" maxlength=\"6\" placeholder=\"昵称长度2到6个字\" style=\"background:rgba(255,255,255,0.15)\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"input-group mb-3 my-3\"> <span class=\"input-group-text\" id=\"basic-addon2\">&nbsp手&nbsp机&nbsp号&nbsp</span>\r\n");
      out.write("                    <input type=\"text\" class=\"form-control\"  aria-label=\"Usernam\" aria-describedby=\"basic-addon2\" name=\"phonenumber\" maxlength=\"11\" placeholder=\"请输入...\" style=\"background:rgba(255,255,255,0.15)\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"input-group mb-3 my-3\"> <span class=\"input-group-text\" id=\"basic-addon3\">&nbsp&nbspQ&nbspQ&nbsp号&nbsp</span>\r\n");
      out.write("                    <input type=\"text\" class=\"form-control\"  aria-label=\"Usernam\" aria-describedby=\"basic-addon3\" name=\"qq\" id=\"qq\" maxlength=\"11\" placeholder=\"请输入...\" style=\"background:rgba(255,255,255,0.15)\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"input-group mb-3 my-3\"> <span class=\"input-group-text\" id=\"basic-addon4\">&nbsp&nbsp密&nbsp&nbsp&nbsp&nbsp码&nbsp</span>\r\n");
      out.write("\r\n");
      out.write("                    <input type=\"password\" class=\"form-control\"  aria-label=\"Username\" aria-describedby=\"basic-addon4\" name=\"password\" id=\"password\" maxlength=\"10\" placeholder=\"密码长度6到10位\" style=\"background:rgba(255,255,255,0.15)\" autocomplete=\"off\">\r\n");
      out.write("                    <i class=\"fa fa-eye mb-3 my-3 mx-3 fa-2x\" id=\"eye1\" style=\"background-color: #fff\"></i>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"input-group mb-3 my-3\"> <span class=\"input-group-text\" id=\"basic-addon5\">&nbsp确认密码</span>\r\n");
      out.write("                    <input type=\"password\" class=\"form-control\"  aria-label=\"Username\" aria-describedby=\"basic-addon5\" name=\"password2\" id=\"password2\" maxlength=\"10\" placeholder=\"请再次输入...\" style=\"background:rgba(255,255,255,0.15)\" autocomplete=\"off\">\r\n");
      out.write("                    <i class=\"fa fa-eye mb-3 my-3 mx-3 fa-2x\" id=\"eye2\" style=\"background-color: #fff\"></i>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"input-group mb-3 my-3\"> <span class=\"input-group-text\" id=\"basic-addon6\">&nbsp&nbsp性&nbsp&nbsp&nbsp&nbsp别&nbsp&nbsp</span>\r\n");
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("                    <div class=\"form-check form-check-inline mx-3 my-2\">\r\n");
      out.write("                        <input class=\"form-check-input\" type=\"radio\" name=\"sex\" id=\"inlineRadio1\" value=\"true\" checked>\r\n");
      out.write("                        <label class=\"form-check-label\" for=\"inlineRadio1\">男</label>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-check form-check-inline mx-3 my-2\">\r\n");
      out.write("                        <input class=\"form-check-input\" type=\"radio\" name=\"sex\" id=\"inlineRadio2\" value=\"false\">\r\n");
      out.write("                        <label class=\"form-check-label\" for=\"inlineRadio2\">女</label>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"input-group mb-3 my-3\"> <span class=\"input-group-text\" id=\"basic-addon7\">&nbsp&nbsp学&nbsp&nbsp&nbsp&nbsp院&nbsp&nbsp</span>\r\n");
      out.write("\r\n");
      out.write("                    <select class=\"form-select\" id=\"validationCustom05\" required name=\"college\" style=\"background:rgba(255,255,255,0.15)\">\r\n");
      out.write("                    <option>物流与信息工程学院</option>\r\n");
      out.write("                    <option>商贸与经济管理学院</option>\r\n");
      out.write("                    <option>旅游与公共管理学院</option>\r\n");
      out.write("                    <option>建筑工程学院</option>\r\n");
      out.write("                    <option>机电与汽车工程学院</option>\r\n");
      out.write("                    <option>艺术设计学院</option>\r\n");
      out.write("                    <option>教师</option>\r\n");
      out.write("                        <option>未知</option>\r\n");
      out.write("                </select>\r\n");
      out.write("                </div>\r\n");
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("                    <div class=\"input-group mb-3\">\r\n");
      out.write("                        <label class=\"input-group-text\" for=\"formFile\">&nbsp&nbsp头&nbsp&nbsp&nbsp像</label>\r\n");
      out.write("                        <input type=\"file\" class=\"form-control\" id=\"formFile\" name=\"uploadFile\" style=\"background:rgba(255,255,255,0.15)\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                <div class=\"row py-3\">\r\n");
      out.write("                    <div class=\"col-md-4\">\r\n");
      out.write("                        <a href=\"index\" class=\"link-dark mx-3 text-decoration-none\">返回首页</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-3\">\r\n");
      out.write("                        <button class=\"btn btn-primary\" type=\"submit\" id=\"sub\">注册</button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-4\">\r\n");
      out.write("                        <a href=\"toUsersLogin\" class=\"link-dark mx-3  text-decoration-none\">去登录</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </form>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"col-md-3\"></div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"fixed-bottom\">\r\n");
      out.write("\r\n");
      out.write("    <div class=\"row p-3 bg-dark\" style=\"height: 90px;\">\r\n");
      out.write("        <div class=\"iconColor text-center\">\r\n");
      out.write("            <a href=\"#\"><i class=\"fa fa-weixin me-2\"></i></a> <a href=\"#\"></a> <a href=\"#\"><i class=\"fa fa-qq me-2\"></i></a> <a href=\"#\"></a>  <a href=\"#\"><i class=\"fa fa-google-plus me-2\"></i></a> <a href=\"#\"></a> <a href=\"#\"><i class=\"fa fa-github me-2\"></i></a> <a href=\"#\"></a> <a href=\"#\"><i class=\"fa fa-twitter\"></i></a>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div><li class=\"text-center p-2 text-white\">Copyright © 2022.盛家愈</li></div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/jQuery3.6.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    var inputs=document.getElementsByTagName('input');\r\n");
      out.write("    inputs.username.onblur = function() {\r\n");
      out.write("        var username = $(\"input[name='username']\").val()\r\n");
      out.write("        $.ajax({\r\n");
      out.write("            type:'POST',\r\n");
      out.write("            url:'userRegister',\r\n");
      out.write("            data:{username:username},\r\n");
      out.write("success:function (){\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("        })\r\n");
      out.write("\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    inputs.phonenumber.onblur = function() {\r\n");
      out.write("        var phonenumber = $(\"input[name='phonenumber']\").val()\r\n");
      out.write("        $.ajax({\r\n");
      out.write("            type:'POST',\r\n");
      out.write("            url:'usersLogin',\r\n");
      out.write("            data:{phonenumber:phonenumber},\r\n");
      out.write("            success:function (){\r\n");
      out.write("\r\n");
      out.write("            }\r\n");
      out.write("        })\r\n");
      out.write("\r\n");
      out.write("    }\r\n");
      out.write("   $(function (){\r\n");
      out.write("        //表单提交时\r\n");
      out.write("        $(\"#regForm\").submit(function (){\r\n");
      out.write("//昵称长度\r\n");
      out.write("            if($(\"input[name='username']\").val().length<2){\r\n");
      out.write("                alert(\"昵称最少2位\")\r\n");
      out.write("                return false;\r\n");
      out.write("            }\r\n");
      out.write("            var qq = $(\"#qq\").val();\r\n");
      out.write("            //判断用户名是否为空\r\n");
      out.write("            if(qq == \"\") {\r\n");
      out.write("                alert(\"QQ不能为空\");\r\n");
      out.write("                //取消默认行为\r\n");
      out.write("                return false;\r\n");
      out.write("            }\r\n");
      out.write("            //手机号格式\r\n");
      out.write("            var phone=/^1((34[0-8])|(8\\d{2})|(([35][0-35-9]|4[579]|66|7[35678]|9[1389])\\d{1}))\\d{7}$/;\r\n");
      out.write("            if(!phone.test($(\"input[name='phonenumber']\").val())){\r\n");
      out.write("                alert(\"手机号格式不正确\")\r\n");
      out.write("                return false;\r\n");
      out.write("            }\r\n");
      out.write("            //密码长度\r\n");
      out.write("            if($(\"input[name='password']\").val().length<6){\r\n");
      out.write("                alert(\"密码最少6位\")\r\n");
      out.write("                return false;\r\n");
      out.write("            }\r\n");
      out.write("            //两次密码是否一致\r\n");
      out.write("            if($(\"input[name='password']\").val()!=$(\"input[name='password2']\").val()){\r\n");
      out.write("                alert(\"两次密码不一致\")\r\n");
      out.write("                return false;\r\n");
      out.write("            }\r\n");
      out.write("            return true;\r\n");
      out.write("        })\r\n");
      out.write("    })\r\n");
      out.write("    //密码显示\r\n");
      out.write("    let eye1 = document.getElementById('eye1');\r\n");
      out.write("    let eye2 = document.getElementById('eye2');\r\n");
      out.write("    let pwd1 = document.getElementById('password');\r\n");
      out.write("    let pwd2 = document.getElementById('password2');\r\n");
      out.write("    // 2.注册事件 处理程序\r\n");
      out.write("    let flag = 0;\r\n");
      out.write("    eye1.onclick = function() {\r\n");
      out.write("        // 点击一次之后，flag一定要变化\r\n");
      out.write("        if (flag == 0) {\r\n");
      out.write("            pwd1.type = 'text';\r\n");
      out.write("            flag = 1; //赋值操作\r\n");
      out.write("        } else {\r\n");
      out.write("            pwd1.type = 'password';\r\n");
      out.write("            flag = 0;\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("    let flag1=0;\r\n");
      out.write("    eye2.onclick = function() {\r\n");
      out.write("        // 点击一次之后，flag一定要变化\r\n");
      out.write("        if (flag1 == 0) {\r\n");
      out.write("            pwd2.type = 'text';\r\n");
      out.write("            flag1 = 1; //赋值操作\r\n");
      out.write("        } else {\r\n");
      out.write("            pwd2.type = 'password';\r\n");
      out.write("            flag1 = 0;\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("</script>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
