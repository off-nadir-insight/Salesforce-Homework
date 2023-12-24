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
        List<Account> accountsToInsert = new List<Account>();
        List<Account> accountsToUpdate = new List<Account>();
        // check if account name exists
            // create a list of accounts that do exist
                // query for accounts in list of names -> list of accounts
                // create map<String accountName, Account account> existingAccounts
                // for each name in the list of account names
                    // if the name is in the .keyset
                        // .get(accountName) to assign the account
                        // update the description
                        // add to list of accounts to upsert
                    // if the name isn't in the .keyset
                        // create new account from name
                        // assign description
                        // add to list to upsert
                // upsert accounts
    }
}