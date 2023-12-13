/**
 * Test class to validate results from VariablesDatatypesOperators
 */
@IsTest
public class VariablesDatatypesOperatorsTest {
    public VariablesDatatypesOperatorsTest() {

    }
    @IsTest
    static void testAddition() {
        Integer result;
        result = VariablesDatatypesOperators.addition(null, 5);
        Assert.isNull(result, 'Incorrect null addition result');
        result = VariablesDatatypesOperators.addition(1, 2);
        Assert.areEqual(3, result, 'Incorrect positive addition result');
        result = VariablesDatatypesOperators.addition(-3, 12);
        Assert.areEqual(9, result, 'Incorrect negative addition result');
        result = VariablesDatatypesOperators.addition(8, 0);
        Assert.areEqual(8, result, 'Incorrect zero addition result');
        result = VariablesDatatypesOperators.addition(123456, 98765);
        Assert.areEqual(222221, result, 'Incorrect large value addition result');
    }

    @IsTest
    static void testSubtraction() {
        Integer result;
        result = VariablesDatatypesOperators.subtraction(5, null);
        Assert.isNull(result, 'Incorrect null subtraction result');
        result = VariablesDatatypesOperators.subtraction(5, 10);
        Assert.areEqual(-5, result, 'Incorrect negative subtraction result');
        result = VariablesDatatypesOperators.subtraction(-3, -8);
        Assert.areEqual(5, result, 'Incorrect negative subtraction result');
        result = VariablesDatatypesOperators.subtraction(24, 12);
        Assert.areEqual(12, result, 'Incorrect positive subtraction result');
        result = VariablesDatatypesOperators.subtraction(4, 4);
        Assert.areEqual(0, result, 'Incorrect zero subtraction result');
    }

    @IsTest
    static void testMultiplication() {
        
    }
}