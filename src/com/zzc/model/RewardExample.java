package com.zzc.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class RewardExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public RewardExample() {
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

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andRewardidIsNull() {
            addCriterion("rewardid is null");
            return (Criteria) this;
        }

        public Criteria andRewardidIsNotNull() {
            addCriterion("rewardid is not null");
            return (Criteria) this;
        }

        public Criteria andRewardidEqualTo(Integer value) {
            addCriterion("rewardid =", value, "rewardid");
            return (Criteria) this;
        }

        public Criteria andRewardidNotEqualTo(Integer value) {
            addCriterion("rewardid <>", value, "rewardid");
            return (Criteria) this;
        }

        public Criteria andRewardidGreaterThan(Integer value) {
            addCriterion("rewardid >", value, "rewardid");
            return (Criteria) this;
        }

        public Criteria andRewardidGreaterThanOrEqualTo(Integer value) {
            addCriterion("rewardid >=", value, "rewardid");
            return (Criteria) this;
        }

        public Criteria andRewardidLessThan(Integer value) {
            addCriterion("rewardid <", value, "rewardid");
            return (Criteria) this;
        }

        public Criteria andRewardidLessThanOrEqualTo(Integer value) {
            addCriterion("rewardid <=", value, "rewardid");
            return (Criteria) this;
        }

        public Criteria andRewardidIn(List<Integer> values) {
            addCriterion("rewardid in", values, "rewardid");
            return (Criteria) this;
        }

        public Criteria andRewardidNotIn(List<Integer> values) {
            addCriterion("rewardid not in", values, "rewardid");
            return (Criteria) this;
        }

        public Criteria andRewardidBetween(Integer value1, Integer value2) {
            addCriterion("rewardid between", value1, value2, "rewardid");
            return (Criteria) this;
        }

        public Criteria andRewardidNotBetween(Integer value1, Integer value2) {
            addCriterion("rewardid not between", value1, value2, "rewardid");
            return (Criteria) this;
        }

        public Criteria andReasonIsNull() {
            addCriterion("reason is null");
            return (Criteria) this;
        }

        public Criteria andReasonIsNotNull() {
            addCriterion("reason is not null");
            return (Criteria) this;
        }

        public Criteria andReasonEqualTo(String value) {
            addCriterion("reason =", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonNotEqualTo(String value) {
            addCriterion("reason <>", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonGreaterThan(String value) {
            addCriterion("reason >", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonGreaterThanOrEqualTo(String value) {
            addCriterion("reason >=", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonLessThan(String value) {
            addCriterion("reason <", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonLessThanOrEqualTo(String value) {
            addCriterion("reason <=", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonLike(String value) {
            addCriterion("reason like", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonNotLike(String value) {
            addCriterion("reason not like", value, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonIn(List<String> values) {
            addCriterion("reason in", values, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonNotIn(List<String> values) {
            addCriterion("reason not in", values, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonBetween(String value1, String value2) {
            addCriterion("reason between", value1, value2, "reason");
            return (Criteria) this;
        }

        public Criteria andReasonNotBetween(String value1, String value2) {
            addCriterion("reason not between", value1, value2, "reason");
            return (Criteria) this;
        }

        public Criteria andRewarddateIsNull() {
            addCriterion("rewarddate is null");
            return (Criteria) this;
        }

        public Criteria andRewarddateIsNotNull() {
            addCriterion("rewarddate is not null");
            return (Criteria) this;
        }

        public Criteria andRewarddateEqualTo(Date value) {
            addCriterionForJDBCDate("rewarddate =", value, "rewarddate");
            return (Criteria) this;
        }

        public Criteria andRewarddateNotEqualTo(Date value) {
            addCriterionForJDBCDate("rewarddate <>", value, "rewarddate");
            return (Criteria) this;
        }

        public Criteria andRewarddateGreaterThan(Date value) {
            addCriterionForJDBCDate("rewarddate >", value, "rewarddate");
            return (Criteria) this;
        }

        public Criteria andRewarddateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("rewarddate >=", value, "rewarddate");
            return (Criteria) this;
        }

        public Criteria andRewarddateLessThan(Date value) {
            addCriterionForJDBCDate("rewarddate <", value, "rewarddate");
            return (Criteria) this;
        }

        public Criteria andRewarddateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("rewarddate <=", value, "rewarddate");
            return (Criteria) this;
        }

        public Criteria andRewarddateIn(List<Date> values) {
            addCriterionForJDBCDate("rewarddate in", values, "rewarddate");
            return (Criteria) this;
        }

        public Criteria andRewarddateNotIn(List<Date> values) {
            addCriterionForJDBCDate("rewarddate not in", values, "rewarddate");
            return (Criteria) this;
        }

        public Criteria andRewarddateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("rewarddate between", value1, value2, "rewarddate");
            return (Criteria) this;
        }

        public Criteria andRewarddateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("rewarddate not between", value1, value2, "rewarddate");
            return (Criteria) this;
        }

        public Criteria andFkuseridIsNull() {
            addCriterion("fkuserid is null");
            return (Criteria) this;
        }

        public Criteria andFkuseridIsNotNull() {
            addCriterion("fkuserid is not null");
            return (Criteria) this;
        }

        public Criteria andFkuseridEqualTo(Integer value) {
            addCriterion("fkuserid =", value, "fkuserid");
            return (Criteria) this;
        }

        public Criteria andFkuseridNotEqualTo(Integer value) {
            addCriterion("fkuserid <>", value, "fkuserid");
            return (Criteria) this;
        }

        public Criteria andFkuseridGreaterThan(Integer value) {
            addCriterion("fkuserid >", value, "fkuserid");
            return (Criteria) this;
        }

        public Criteria andFkuseridGreaterThanOrEqualTo(Integer value) {
            addCriterion("fkuserid >=", value, "fkuserid");
            return (Criteria) this;
        }

        public Criteria andFkuseridLessThan(Integer value) {
            addCriterion("fkuserid <", value, "fkuserid");
            return (Criteria) this;
        }

        public Criteria andFkuseridLessThanOrEqualTo(Integer value) {
            addCriterion("fkuserid <=", value, "fkuserid");
            return (Criteria) this;
        }

        public Criteria andFkuseridIn(List<Integer> values) {
            addCriterion("fkuserid in", values, "fkuserid");
            return (Criteria) this;
        }

        public Criteria andFkuseridNotIn(List<Integer> values) {
            addCriterion("fkuserid not in", values, "fkuserid");
            return (Criteria) this;
        }

        public Criteria andFkuseridBetween(Integer value1, Integer value2) {
            addCriterion("fkuserid between", value1, value2, "fkuserid");
            return (Criteria) this;
        }

        public Criteria andFkuseridNotBetween(Integer value1, Integer value2) {
            addCriterion("fkuserid not between", value1, value2, "fkuserid");
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