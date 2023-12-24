@IsTest 
public with sharing class DMLOperationsTest {
    @TestSetup
    static void setup(){
        List<Account> testAccountsToInsert = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            Account newAccount = new Account(Name = 'TestAccount' + i); 
            testAccountsToInsert.add(newAccount);
        }
        insert testAccountsToInsert;
    }

    @IsTest 
    public static void insertsAccountsFromListOfNames_test() {
        List<String> accountNames = new List<String> {
            'AccountName1',
            'AccountName2',
            'AccountName3'
        };

        Integer countOfAccountsBeforeTest = [SELECT COUNT() FROM Account];
        Test.startTest();
        List<Account> accountsToVerify = DMLOperations.insertsAccountsFromListOfNames(accountNames);
        Test.stopTest();

        Integer countOfAccountsAfterTest = [SELECT COUNT() FROM Account];
        Assert.areEqual(accountNames.size(), countOfAccountsAfterTest - countOfAccountsBeforeTest, 'Count of created accounts not matching');
        for (Account acc : accountsToVerify) {
            Assert.isNotNull(acc.Id, 'Id not generated from list of names');
        }
    }

    @IsTest 
    public static void updatesAccountsFromListOfNames_test() {
        List<String> accountNamesToUpdate = new List<String>{
            'TestAccount0', 
            'TestAccount1', 
            'TestAccount2',
            'TestAccount10'
        };
        String updatedDescriptionString = 'This is an updated description';

        Test.startTest();
        List<Account> accountsToVerify = DMLOperations.updatesAccountsFromListOfNames(accountNamesToUpdate, updatedDescriptionString);
        Test.stopTest();

        for (Account accountToVerify : accountsToVerify) {
            Assert.isNotNull(accountToVerify.Description, 'Expected a description to be not-null');
            Assert.areEqual(updatedDescriptionString, accountToVerify.Description, 'Description doesn\'t match expected message');
        }
        Assert.areEqual(0, [SELECT Id, Name FROM Account WHERE Name = 'TestAccount10' LIMIT 1].size(), 'Non-existant account shouldn\'t be inserted');
    }

    @IsTest 
    public static void upsertsAccountDescriptionsFromListOfAccountNames_test() {
        
    }
    // @IsTest 
    // public static void upsertAccountsWithContacts_test() {
    //     // insert pre-existing accounts
    //     Account acc = new Account(Name = 'Test Account 4', Website='www.testaccount4.com');
    //     Account acc = new Account(Name = 'Test Account 5', Website='www.wrongAddress.com');
    //     insert acc;

    //     // create lists for feeding into test method
    //     List<Contact> contactsToUpsert = new List<Contact> {
    //         new Contact(LastName = 'Test Contact 5', Email='testContact5@testAccount5.com', AccountId = acc.Id),
    //         new Contact(LastName = 'Test Contact 2', Email='testContact2@testAccount2.com'),
    //         new Contact(LastName = 'Test Contact 3', Email='testContact3@testAccount3.com'),
    //         new Contact(LastName = 'Test Contact 4', Email='testContact4@testAccount4.com')
    //     };

    //     Map<String, String> accountNamesToWebsiteMap = new Map<String, String> {
    //         'Test Account 1' => 'www.testaccount1.com',
    //         'Test Account 2' => 'www.testaccount2.com',
    //         'Test Account 3' => 'www.testaccount3.com',
    //         'Test Account 4' => 'www.testaccount4.com',
    //         'Test Account 5' => 'www.testaccount5.com'
    //     };

    //     // call the test method
    //     Test.startTest();
    //     DMLOperations.upsertAccountsWithContacts(contactsToUpsert, accountNamesToWebsiteMap);
    //     Test.stopTest();
    //     accountNamesToWebsiteMap.put(acc.Name, acc.Website);

    //     // requery objects from database
    //     List<Contact> retrievedContacts = [
    //         SELECT Id, LastName, Account.Name
    //         FROM Contact 
    //         WHERE LastName IN (
    //             'Test Contact 1', 'Test Contact 2', 'Test Contact 3', 'Test Contact 4'
    //         )
    //     ];
    //     List<Account> retrievedAccounts = [SELECT Id, Name FROM Account WHERE Name IN :accountNames];

    //     // assert objects have been created
    //     Assert.areEqual(accountNames.size(), retrievedAccounts.size(), 'All Accounts should have been upserted');
    //     Assert.areEqual(contactsToUpsert.size(), retrievedContacts.size(), 'All Contacts should have been upserted');

    //     // assert relationships between contacts & accounts have been made
    //     for (Contact cont : retrievedContacts) {
    //         Assert.areEqual(cont.Account.Name, contact.LastName.replace('Test Contact ', 'Test Account '), 'Contact should be linked to its Account');
    //     }
    // }
}