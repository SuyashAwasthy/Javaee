package com.techlabs.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import com.techlabs.model.Account;
import com.techlabs.model.Customer;
import com.techlabs.model.Transaction;

public class BankApplicationDbUtil {
    private DataSource dataSource;

    public BankApplicationDbUtil(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public boolean validateUser(String username, String password) throws SQLException {
        if (username == null || !username.matches("\\d+")) {
            return false;
        }

        int customerUserId = Integer.parseInt(username);

        String selectQuery = "select * from customers where customer_id=? and password=?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {

            preparedStatement.setInt(1, customerUserId);
            preparedStatement.setString(2, password);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next(); // true if a row with matching username and password exists
            }
        }
    }

    public void insertCustomer(Customer customer) throws SQLException {
        String insertQuery = "insert into customers(first_name, last_name, email_id, password) values (?, ?, ?, ?)";
        String selectQuery = "select customer_id from customers where first_name=? and last_name=? and email_id=? and password=?";
        String insertAccountQuery = "insert into accounts(customer_id) values (?)";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement insertStatement = connection.prepareStatement(insertQuery);
             PreparedStatement selectStatement = connection.prepareStatement(selectQuery);
             PreparedStatement insertAccountStatement = connection.prepareStatement(insertAccountQuery)) {

            insertStatement.setString(1, customer.getFirst_name());
            insertStatement.setString(2, customer.getLast_name());
            insertStatement.setString(3, customer.getEmail());
            insertStatement.setString(4, customer.getPassword());
            insertStatement.executeUpdate();

            selectStatement.setString(1, customer.getFirst_name());
            selectStatement.setString(2, customer.getLast_name());
            selectStatement.setString(3, customer.getEmail());
            selectStatement.setString(4, customer.getPassword());

            try (ResultSet resultSet = selectStatement.executeQuery()) {
                if (resultSet.next()) {
                    int customerId = resultSet.getInt("customer_id");
                    insertAccountStatement.setInt(1, customerId);
                    insertAccountStatement.executeUpdate();
                }
            }
        }
    }

    public Map<Customer, Account> getCustomers() throws SQLException {
        Map<Customer, Account> customers = new HashMap<>();

        String selectQuery = "select * from customers c join accounts a on c.customer_id=a.customer_id";
        try (Connection connection = dataSource.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(selectQuery)) {

            while (resultSet.next()) {
                String fname = resultSet.getString("first_name");
                String lname = resultSet.getString("last_name");
                int accountNo = resultSet.getInt("account_number");
                double balance = resultSet.getDouble("balance");

                Customer customer = new Customer(fname, lname);
                Account account = new Account(accountNo, balance);
                customers.put(customer, account);
            }
        }
        return customers;
    }

    public List<Transaction> getTransactions() throws SQLException {
        List<Transaction> transactions = new ArrayList<>();

        String selectQuery = "select * from transactions";
        try (Connection connection = dataSource.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(selectQuery)) {

            while (resultSet.next()) {
                int sender = resultSet.getInt("sender_account_number");
                int receiver = resultSet.getInt("receiver_account_number");
                String date = resultSet.getString("date_of_transaction");
                String type = resultSet.getString("transaction_type");
                double amount = resultSet.getDouble("transaction_amount");

                Transaction transaction = new Transaction(sender, receiver, date, type, amount);
                transactions.add(transaction);
            }
        }
        return transactions;
    }

    public Map<Customer, Account> getCustomersByAccountNumber(int searchValue) throws SQLException {
        Map<Customer, Account> customers = new HashMap<>();

        String selectQuery = "select * from customers c join accounts a on c.customer_id=a.customer_id where a.account_number=?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {

            preparedStatement.setInt(1, searchValue);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    String fname = resultSet.getString("first_name");
                    String lname = resultSet.getString("last_name");
                    int accountNo = resultSet.getInt("account_number");
                    double balance = resultSet.getDouble("balance");

                    Customer customer = new Customer(fname, lname);
                    Account account = new Account(accountNo, balance);
                    customers.put(customer, account);
                }
            }
        }
        return customers;
    }

    public Map<Customer, Account> getCustomersByName(String parameter) throws SQLException {
        Map<Customer, Account> customers = new HashMap<>();

        String selectQuery = "select * from customers c join accounts a on c.customer_id=a.customer_id where concat(c.first_name, c.last_name) like ?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {

            preparedStatement.setString(1, "%" + parameter + "%");
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    String fname = resultSet.getString("first_name");
                    String lname = resultSet.getString("last_name");
                    int accountNo = resultSet.getInt("account_number");
                    double balance = resultSet.getDouble("balance");

                    Customer customer = new Customer(fname, lname);
                    Account account = new Account(accountNo, balance);
                    customers.put(customer, account);
                }
            }
        }
        return customers;
    }

    public List<Transaction> getTransactionBySenderAccountNumber(int searchValue) throws SQLException {
        List<Transaction> transactions = new ArrayList<>();

        String selectQuery = "select * from transactions where sender_account_number=?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {

            preparedStatement.setInt(1, searchValue);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int sender = resultSet.getInt("sender_account_number");
                    int receiver = resultSet.getInt("receiver_account_number");
                    String date = resultSet.getString("date_of_transaction");
                    String type = resultSet.getString("transaction_type");
                    double amount = resultSet.getDouble("transaction_amount");

                    Transaction transaction = new Transaction(sender, receiver, date, type, amount);
                    transactions.add(transaction);
                }
            }
        }
        return transactions;
    }

    public List<Transaction> getTransactionByReceiverAccountNumber(int searchValue) throws SQLException {
        List<Transaction> transactions = new ArrayList<>();

        String selectQuery = "select * from transactions where receiver_account_number=?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {

            preparedStatement.setInt(1, searchValue);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int sender = resultSet.getInt("sender_account_number");
                    int receiver = resultSet.getInt("receiver_account_number");
                    String date = resultSet.getString("date_of_transaction");
                    String type = resultSet.getString("transaction_type");
                    double amount = resultSet.getDouble("transaction_amount");

                    Transaction transaction = new Transaction(sender, receiver, date, type, amount);
                    transactions.add(transaction);
                }
            }
        }
        return transactions;
    }

    public String getUsername(int customerId) throws SQLException {
        String selectQuery = "select first_name, last_name from customers where customer_id=?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {

            preparedStatement.setInt(1, customerId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String fname = resultSet.getString("first_name");
                    String lname = resultSet.getString("last_name");
                    return fname + " " + lname;
                }
            }
        }
        return null;
    }

    public List<Transaction> getPassbook(int customerId) throws SQLException {
        List<Transaction> transactions = new ArrayList<>();

        String accountNumberQuery = "select account_number from accounts where customer_id=?";
        String selectQuery = "select * from transactions where sender_account_number=? or receiver_account_number=?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement prepareStatement2 = connection.prepareStatement(accountNumberQuery);
             PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {

            prepareStatement2.setInt(1, customerId);
            try (ResultSet executeQuery2 = prepareStatement2.executeQuery()) {
                if (executeQuery2.next()) {
                    int accountNumber = executeQuery2.getInt("account_number");

                    preparedStatement.setInt(1, accountNumber);
                    preparedStatement.setInt(2, accountNumber);
                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        while (resultSet.next()) {
                            int sender = resultSet.getInt("sender_account_number");
                            int receiver = resultSet.getInt("receiver_account_number");
                            String type = (sender == accountNumber) ? "Debit" : "Credit";
                            String date = resultSet.getString("date_of_transaction");
                            double amount = resultSet.getDouble("transaction_amount");

                            Transaction transaction = new Transaction(sender, receiver, date, type, amount);
                            transactions.add(transaction);
                        }
                    }
                }
            }
        }
        return transactions;
    }

    public boolean newTransaction(int customerId, int receiverAccountNumber, double amount) throws SQLException {
        String query1 = "select account_number, balance from accounts where customer_id=?";
        String query2 = "select balance from accounts where account_number=?";
        String updateReceiverQuery = "update accounts set balance = ? where account_number = ?";
        String updateSenderQuery = "update accounts set balance = ? where account_number = ?";
        String insertTransactionQuery = "insert into transactions (sender_account_number, receiver_account_number, transaction_type, transaction_amount) values (?, ?, ?, ?)";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement prepareStatement1 = connection.prepareStatement(query1);
             PreparedStatement prepareStatement2 = connection.prepareStatement(query2);
             PreparedStatement preparedStatement3 = connection.prepareStatement(updateReceiverQuery);
             PreparedStatement preparedStatement4 = connection.prepareStatement(updateSenderQuery);
             PreparedStatement preparedStatement5 = connection.prepareStatement(insertTransactionQuery)) {

            prepareStatement1.setInt(1, customerId);
            try (ResultSet resultSet1 = prepareStatement1.executeQuery()) {
                if (resultSet1.next()) {
                    int accountNumber = resultSet1.getInt("account_number");
                    double senderBalance = resultSet1.getDouble("balance");

                    prepareStatement2.setInt(1, receiverAccountNumber);
                    try (ResultSet resultSet2 = prepareStatement2.executeQuery()) {
                        if (resultSet2.next()) {
                            double receiverBalance = resultSet2.getDouble("balance");

                            if (amount <= senderBalance) {
                                preparedStatement3.setDouble(1, receiverBalance + amount);
                                preparedStatement3.setInt(2, receiverAccountNumber);
                                preparedStatement3.executeUpdate();

                                preparedStatement4.setDouble(1, senderBalance - amount);
                                preparedStatement4.setInt(2, accountNumber);
                                preparedStatement4.executeUpdate();

                                preparedStatement5.setInt(1, accountNumber);
                                preparedStatement5.setInt(2, receiverAccountNumber);
                                preparedStatement5.setString(3, "Transfer");
                                preparedStatement5.setDouble(4, amount);
                                preparedStatement5.executeUpdate();

                                return true;
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    public int getAccountNumber(int customerId) throws SQLException {
        String selectQuery = "select account_number from accounts where customer_id=?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {

            preparedStatement.setInt(1, customerId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("account_number");
                }
            }
        }
        return 0;
    }

    public Customer getAccountDetails(int customerId) throws SQLException {
        String selectQuery = "select * from customers where customer_id=?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {

            preparedStatement.setInt(1, customerId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String fname = resultSet.getString("first_name");
                    String lname = resultSet.getString("last_name");
                    String email = resultSet.getString("email_id");
                    String password = resultSet.getString("password");

                    return new Customer(fname, lname, email, password);
                }
            }
        }
        return null;
    }

    public void updateDetails(Customer customer) throws SQLException {
        String updateQuery = "update customers set first_name=?, last_name=?, email_id=?, password=? where customer_id=?";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {

            preparedStatement.setString(1, customer.getFirst_name());
            preparedStatement.setString(2, customer.getLast_name());
            preparedStatement.setString(3, customer.getEmail());
            preparedStatement.setString(4, customer.getPassword());
            preparedStatement.setInt(5, customer.getCustomer_id());

            preparedStatement.executeUpdate();
        }
    }

    public List<Transaction> getPassbookBySenderAccountNumber(int searchValue, int customerId) throws SQLException {
        List<Transaction> transactions = new ArrayList<>();
        List<Transaction> passbook = getPassbook(customerId);

        for (Transaction transaction : passbook) {
            if (transaction.getSender_account_number() == searchValue) {
                transactions.add(transaction);
            }
        }
        return transactions;
    }

    public List<Transaction> getPassbookByReceiverAccountNumber(int searchValue, int customerId) throws SQLException {
        List<Transaction> transactions = new ArrayList<>();
        List<Transaction> passbook = getPassbook(customerId);

        for (Transaction transaction : passbook) {
            if (transaction.getReceiver_account_number() == searchValue) {
                transactions.add(transaction);
            }
        }
        return transactions;
    }
}
