/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.penjualan.dao;

import com.penjualan.koneksi.Koneksi;
import com.penjualan.javabeans.Produk;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author retmac
 */
public class ProdukDao {
    public void simpan(Produk produk) throws SQLException{
        
        try{
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
          
          String query = "insert into produk"
                        + "(kode_produk,nama_produk,kategori_produk,harga,qty,berat,varian) "
                        + "values('" + produk.getKodeProduk() + "','" + produk.getNamaProduk() + "','" + produk.getKategoriProduk() + "','" + produk.getHarga() + "','" + produk.getQty() + "','" + produk.getBerat() + "','" + produk.getVarian() + "')";
          System.out.println(query);
          stm.executeUpdate(query);
          conn.close();
          stm.close();
        }catch(Exception e){
            e.printStackTrace();
        }
         
        
    }
     
   public void ubah(Produk produk) throws SQLException{
        
        try{
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
          
          String query = "update produk set nama_produk='" + produk.getNamaProduk() + "' where kode_produk='"+produk.getKodeProduk()+"'";
          System.out.println(query);             
          stm.executeUpdate(query);
          conn.close();
          stm.close();
        }catch(Exception e){
            e.printStackTrace();
        }     
  }
    
        
     public void hapus(Produk produk) throws SQLException{
        
        try{
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
          
          String query = "delete from produk where kode_produk='" + produk.getKodeProduk() + "'";
          System.out.println(query); 
          stm.executeUpdate(query);
          conn.close();
          stm.close();
        }catch(Exception e){
            e.printStackTrace();
        }
           
    }
     
    public Produk cari(String kodeProduk) throws SQLException{
            Produk produk = null;
        
        try{
         
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
        
          String query = "select * from produk where kode_produk='"+kodeProduk+"'";
          System.out.println(query);
          ResultSet rs = stm.executeQuery(query);
          
          if(rs.next()){
              produk = new Produk();
              produk.setKodeProduk(rs.getString("kode_produk"));
              produk.setNamaProduk(rs.getString("nama_produk"));

          }
          conn.close();
          stm.close();

          
        }catch(Exception e){
            e.printStackTrace();
        }
        return produk;
         
        
    }
}
