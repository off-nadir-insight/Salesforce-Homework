public with sharing class DMLOperations {
    public static void insertsAccountsFromListOfNames(List<String> accountNames) {
        List<Account> accountsToInsert = new List<Account>();
        for (String accountName : accountNames) {
            Account newAccount = new Account(Name=accountName);
            accountsToInsert.add(newAccount);
        }
        insert accountsToInsert;
    }
}