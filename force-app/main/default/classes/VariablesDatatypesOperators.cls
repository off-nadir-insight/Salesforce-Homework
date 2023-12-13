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
    public VariablesDatatypesOperators() {

    }

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
}