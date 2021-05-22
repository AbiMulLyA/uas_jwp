 /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.penjualan.dao;

import com.penjualan.javabeans.Kategori;
import com.penjualan.koneksi.Koneksi;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class KategoriDao {
   
    
     public void simpan(Kategori kategori) throws SQLException{
        
        try{
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
          
          String query = "insert into kategoritbl"
                        + "(kode_kategori,nama_kategori) "
                        + "values('" + kategori.getKodeKategori() + "','" + kategori.getNamaKategori() + "')";
          System.out.println(query);
          stm.executeUpdate(query);
          conn.close();
          stm.close();
        }catch(Exception e){
            e.printStackTrace();
        }
         
        
    }
     
   public void ubah(Kategori kategori) throws SQLException{
        
        try{
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
          
          String query = "update kategoritbl set nama_kategori='" + kategori.getNamaKategori() + "' where kode_kategori='"+kategori.getKodeKategori()+"'";
          System.out.println(query);             
          stm.executeUpdate(query);
          conn.close();
          stm.close();
        }catch(Exception e){
            e.printStackTrace();
        }     
  }
    
        
     public void hapus(Kategori kategori) throws SQLException{
        
        try{
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
          
          String query = "delete from kategoritbl where kode_kategori='" + kategori.getKodeKategori() + "'";
          System.out.println(query); 
          stm.executeUpdate(query);
          conn.close();
          stm.close();
        }catch(Exception e){
            e.printStackTrace();
        }
           
    }
     
    public Kategori cari(String kodeKategori) throws SQLException{
            Kategori kategori = null;
        
        try{
         
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
        
          String query = "select * from kategoritbl where kode_kategori='"+kodeKategori+"'";
          System.out.println(query);
          ResultSet rs = stm.executeQuery(query);
          
          if(rs.next()){
              kategori = new Kategori();
              kategori.setKodeKategori(rs.getString("kode_kategori"));
              kategori.setNamaKategori(rs.getString("nama_kategori"));

          }
          conn.close();
          stm.close();

          
        }catch(Exception e){
            e.printStackTrace();
        }
        return kategori;
         
        
    }
    
}
