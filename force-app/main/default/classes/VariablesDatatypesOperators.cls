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
    public static Integer addsTwoIntegers(Integer a, Integer b) {
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
     * @return difference of two integers
     */
    public static Integer subtractsTwoIntegers(Integer a, Integer b) {
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
     * @return Integer product of two values
     */
    public static Integer multiplysTwoIntegers(Integer a, Integer b) {
        return a * b;
    }

    /**
     * Performs division of two Integer values, acknowleging the Apex handling of 
     * Integer division
     * Ex. division(10, 2) should return 5
     * @param a Decimal dividend
     * @param b Decimal divisor
     * @return Integer quotient of two input integers
     */
    public static Integer dividesTwoIntegers(Integer a, integer b) {
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
     * @return Boolean evaluation
     */
    public static Boolean isEven(Integer num) {
        if (num == null) {
            return null;
        } else {
            return Math.mod(num, 2) == 0;
        }
    }

    /**
     * Returns boolean evaluating whether or not an Integer value is positive
     * Ex. isPositive(3) should return true
     * @param num Integer value to check if positive
     * @return Boolean evaluation
     */
    public static Boolean isPositive(Integer num) {
        return num > 0;
    }

    /**
     * Returns the concatenated version of two input strings
     * Ex. concatenateStrings('Hello,','World!') should return 'Hello,World!'
     * @param a String value
     * @param b String value to append to parameter 'a'
     * @return String of combined inputs
     */
    public static String concatenatesStrings(String a, String b) {
        return a + b;
    }

    /**
     * Return string 'formatted' as a hashtag from a list of strings
     * Ex. hashtagGenerator(List<String>{'hello', 'world'}) returns
     * '#helloworld'
     * @param inputList List<String> for formatting
     * @return String suitable for hashtag usage
     */
    public static String generatesHashtag(List<String> words) {
        final String PREFIX = '#';
        final String SUFFIX = '!';
        String hashtagPhrase = '';
        for (String word : words) {
            word = word.deleteWhitespace();
            word = word.capitalize();
            hashtagPhrase += word;
        }
        return PREFIX + hashtagPhrase + SUFFIX;
    }

    /**
     * Check if inpute date is in the past
     * Ex. isPastDate(Date.newInstance(2019, 1, 1)) should return true from 2023
     * @param dateToCheck Date to test if in the past
     * @return Boolean for past-ness of date
     */
    public static Boolean isPastDate(Date dateToCheck) {
        if (dateToCheck == null) {
            return null;
        }
        return (dateToCheck < Date.today());
    }

    /**
     * Check if date is today or in the future
     * Ex isDateTodayOrInFuture(Date.newInstance(2100, 1, 1)) should return true
     * as of 2023
     * @param dateToCheck Date to test if takes place today or in future
     * @return Boolean 
     */
    public static Boolean isDateTodayOrInFuture(Date dateToCheck) {
        return dateToCheck >= Date.today();
    }

    /**
     * Convert a number of minutes into milliseconds
     * Ex. convertsMinutesToMilliseconds(3) should return 180000
     * @param minutes Integer value to convert
     * @return number of equivalent milliseconds as an integer
     */
    public static Integer convertsMinutesToMilliseconds(Integer minutes) {
        final Integer MS_PER_MIN = 60000;
        return minutes * MS_PER_MIN;
    }
}