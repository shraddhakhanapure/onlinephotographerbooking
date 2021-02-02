import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Test {
public static void main(String[] args) {
	LocalDate date = LocalDate.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	System.out.println(date.format(formatter));
}
}
