/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Lichi
 */
public class Conexion {

   private static Connection con;

    public static Connection getConnection() {
        try {
            if(con!=null)
                return con;
            String myDb = "jdbc:mysql://localhost:3306/almacen";
            con = DriverManager.getConnection(myDb, "root", "");
            return con;
        } catch (SQLException ex) {
            System.out.println(ex);
            //Helper.log(ex.toString(),Conexion.class);
        }
        return null;
    }
    public static boolean closeConnection(){
        if(con!=null){
            try{
                con.close();
                return true;
            }catch(SQLException ex){
                System.out.println("Error:"+ex);
            }
        }
        return false;
    }
}
