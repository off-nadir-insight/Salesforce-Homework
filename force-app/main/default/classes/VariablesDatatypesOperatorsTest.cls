/**
 * Test class to validate results from VariablesDatatypesOperators
 */
@IsTest
public class VariablesDatatypesOperatorsTest {
    public VariablesDatatypesOperatorsTest() {

    }
    @IsTest
    static void testAddition() {
        Integer result = VariablesDatatypesOperators.addition(1, 2);
        Assert.areEqual(3, result, 'Incorrect positive addition result');
        result = VariablesDatatypesOperators.addition(-3, 12);
        Assert.areEqual(9, result, 'Incorrect negative addition result');
        result = VariablesDatatypesOperators.addition(8, 0);
        Assert.areEqual(8, result, 'Incorrect zero addition result');
        result = VariablesDatatypesOperators.addition(123456, 98765);
        Assert.areEqual(222221, result, 'Incorrect large value addition result');
    }
}