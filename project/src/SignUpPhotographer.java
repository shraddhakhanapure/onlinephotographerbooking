
import java.sql.Connection;
import java.sql.PreparedStatement;


public class SignUpPhotographer{

	public static int save(PhotographerPojo pObject){
		int flag=0;
		try {
			Connection con=Dbconnection.getConnection(); //getting the connection method here from dbconnection
			PreparedStatement ps = con.prepareStatement("insert into photographerssignup (FName, Lname, username, Email, password, confirmpass)values(?,?,?,?,?,?);");
			
			ps.setString(1, pObject.getFirst_name());
			ps.setString(2, pObject.getLast_name());			
			ps.setString(3, pObject.getUsername());//sending up the values received from user to the database table
			ps.setString(4, pObject.getEmail());
			ps.setString(5, pObject.getPass());
			ps.setString(6, pObject.getConpass());
			
			flag=ps.executeUpdate(); //value changes if it is executed
			
			con.close();
		} catch (Exception e) {
		System.out.println("cannot able to insert");
		e.printStackTrace();
		}
		return flag;
		
	}
	
}
