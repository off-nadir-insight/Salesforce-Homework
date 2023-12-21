/**
 * Introduction to basic elements of Apex programming
 * - Apex data types
 * - Variable declaration & use in Apex
 * - Operator usage commonly encountered
 * 
 * @author Tyler Scott
 * @version 1.0
 * 
 * Derived from homework sets provided by https://www.cloudcodeacademy.com
 */

public with sharing class VariablesDatatypesOperators {

    /**
     * Perform addition of two integer values
     * Should either value be null, return null
     * Ex. addition(1, 2) should return 3
     * Ex. addition(1, null) should return null
     * @param a first integer
     * @param b second integer
     * @return sum of the two integers
     */
    public static Integer addition(Integer a, Integer b) {
        if (a == null || b == null) {
            return null;
        } else {
            return a + b;
        }
    }

    /**
     * Performs subtraction of two integer values
     * Should either value be null, return null
     * Ex. subtraction(5, 2) should return 3
     * @param a minuend integer
     * @param b subtrahend integer
     */
    public static Integer subtraction(Integer a, Integer b) {
        if (a == null || b == null) {
            return null;
        } else {
            return a - b;
        }
    }

    /**
     * Performs multiplication of two Integer values
     * Ex. multiplication(4, 5) should return 20
     * @param a Integer multiplicand 
     * @param b Integer multiplier
     */
    public static Integer multiplication(Integer a, Integer b) {
        return a * b;
    }

    /**
     * Performs division of two Integer values, acknowleging the Apex handling of 
     * Integer division
     * Ex. division(10, 2) should return 5
     * @param a Decimal dividend
     * @param b Decimal divisor
     */
    public static Integer integerDivision(Integer a, integer b) {
        if (a == null || b == null) {
            return null;
        } else if (b == 0) {
            return null;
        } else {
            return a / b;
        }
    }

    /**
     * Evaluates if the input Integer is even
     * Ex. isEven(6) should return true
     * @param num Integer value to evaluate if even
     */
    public static Boolean isEven(Integer num) {
        if (num == null) {
            return null;
        } else {
            return Math.mod(num, 2) == 0;
        }
    }
}