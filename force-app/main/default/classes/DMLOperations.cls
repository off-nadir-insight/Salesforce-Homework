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
        List<Account> accountsToUpsert = new List<Account>();
        List<Account> existingAccounts = [SELECT Id, Name, Description FROM Account WHERE Name IN :accountNames];
        Map<String, Account> mapAccountNamesToAccounts = new Map<String, Account>();
        if (!existingAccounts.isEmpty()) {
            for (Account acc : existingAccounts) {
                mapAccountNamesToAccounts.put(acc.Name, acc);
            }
        } else {
            System.debug('No existing accounts found for upsert');
        }
        for (String accountName : AccountNames) {
            if (mapAccountNamesToAccounts.containsKey(accountName)) {
                Account existingAccount = mapAccountNamesToAccounts.get(accountName);
                existingAccount.Description = updatedDescriptionString;
                accountsToUpsert.add(existingAccount);
            } else {
                Account newAccount = new Account(
                    Name = accountName, 
                    Description = updatedDescriptionString
                );
                accountsToUpsert.add(newAccount);
            }
        }
        Database.upsert(accountsToUpsert);
        return accountsToUpsert;
    }
}