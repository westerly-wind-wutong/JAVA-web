package com.javabean;

public class Calculator2 {
    private double value1;
    private double value2;
    private double result;
    private String operatorchar;

    public double getValue1() {
        return value1;
    }

    public void setValue1(double value1) {
        this.value1 = value1;
    }

    public double getValue2() {
        return value2;
    }

    public void setValue2(double value2) {
        this.value2 = value2;
    }

    public double getResult() {
        return result;
    }

    public void setResult(double result) {
        this.result = result;
    }

    public String getOperatorchar() {
        return operatorchar;
    }

    public void setOperatorchar(String operatorchar) {
        this.operatorchar = operatorchar;
    }

    public double calcuate(){
        if("+".equals(this.getOperatorchar())){
            result = this.getValue1()+this.getValue2();
        }
        if("-".equals(this.getOperatorchar())){
            result = this.getValue1()-this.getValue2();
        }
        if("*".equals(this.getOperatorchar())){
            result = this.getValue1()*this.getValue2();
        }
        if("/".equals(this.getOperatorchar())){
            result = this.getValue1()/this.getValue2();
        }
        return result;
    }
}
