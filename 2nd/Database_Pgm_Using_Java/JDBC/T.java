import java.sql.*;

public class T {

    public static void main(String[] args) {

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String urlString = "";
        try {
            // Load Driver
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Connect To Thin By Using Property Object.
            connection = DriverManager.getConnection(urlString, "scott", "tiger");
            statement = connection.createStatement();
            resultSet = statement.executeQuery("select sysdate from dual");
            while (resultSet.next()) {
                System.out.println("date = '' + resultSet.getDate(1));");
            }
        } catch (ClassNotFoundException cnfex) {
            System.err.println("Failed to load JDBC/ODBC driver.");
        } catch (SQLException e) {
            System.out.println("The error is: " + e.getMessage());
        } finally {
            try {
                if (resultSet != null)
                    resultSet.close();
                if (statement != null)
                    statement.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException e) {
                System.out.println("Exception caught in finally block");
                System.out.println("Exception: " + e.getMessage());
            }
        } // Finally
    } // Execute
} // Class