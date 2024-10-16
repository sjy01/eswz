package com.sjy.service;

import com.sjy.dao.NoticeDao;
import com.sjy.domain.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    //发布公告
    public int addNotice(Notice notice);
    //查询公告
    public List<Notice> getAllNotice(Notice notice,int pageNo, int pageSize);
    //查询数量
    public Integer getNoticeCount(Notice notice);
    //删除公告
    public Integer deleteNotice(int noticeid);
}
