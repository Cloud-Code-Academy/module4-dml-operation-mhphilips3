public static Account upsertAccount(String accountName) {
    // Query for the Account
    List<Account> accounts = [SELECT Id FROM Account WHERE Name = :accountName];
    Account varAccount= new Account(Name=accountName, Description='New Account');   
   
    If(accounts.size()>0){                          // if the Account exists, update the description
        varAccount.Description='Updated Account';
        update accounts;}
        else {
            varAccount.Description='New Account';
            insert varAccount;
        }
    // otherwise, create a new Account and set the description
    Upsert varAccount;
    // Upsert the Account
    return varAccount;
 }