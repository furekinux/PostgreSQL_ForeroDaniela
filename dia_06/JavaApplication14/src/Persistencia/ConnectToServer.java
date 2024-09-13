package Persistencia;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectToServer {
    
    public Connection con;
    
    public ConnectToServer() throws IOException{
        
        Properties props = new Properties();
        
        try(InputStream input = new FileInputStream("src/Config.properties")){
                   
            if(input == null){
                throw new IllegalStateException("Archivo no existente :(");
            }
            
            props.load(input);

            String user = props.getProperty("user");
            String password = props.getProperty("password");
            
            String url = ("jdbc:postgresql://172.16.101.151/campus_cars?user="+user+
                        "&password="+password);
            
            Class.forName("org.postgresql.Driver");
            
            System.out.println("Connected successfully");
            
            con = DriverManager.getConnection(url);

        }
        catch(IOException | SQLException ex){
            
            System.err.println(ex);;
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectToServer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
