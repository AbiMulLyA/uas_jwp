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
          
          String query = "INSERT INTO kategori"
                        + "(id, kategori, tanggal, brand, vendor, remark, status) "
                        + "VALUES('" + kategori.getId()+ "','" + kategori.getKategori()+ "','" 
                        + kategori.getTanggal()+ "','" + kategori.getBrand()+ "','" 
                        + kategori.getVendor()+ "','" + kategori.getRemark()+ "','" + kategori.getStatus() + "')";
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
          
          String query = "UPDATE kategori SET kategori='" + kategori.getKategori() + "' , tanggal='" + kategori.getTanggal() + "' , brand='" + kategori.getBrand() + "' , vendor='" + kategori.getVendor() + "' , remark='" + kategori.getRemark() + "' , status='" + kategori.getStatus() + "' WHERE id='"+kategori.getId()+"'";
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
          
          String query = "DELETE FROM kategori WHERE id='" + kategori.getId() + "'";
          System.out.println(query); 
          stm.executeUpdate(query);
          conn.close();
          stm.close();
        }catch(Exception e){
            e.printStackTrace();
        }
           
    }
     
    public Kategori cari(String id) throws SQLException{
            Kategori kategori = null;
        
        try{
         
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
        
          String query = "SELECT * FROM kategori WHERE id='"+id+"'";
          System.out.println(query);
          ResultSet rs = stm.executeQuery(query);
          
          if(rs.next()){
              kategori = new Kategori();
              kategori.setId(rs.getString("id"));
              kategori.setKategori(rs.getString("kategori"));
              kategori.setTanggal(rs.getString("tanggal"));
              kategori.setBrand(rs.getString("brand"));
              kategori.setVendor(rs.getString("vendor"));
              kategori.setRemark(rs.getString("remark"));
              kategori.setStatus(rs.getString("status"));

          }
          conn.close();
          stm.close();

          
        }catch(Exception e){
            e.printStackTrace();
        }
        return kategori;
         
        
    }
    
}
