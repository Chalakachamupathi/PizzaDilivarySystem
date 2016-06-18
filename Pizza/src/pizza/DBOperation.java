
package pizza;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.*;
import javax.swing.JOptionPane;

public class DBOperation {
    
   private Connection con=null;
   private PreparedStatement pst=null;
   private ResultSet rs=null;
    
   private final String url ="jdbc:mysql://localhost:3306/pizza";
   private final String user="root";
   private final String password="";
   
   public boolean addCustomer(Customer customer){
       try{
            con=(Connection)DriverManager.getConnection(url,user,password);
            pst=(PreparedStatement)con.prepareStatement ("INSERT INTO pizza.customer VALUES(?,?,?,?,?)");
            pst.setString   (1,customer.getTitle());
            pst.setString   (2,customer.getName());
            pst.setInt      (3,customer.getCallingNumber());
            pst.setInt      (4,customer.getRegulerPhoneNumber());
            pst.setString   (5,customer.getBadge());
            
            pst.executeUpdate();
            
            }catch(Exception e){
                System.out.println(e);
                return false;
            }finally{
                    try {
                        con.close();
                    } catch (SQLException ex) {
                        System.out.println("unable to close connection");
                    }
            }
            try{
                    con=(Connection)DriverManager.getConnection(url,user,password);
                    pst=(PreparedStatement)con.prepareStatement ("INSERT INTO pizza.address VALUES(?,?,?,?,?)");
                    pst.setInt      (1,customer.getRegulerPhoneNumber());
                    pst.setString   (2,customer.getStreet());
                    pst.setString   (3,customer.getCrossroad());
                    pst.setString   (4,customer.getBlockOrHouseNumber());
                    pst.setString   (5,customer.getLandmark());
                    
                    pst.executeUpdate();
           }catch(Exception e){
           System.out.println(e);
           return false;
            }finally{
                    try {
                        con.close();
                    } catch (SQLException ex) {
                        System.out.println("unable to close connection");
                    }
            }
 
       return true;
   }
   
   public Customer loadCustomer(Customer customer ,int number){
       int count=0;
       try{
       con=(Connection)DriverManager.getConnection(url,user,password);
       pst=(PreparedStatement)con.prepareStatement ("SELECT * FROM  pizza.customer WHERE Regular_Phone_No=?");
       pst.setInt (1,number);
       
       rs=pst.executeQuery();
       
       while(true){
            if(rs.next()){
                customer.setTitle              (rs.getString(1));
                customer.setName               (rs.getString(2));
                customer.setCallingNumber      (rs.getInt(3));
                customer.setRegulerPhoneNumber (rs.getInt(4));
                customer.setBadge              (rs.getString(5));
                count++;
           }else{
                if(count==0){
                    //JOptionPane.showMessageDialog(null, "NO Record on this number !!");
                    customer.setCallingNumber      (number);
                }
                break;
           }
       }
       }catch(Exception e){
           System.out.println(e);
           JOptionPane.showMessageDialog(null, "Unable to connect!!");
           return null;
       }finally{
                    try {
                        con.close();
                    } catch (SQLException ex) {
                        System.out.println("unable to close connection");
                    }
            }
       try{
            con=(Connection)DriverManager.getConnection(url,user,password);
            pst=(PreparedStatement)con.prepareStatement ("SELECT * FROM  pizza.address WHERE Regular_Phone_No=?");
            pst.setInt (1,number);
            rs=pst.executeQuery();

            while(rs.next()){

                     customer.setStreet             (rs.getString(2));
                     customer.setCrossroad          (rs.getString(3));
                     customer.setBlockOrHouseNumber (rs.getString(4));
                     customer.setLandmark           (rs.getString(5));                   
            }
            return customer;
       }catch(Exception e){
           System.out.println(e);
           JOptionPane.showMessageDialog(null, "Unable to connect!!");
           return null;
       }finally{
                    try {
                        con.close();
                    } catch (SQLException ex) {
                        System.out.println("unable to close connection");
                    }
            }
   }
   
   public boolean updateCustomer(Customer customer){
        try{
            con=(Connection)DriverManager.getConnection(url,user,password);
            pst=(PreparedStatement)con.prepareStatement ("REPLACE INTO pizza.customer VALUES(?,?,?,?,?)");
            pst.setString   (1,customer.getTitle());
            pst.setString   (2,customer.getName());
            pst.setInt      (3,customer.getCallingNumber());
            pst.setInt      (4,customer.getRegulerPhoneNumber());
            pst.setString   (5,customer.getBadge());
            
            pst.executeUpdate();

            }catch(Exception e){
                    System.out.println(e);
            }finally{
                    try {
                        con.close();
                    } catch (SQLException ex) {
                        System.out.println("unable to close connection");
                    }
            }
            try{
                    con=(Connection)DriverManager.getConnection(url,user,password);
                    pst=(PreparedStatement)con.prepareStatement ("REPLACE INTO pizza.address VALUES(?,?,?,?,?)");
                    pst.setInt      (1,customer.getRegulerPhoneNumber());
                    pst.setString   (2,customer.getStreet());
                    pst.setString   (3,customer.getCrossroad());
                    pst.setString   (4,customer.getBlockOrHouseNumber());
                    pst.setString   (5,customer.getLandmark());

                    pst.executeUpdate();
            }catch(Exception e){
                    System.out.println(e);
                    return false;
            }finally{
                    try {
                        con.close();
                    } catch (SQLException ex) {
                        System.out.println("unable to close connection");
                    }
            }
       
            
      
       return true;
   
   }
   
   public void loadPastOrders(Order or,Customer customer){
         try{
            con=(Connection)DriverManager.getConnection(url,user,password);
            pst=(PreparedStatement)con.prepareStatement ("SELECT * FROM pizza.orders WHERE regular_phone_no=?");
            pst.setInt      (1,customer.getRegulerPhoneNumber());
            rs=pst.executeQuery();
            
             while(rs.next()){
                 
                                   
            }
            
        }catch(Exception e){

         }
   }
}
