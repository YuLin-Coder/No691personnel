package com.zzc.model;

import java.util.ArrayList;
import java.util.List;

public class PostExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public PostExample() {
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

        public Criteria andPostidIsNull() {
            addCriterion("postid is null");
            return (Criteria) this;
        }

        public Criteria andPostidIsNotNull() {
            addCriterion("postid is not null");
            return (Criteria) this;
        }

        public Criteria andPostidEqualTo(Integer value) {
            addCriterion("postid =", value, "postid");
            return (Criteria) this;
        }

        public Criteria andPostidNotEqualTo(Integer value) {
            addCriterion("postid <>", value, "postid");
            return (Criteria) this;
        }

        public Criteria andPostidGreaterThan(Integer value) {
            addCriterion("postid >", value, "postid");
            return (Criteria) this;
        }

        public Criteria andPostidGreaterThanOrEqualTo(Integer value) {
            addCriterion("postid >=", value, "postid");
            return (Criteria) this;
        }

        public Criteria andPostidLessThan(Integer value) {
            addCriterion("postid <", value, "postid");
            return (Criteria) this;
        }

        public Criteria andPostidLessThanOrEqualTo(Integer value) {
            addCriterion("postid <=", value, "postid");
            return (Criteria) this;
        }

        public Criteria andPostidIn(List<Integer> values) {
            addCriterion("postid in", values, "postid");
            return (Criteria) this;
        }

        public Criteria andPostidNotIn(List<Integer> values) {
            addCriterion("postid not in", values, "postid");
            return (Criteria) this;
        }

        public Criteria andPostidBetween(Integer value1, Integer value2) {
            addCriterion("postid between", value1, value2, "postid");
            return (Criteria) this;
        }

        public Criteria andPostidNotBetween(Integer value1, Integer value2) {
            addCriterion("postid not between", value1, value2, "postid");
            return (Criteria) this;
        }

        public Criteria andPostnameIsNull() {
            addCriterion("postname is null");
            return (Criteria) this;
        }

        public Criteria andPostnameIsNotNull() {
            addCriterion("postname is not null");
            return (Criteria) this;
        }

        public Criteria andPostnameEqualTo(String value) {
            addCriterion("postname =", value, "postname");
            return (Criteria) this;
        }

        public Criteria andPostnameNotEqualTo(String value) {
            addCriterion("postname <>", value, "postname");
            return (Criteria) this;
        }

        public Criteria andPostnameGreaterThan(String value) {
            addCriterion("postname >", value, "postname");
            return (Criteria) this;
        }

        public Criteria andPostnameGreaterThanOrEqualTo(String value) {
            addCriterion("postname >=", value, "postname");
            return (Criteria) this;
        }

        public Criteria andPostnameLessThan(String value) {
            addCriterion("postname <", value, "postname");
            return (Criteria) this;
        }

        public Criteria andPostnameLessThanOrEqualTo(String value) {
            addCriterion("postname <=", value, "postname");
            return (Criteria) this;
        }

        public Criteria andPostnameLike(String value) {
            addCriterion("postname like", value, "postname");
            return (Criteria) this;
        }

        public Criteria andPostnameNotLike(String value) {
            addCriterion("postname not like", value, "postname");
            return (Criteria) this;
        }

        public Criteria andPostnameIn(List<String> values) {
            addCriterion("postname in", values, "postname");
            return (Criteria) this;
        }

        public Criteria andPostnameNotIn(List<String> values) {
            addCriterion("postname not in", values, "postname");
            return (Criteria) this;
        }

        public Criteria andPostnameBetween(String value1, String value2) {
            addCriterion("postname between", value1, value2, "postname");
            return (Criteria) this;
        }

        public Criteria andPostnameNotBetween(String value1, String value2) {
            addCriterion("postname not between", value1, value2, "postname");
            return (Criteria) this;
        }

        public Criteria andPostdescIsNull() {
            addCriterion("postdesc is null");
            return (Criteria) this;
        }

        public Criteria andPostdescIsNotNull() {
            addCriterion("postdesc is not null");
            return (Criteria) this;
        }

        public Criteria andPostdescEqualTo(String value) {
            addCriterion("postdesc =", value, "postdesc");
            return (Criteria) this;
        }

        public Criteria andPostdescNotEqualTo(String value) {
            addCriterion("postdesc <>", value, "postdesc");
            return (Criteria) this;
        }

        public Criteria andPostdescGreaterThan(String value) {
            addCriterion("postdesc >", value, "postdesc");
            return (Criteria) this;
        }

        public Criteria andPostdescGreaterThanOrEqualTo(String value) {
            addCriterion("postdesc >=", value, "postdesc");
            return (Criteria) this;
        }

        public Criteria andPostdescLessThan(String value) {
            addCriterion("postdesc <", value, "postdesc");
            return (Criteria) this;
        }

        public Criteria andPostdescLessThanOrEqualTo(String value) {
            addCriterion("postdesc <=", value, "postdesc");
            return (Criteria) this;
        }

        public Criteria andPostdescLike(String value) {
            addCriterion("postdesc like", value, "postdesc");
            return (Criteria) this;
        }

        public Criteria andPostdescNotLike(String value) {
            addCriterion("postdesc not like", value, "postdesc");
            return (Criteria) this;
        }

        public Criteria andPostdescIn(List<String> values) {
            addCriterion("postdesc in", values, "postdesc");
            return (Criteria) this;
        }

        public Criteria andPostdescNotIn(List<String> values) {
            addCriterion("postdesc not in", values, "postdesc");
            return (Criteria) this;
        }

        public Criteria andPostdescBetween(String value1, String value2) {
            addCriterion("postdesc between", value1, value2, "postdesc");
            return (Criteria) this;
        }

        public Criteria andPostdescNotBetween(String value1, String value2) {
            addCriterion("postdesc not between", value1, value2, "postdesc");
            return (Criteria) this;
        }

        public Criteria andFkdeptidIsNull() {
            addCriterion("fkdeptid is null");
            return (Criteria) this;
        }

        public Criteria andFkdeptidIsNotNull() {
            addCriterion("fkdeptid is not null");
            return (Criteria) this;
        }

        public Criteria andFkdeptidEqualTo(Integer value) {
            addCriterion("fkdeptid =", value, "fkdeptid");
            return (Criteria) this;
        }

        public Criteria andFkdeptidNotEqualTo(Integer value) {
            addCriterion("fkdeptid <>", value, "fkdeptid");
            return (Criteria) this;
        }

        public Criteria andFkdeptidGreaterThan(Integer value) {
            addCriterion("fkdeptid >", value, "fkdeptid");
            return (Criteria) this;
        }

        public Criteria andFkdeptidGreaterThanOrEqualTo(Integer value) {
            addCriterion("fkdeptid >=", value, "fkdeptid");
            return (Criteria) this;
        }

        public Criteria andFkdeptidLessThan(Integer value) {
            addCriterion("fkdeptid <", value, "fkdeptid");
            return (Criteria) this;
        }

        public Criteria andFkdeptidLessThanOrEqualTo(Integer value) {
            addCriterion("fkdeptid <=", value, "fkdeptid");
            return (Criteria) this;
        }

        public Criteria andFkdeptidIn(List<Integer> values) {
            addCriterion("fkdeptid in", values, "fkdeptid");
            return (Criteria) this;
        }

        public Criteria andFkdeptidNotIn(List<Integer> values) {
            addCriterion("fkdeptid not in", values, "fkdeptid");
            return (Criteria) this;
        }

        public Criteria andFkdeptidBetween(Integer value1, Integer value2) {
            addCriterion("fkdeptid between", value1, value2, "fkdeptid");
            return (Criteria) this;
        }

        public Criteria andFkdeptidNotBetween(Integer value1, Integer value2) {
            addCriterion("fkdeptid not between", value1, value2, "fkdeptid");
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