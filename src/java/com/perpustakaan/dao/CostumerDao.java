package com.perpustakaan.dao;
import com.perpustakaan.javabeans.Costumer;
import com.perpustakaan.koneksi.Koneksi;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author USER
 */
public class CostumerDao {
    public void simpan(Costumer costumer) throws SQLException{      
        try{
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
          String query = "INSERT INTO costumer"
                        + "(kode_costumer, no_ktp, nama, no_telp, ttl, alamat, umur) "
                        + "VALUES('" + costumer.getKode_costumer()+ "','" + costumer.getNo_ktp()+ "','" 
                        + costumer.getNama()+ "','" + costumer.getNo_telp()+ "','" 
                        + costumer.getTtl()+ "','" + costumer.getAlamat()+ "','" + costumer.getUmur() + "')";
          System.out.println(query);
          stm.executeUpdate(query);
          conn.close();
          stm.close();
        }catch(Exception e){
            e.printStackTrace();
        }      
    }
     
   public void ubah(Costumer costumer) throws SQLException{ 
        try{
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();         
          String query = "UPDATE costumer SET no_ktp='" + costumer.getNo_ktp() + "' , nama='" + costumer.getNama() + "' , no_telp='" + costumer.getNo_telp() + "' , ttl='" + costumer.getTtl() + "' , alamat='" + costumer.getAlamat() + "' , umur='" + costumer.getUmur() + "' WHERE kode_costumer='"+costumer.getKode_costumer()+"'";
          System.out.println(query);             
          stm.executeUpdate(query);
          conn.close();
          stm.close();
        }catch(Exception e){
            e.printStackTrace();
        }     
  }

   
     public void hapus(Costumer costumer) throws SQLException{
        try{
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
          String query = "DELETE FROM costumer WHERE kode_costumer='" + costumer.getKode_costumer() + "'";
          System.out.println(query); 
          stm.executeUpdate(query);
          conn.close();
          stm.close();
        }catch(Exception e){
            e.printStackTrace();
        } 
    }
     
    public Costumer cari(String kode_costumer) throws SQLException{
        Costumer costumer = null;
        Koneksi obj = new Koneksi();
        Connection conn = obj.bukaKoneksi();
        Statement stm = conn.createStatement(); 
        try{
          String query = "SELECT * FROM costumer WHERE kode_costumer='"+kode_costumer+"'";
          System.out.println(query);
          ResultSet rs = stm.executeQuery(query);         
          if(rs.next()){
              costumer = new Costumer();
              costumer.setKode_costumer(rs.getString("kode_costumer"));
              costumer.setNo_ktp(rs.getString("no_ktp"));
              costumer.setNama(rs.getString("nama"));
              costumer.setNo_telp(rs.getString("no_telp"));
              costumer.setTtl(rs.getString("ttl"));
              costumer.setAlamat(rs.getString("alamat"));
              costumer.setUmur(rs.getString("umur"));
              
          }
          conn.close();
          stm.close();         
        }catch(Exception e){
            conn.close();
            stm.close();
            e.printStackTrace();
        }
        return costumer;       
    }
}
