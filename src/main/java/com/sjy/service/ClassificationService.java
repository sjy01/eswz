package com.sjy.service;

import com.sjy.domain.Classification;


import java.util.List;

public interface ClassificationService {
    //查询所有主题
    public List<Classification> getAllClassification(Classification classification);
    //增加主题
    public Integer addClassification(Classification classification);

    //修改主题
    public Integer updateClassification(Classification classification);
    //修改状态
    public Integer updateState(Classification classification);
}
