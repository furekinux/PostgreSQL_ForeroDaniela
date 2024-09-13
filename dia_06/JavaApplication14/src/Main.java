import Persistencia.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {

    public static void main(String[] args){
        ConnectToServer cn;
        try {
            cn = new ConnectToServer();
            Statement st;
            ResultSet rs;
            try{
                st = cn.con.createStatement();
                rs=st.executeQuery("select * from concesionario;");
                while (rs.next()) {                
                    System.out.println(rs.getString("nombre"));
                }
            }catch(SQLException e) {
                System.err.println(e);
            }
        } catch (IOException ex) {
            System.err.println(ex);
        }
    }
    
}
