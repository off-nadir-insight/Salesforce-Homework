public with sharing class DMLOperations {
    public static List<Account> insertsAccountsFromListOfNames(List<String> accountNames) {
        List<Account> accountsToInsert = new List<Account>();
        for (String accountName : accountNames) {
            Account newAccount = new Account(Name=accountName);
            accountsToInsert.add(newAccount);
        }
        insert accountsToInsert;
        return accountsToInsert;
    }

    public static List<Account> updatesAccountsFromListOfNames(List<String> accountNames, String updatedDescriptionString) {
        List<Account> accountsToUpdate = [SELECT Id, Name FROM Account WHERE Name IN :accountNames];
        for (Account acct : accountsToUpdate) {
            acct.Description = updatedDescriptionString;
        }
        update accountsToUpdate;
        return accountsToUpdate;
    }

    public static List<Account> upsertsAccountDescriptionsFromListOfAccountNames(List<String> accountNames, String updatedDescriptionString) {
        return null;
    }
}