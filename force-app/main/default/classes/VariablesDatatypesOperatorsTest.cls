/**
 * Test class to validate results from VariablesDatatypesOperators
 */
@IsTest
public class VariablesDatatypesOperatorsTest {
    public VariablesDatatypesOperatorsTest() {

    }
    @IsTest
    static void addTwoIntegers_test() {
        Integer result;
        result = VariablesDatatypesOperators.addsTwoIntegers(null, 5);
        Assert.isNull(result, 'Incorrect null addition result');
        result = VariablesDatatypesOperators.addsTwoIntegers(1, 2);
        Assert.areEqual(3, result, 'Incorrect positive addition result');
        result = VariablesDatatypesOperators.addsTwoIntegers(-3, 12);
        Assert.areEqual(9, result, 'Incorrect negative addition result');
        result = VariablesDatatypesOperators.addsTwoIntegers(8, 0);
        Assert.areEqual(8, result, 'Incorrect zero addition result');
        result = VariablesDatatypesOperators.addsTwoIntegers(123456, 98765);
        Assert.areEqual(222221, result, 'Incorrect large value addition result');
    }

    @IsTest
    static void subtractsTwoIntegers_test() {
        Integer result;
        result = VariablesDatatypesOperators.subtractsTwoIntegers(5, null);
        Assert.isNull(result, 'Incorrect null subtraction result');
        result = VariablesDatatypesOperators.subtractsTwoIntegers(5, 10);
        Assert.areEqual(-5, result, 'Incorrect negative subtraction result');
        result = VariablesDatatypesOperators.subtractsTwoIntegers(-3, -8);
        Assert.areEqual(5, result, 'Incorrect negative subtraction result');
        result = VariablesDatatypesOperators.subtractsTwoIntegers(24, 12);
        Assert.areEqual(12, result, 'Incorrect positive subtraction result');
        result = VariablesDatatypesOperators.subtractsTwoIntegers(4, 4);
        Assert.areEqual(0, result, 'Incorrect zero subtraction result');
    }

    @IsTest
    static void multiplysTwoIntegers_test() {
        Integer result;
        result = VariablesDatatypesOperators.multiplysTwoIntegers(10, 0);
        Assert.areEqual(0, result, 'Incorrect zero multiplication result');
        result = VariablesDatatypesOperators.multiplysTwoIntegers(2, 3);
        Assert.areEqual(6, result, 'Incorrect multiplication result');
        result = VariablesDatatypesOperators.multiplysTwoIntegers(2, -4);
        Assert.areEqual(-8, result, 'Incorrect negative multiplication result');
        result = VariablesDatatypesOperators.multiplysTwoIntegers(-7, -4);
        Assert.areEqual(28, result, 'Incorrect negative multiplication result');
    }

    @IsTest
    static void dividesTwoIntegers_test() {
        Integer result;
        result = VariablesDatatypesOperators.dividesTwoIntegers(10, null);
        Assert.isNull(result, 'Should return null if either input is null');
        result = VariablesDatatypesOperators.dividesTwoIntegers(10, 0);
        Assert.isNull(result, 'Should return null if divisor is 0');
        result = VariablesDatatypesOperators.dividesTwoIntegers(10, 2);
        Assert.areEqual(5, result, 'Division on two whole integers with no remainder returned incorrect value');
        result = VariablesDatatypesOperators.dividesTwoIntegers(10, 3);
        Assert.areEqual(3, result, 'Division on two whole integers with a remainder returned incorrect value');
        result = VariablesDatatypesOperators.dividesTwoIntegers(12, -3);
        Assert.areEqual(-4, result, 'Division with negative integers returned incorrect value');
    }

    @IsTest 
    static void isEven_test() {
        Boolean result;
        result = VariablesDatatypesOperators.isEven(null);
        Assert.isNull(result, 'Incorrect boolean evaluation, expected null return');
        result = VariablesDatatypesOperators.isEven(8);
        Assert.isTrue(result, 'Incorrect boolean evaluation, expected even input to be true.');
        result = VariablesDatatypesOperators.isEven(3);
        Assert.isFalse(result, 'Incorrect boolean evaluation, expected negative input to be false.');
        result = VariablesDatatypesOperators.isEven(0);
        Assert.isTrue(result, 'Incorrect boolean evaluation, expected zero to be even.');
        result = VariablesDatatypesOperators.isEven(-2);
        Assert.isTrue(result, 'Incorrect boolean evaluation, expected negative even input to be evaluate.');
    }

    @IsTest 
    static void isPositive_test() {
        Boolean result;
        result = VariablesDatatypesOperators.isPositive(3);
        Assert.isTrue(result, 'Output expected to evaluate to true for positive input');
        result = VariablesDatatypesOperators.isPositive(0);
        Assert.isFalse(result, 'Output expected to evaluate to false for zero input');
        result = VariablesDatatypesOperators.isPositive(-5);
        Assert.isFalse(result, 'Output expected to evaluate to false for negative input');
    }

    @IsTest 
    static void concatenatesStrings_test() {
        String result;
        result = VariablesDatatypesOperators.concatenatesStrings('Hello,', 'World!');
        Assert.isNotNull(result, 'Null return from contatenated strings unexpected');
        result = VariablesDatatypesOperators.concatenatesStrings('Hello,', 'World!');
        Assert.areEqual('Hello,World!', result, 'Unexpected string concatenation of two valid strings');
        result = VariablesDatatypesOperators.concatenatesStrings('Hi!', '');
        Assert.areEqual('Hi!', result, 'Unexpected string concatenation of two valid strings');
    }

    @IsTest 
    static void generatesHashtag_test() {
        String result;
        result = VariablesDatatypesOperators.generatesHashtag(new List<String>{'Salesforce', 'Developer', 'Life'});
        Assert.isNotNull(result, 'Null return unexpected');
        result = VariablesDatatypesOperators.generatesHashtag(new List<String>{'Salesforce', 'Developer', 'Life'});
        Assert.areEqual('#SalesforceDeveloperLife!', result, 'Unexpected output string');
        result = VariablesDatatypesOperators.generatesHashtag(new List<String>{'dev', 'stuff'});
        Assert.areEqual('#DevStuff!', result, 'Unexpected output string');
        result = VariablesDatatypesOperators.generatesHashtag(new List<String>{'dev ', '  ', '  stuff'});
        Assert.areEqual('#DevStuff!', result, 'Unexpected handling of blank inputs');
    }
}