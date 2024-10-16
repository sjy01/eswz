package com.sjy.service.impl;

import com.sjy.dao.NoticeDao;
import com.sjy.domain.Notice;
import com.sjy.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeDao noticeDao;
    @Override
    public int addNotice(Notice notice) {
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        notice.setNewtime(sim.format(new Date()));
        return this.noticeDao.addNotice(notice);
    }

    @Override
    public List<Notice> getAllNotice(Notice notice, int pageNo, int pageSize) {
        Map map=new HashMap();
        map.put("currentIndex",(pageNo-1)*pageSize);
        map.put("pageSize",pageSize);;
        map.put("notice",notice);
        return this.noticeDao.getAllNotice(map);
    }

    @Override
    public Integer getNoticeCount(Notice notice) {
        return this.noticeDao.getNoticeCount(notice);
    }

    @Override
    public Integer deleteNotice(int noticeid) {
        return this.noticeDao.deleteNotice(noticeid);
    }
}
