package com.sjy.service.impl;

import com.sjy.dao.ClassificationDao;
import com.sjy.domain.Classification;
import com.sjy.service.ClassificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class ClassificationServiceImpl implements ClassificationService {
    @Autowired
    private ClassificationDao classificationDao;
    @Override
    public List<Classification> getAllClassification(Classification classification) {
        return this.classificationDao.getAllClassification(classification);

    }

    @Override
    public Integer addClassification(Classification classification) {
        return this.classificationDao.addClassification(classification);
    }
    @Override
    public Integer updateClassification(Classification classification) {
        return this.classificationDao.updateClassification(classification);
    }

    @Override
    public Integer updateState(Classification classification) {

        return this.classificationDao.updateState(classification);
    }
}
