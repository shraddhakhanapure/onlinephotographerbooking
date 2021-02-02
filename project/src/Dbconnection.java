import java.sql.Connection;
import java.sql.DriverManager;

public class Dbconnection {

	public static Connection getConnection(){ //making a static connection,shares to all classes
		Connection con=null; // creating connection
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/photographer","root","root");
						
		} catch (Exception e) {
			//throws an error if at all its unable to create an connection
			System.out.println("unable to connect to the database");
		}
		return con; // we return the connection and we can get the connection wherever needed.
	}
	
}
