package com.sjy.domain;

public class Classification {
    private Integer classificationid;
    private String classificationname;
    public Boolean state;

    public Integer getClassificationid() {
        return classificationid;
    }

    public void setClassificationid(Integer classificationid) {
        this.classificationid = classificationid;
    }

    public String getClassificationname() {
        return classificationname;
    }

    public void setClassificationname(String classificationname) {
        this.classificationname = classificationname;
    }

    public Boolean getState() {
        return state;
    }

    public void setState(Boolean state) {
        this.state = state;
    }
}
