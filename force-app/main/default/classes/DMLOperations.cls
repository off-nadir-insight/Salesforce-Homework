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
        Map<String, Account> existingAccountNamesToAccounts = returnsMapOfAccountNamesToAccounts(existingAccounts);
        if (existingAccountNamesToAccounts == null ){
            return insertsAccountsFromListOfNames(accountNames);
        }

        for (String accountName : AccountNames) {
            if (existingAccountNamesToAccounts.containsKey(accountName)) {
                Account existingAccount = existingAccountNamesToAccounts.get(accountName);
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

    private static Map<String, Account> returnsMapOfAccountNamesToAccounts(List<Account> existingAccounts) {
        Map<String, Account> existingAccountNamesToAccounts = new Map<String, Account>();
        if (existingAccounts != null) {
            for (Account acc : existingAccounts) {
                existingAccountNamesToAccounts.put(acc.Name, acc);
            }
        } else {
            System.debug('No existing accounts found for upsert');
            return null;
        }
        return existingAccountNamesToAccounts;
    }

    public static List<Contact> returnsContactsMissingInfo() {
        List<Contact> contactsMissingInfo = [
            SELECT Id, Name, Phone, Email 
            FROM Contact 
            WHERE Phone = NULL OR Email = NULL
        ];

        return contactsMissingInfo;
    }
}