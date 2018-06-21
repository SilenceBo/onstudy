package com.xawl.study.model;

import java.util.ArrayList;
import java.util.List;

public class AdminNoticeExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AdminNoticeExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andAnidIsNull() {
            addCriterion("anid is null");
            return (Criteria) this;
        }

        public Criteria andAnidIsNotNull() {
            addCriterion("anid is not null");
            return (Criteria) this;
        }

        public Criteria andAnidEqualTo(Integer value) {
            addCriterion("anid =", value, "anid");
            return (Criteria) this;
        }

        public Criteria andAnidNotEqualTo(Integer value) {
            addCriterion("anid <>", value, "anid");
            return (Criteria) this;
        }

        public Criteria andAnidGreaterThan(Integer value) {
            addCriterion("anid >", value, "anid");
            return (Criteria) this;
        }

        public Criteria andAnidGreaterThanOrEqualTo(Integer value) {
            addCriterion("anid >=", value, "anid");
            return (Criteria) this;
        }

        public Criteria andAnidLessThan(Integer value) {
            addCriterion("anid <", value, "anid");
            return (Criteria) this;
        }

        public Criteria andAnidLessThanOrEqualTo(Integer value) {
            addCriterion("anid <=", value, "anid");
            return (Criteria) this;
        }

        public Criteria andAnidIn(List<Integer> values) {
            addCriterion("anid in", values, "anid");
            return (Criteria) this;
        }

        public Criteria andAnidNotIn(List<Integer> values) {
            addCriterion("anid not in", values, "anid");
            return (Criteria) this;
        }

        public Criteria andAnidBetween(Integer value1, Integer value2) {
            addCriterion("anid between", value1, value2, "anid");
            return (Criteria) this;
        }

        public Criteria andAnidNotBetween(Integer value1, Integer value2) {
            addCriterion("anid not between", value1, value2, "anid");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTextIsNull() {
            addCriterion("text is null");
            return (Criteria) this;
        }

        public Criteria andTextIsNotNull() {
            addCriterion("text is not null");
            return (Criteria) this;
        }

        public Criteria andTextEqualTo(String value) {
            addCriterion("text =", value, "text");
            return (Criteria) this;
        }

        public Criteria andTextNotEqualTo(String value) {
            addCriterion("text <>", value, "text");
            return (Criteria) this;
        }

        public Criteria andTextGreaterThan(String value) {
            addCriterion("text >", value, "text");
            return (Criteria) this;
        }

        public Criteria andTextGreaterThanOrEqualTo(String value) {
            addCriterion("text >=", value, "text");
            return (Criteria) this;
        }

        public Criteria andTextLessThan(String value) {
            addCriterion("text <", value, "text");
            return (Criteria) this;
        }

        public Criteria andTextLessThanOrEqualTo(String value) {
            addCriterion("text <=", value, "text");
            return (Criteria) this;
        }

        public Criteria andTextLike(String value) {
            addCriterion("text like", value, "text");
            return (Criteria) this;
        }

        public Criteria andTextNotLike(String value) {
            addCriterion("text not like", value, "text");
            return (Criteria) this;
        }

        public Criteria andTextIn(List<String> values) {
            addCriterion("text in", values, "text");
            return (Criteria) this;
        }

        public Criteria andTextNotIn(List<String> values) {
            addCriterion("text not in", values, "text");
            return (Criteria) this;
        }

        public Criteria andTextBetween(String value1, String value2) {
            addCriterion("text between", value1, value2, "text");
            return (Criteria) this;
        }

        public Criteria andTextNotBetween(String value1, String value2) {
            addCriterion("text not between", value1, value2, "text");
            return (Criteria) this;
        }

        public Criteria andNotivetypeIsNull() {
            addCriterion("notiveType is null");
            return (Criteria) this;
        }

        public Criteria andNotivetypeIsNotNull() {
            addCriterion("notiveType is not null");
            return (Criteria) this;
        }

        public Criteria andNotivetypeEqualTo(Integer value) {
            addCriterion("notiveType =", value, "notivetype");
            return (Criteria) this;
        }

        public Criteria andNotivetypeNotEqualTo(Integer value) {
            addCriterion("notiveType <>", value, "notivetype");
            return (Criteria) this;
        }

        public Criteria andNotivetypeGreaterThan(Integer value) {
            addCriterion("notiveType >", value, "notivetype");
            return (Criteria) this;
        }

        public Criteria andNotivetypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("notiveType >=", value, "notivetype");
            return (Criteria) this;
        }

        public Criteria andNotivetypeLessThan(Integer value) {
            addCriterion("notiveType <", value, "notivetype");
            return (Criteria) this;
        }

        public Criteria andNotivetypeLessThanOrEqualTo(Integer value) {
            addCriterion("notiveType <=", value, "notivetype");
            return (Criteria) this;
        }

        public Criteria andNotivetypeIn(List<Integer> values) {
            addCriterion("notiveType in", values, "notivetype");
            return (Criteria) this;
        }

        public Criteria andNotivetypeNotIn(List<Integer> values) {
            addCriterion("notiveType not in", values, "notivetype");
            return (Criteria) this;
        }

        public Criteria andNotivetypeBetween(Integer value1, Integer value2) {
            addCriterion("notiveType between", value1, value2, "notivetype");
            return (Criteria) this;
        }

        public Criteria andNotivetypeNotBetween(Integer value1, Integer value2) {
            addCriterion("notiveType not between", value1, value2, "notivetype");
            return (Criteria) this;
        }

        public Criteria andIsittimedIsNull() {
            addCriterion("isItTimed is null");
            return (Criteria) this;
        }

        public Criteria andIsittimedIsNotNull() {
            addCriterion("isItTimed is not null");
            return (Criteria) this;
        }

        public Criteria andIsittimedEqualTo(Boolean value) {
            addCriterion("isItTimed =", value, "isittimed");
            return (Criteria) this;
        }

        public Criteria andIsittimedNotEqualTo(Boolean value) {
            addCriterion("isItTimed <>", value, "isittimed");
            return (Criteria) this;
        }

        public Criteria andIsittimedGreaterThan(Boolean value) {
            addCriterion("isItTimed >", value, "isittimed");
            return (Criteria) this;
        }

        public Criteria andIsittimedGreaterThanOrEqualTo(Boolean value) {
            addCriterion("isItTimed >=", value, "isittimed");
            return (Criteria) this;
        }

        public Criteria andIsittimedLessThan(Boolean value) {
            addCriterion("isItTimed <", value, "isittimed");
            return (Criteria) this;
        }

        public Criteria andIsittimedLessThanOrEqualTo(Boolean value) {
            addCriterion("isItTimed <=", value, "isittimed");
            return (Criteria) this;
        }

        public Criteria andIsittimedIn(List<Boolean> values) {
            addCriterion("isItTimed in", values, "isittimed");
            return (Criteria) this;
        }

        public Criteria andIsittimedNotIn(List<Boolean> values) {
            addCriterion("isItTimed not in", values, "isittimed");
            return (Criteria) this;
        }

        public Criteria andIsittimedBetween(Boolean value1, Boolean value2) {
            addCriterion("isItTimed between", value1, value2, "isittimed");
            return (Criteria) this;
        }

        public Criteria andIsittimedNotBetween(Boolean value1, Boolean value2) {
            addCriterion("isItTimed not between", value1, value2, "isittimed");
            return (Criteria) this;
        }

        public Criteria andTimeIsNull() {
            addCriterion("time is null");
            return (Criteria) this;
        }

        public Criteria andTimeIsNotNull() {
            addCriterion("time is not null");
            return (Criteria) this;
        }

        public Criteria andTimeEqualTo(String value) {
            addCriterion("time =", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotEqualTo(String value) {
            addCriterion("time <>", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeGreaterThan(String value) {
            addCriterion("time >", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeGreaterThanOrEqualTo(String value) {
            addCriterion("time >=", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeLessThan(String value) {
            addCriterion("time <", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeLessThanOrEqualTo(String value) {
            addCriterion("time <=", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeLike(String value) {
            addCriterion("time like", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotLike(String value) {
            addCriterion("time not like", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeIn(List<String> values) {
            addCriterion("time in", values, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotIn(List<String> values) {
            addCriterion("time not in", values, "time");
            return (Criteria) this;
        }

        public Criteria andTimeBetween(String value1, String value2) {
            addCriterion("time between", value1, value2, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotBetween(String value1, String value2) {
            addCriterion("time not between", value1, value2, "time");
            return (Criteria) this;
        }

        public Criteria andIssendoutIsNull() {
            addCriterion("isSendOut is null");
            return (Criteria) this;
        }

        public Criteria andIssendoutIsNotNull() {
            addCriterion("isSendOut is not null");
            return (Criteria) this;
        }

        public Criteria andIssendoutEqualTo(Boolean value) {
            addCriterion("isSendOut =", value, "issendout");
            return (Criteria) this;
        }

        public Criteria andIssendoutNotEqualTo(Boolean value) {
            addCriterion("isSendOut <>", value, "issendout");
            return (Criteria) this;
        }

        public Criteria andIssendoutGreaterThan(Boolean value) {
            addCriterion("isSendOut >", value, "issendout");
            return (Criteria) this;
        }

        public Criteria andIssendoutGreaterThanOrEqualTo(Boolean value) {
            addCriterion("isSendOut >=", value, "issendout");
            return (Criteria) this;
        }

        public Criteria andIssendoutLessThan(Boolean value) {
            addCriterion("isSendOut <", value, "issendout");
            return (Criteria) this;
        }

        public Criteria andIssendoutLessThanOrEqualTo(Boolean value) {
            addCriterion("isSendOut <=", value, "issendout");
            return (Criteria) this;
        }

        public Criteria andIssendoutIn(List<Boolean> values) {
            addCriterion("isSendOut in", values, "issendout");
            return (Criteria) this;
        }

        public Criteria andIssendoutNotIn(List<Boolean> values) {
            addCriterion("isSendOut not in", values, "issendout");
            return (Criteria) this;
        }

        public Criteria andIssendoutBetween(Boolean value1, Boolean value2) {
            addCriterion("isSendOut between", value1, value2, "issendout");
            return (Criteria) this;
        }

        public Criteria andIssendoutNotBetween(Boolean value1, Boolean value2) {
            addCriterion("isSendOut not between", value1, value2, "issendout");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}