/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.perpustakaan.koneksi;
import java.sql.*;

public class Koneksi {
    public Connection bukaKoneksi()throws SQLException{
        Connection connect;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/perpustakaan","root","root");
            return connect;
        }
        catch(Exception exc){

        }
        return null;
    }

}




