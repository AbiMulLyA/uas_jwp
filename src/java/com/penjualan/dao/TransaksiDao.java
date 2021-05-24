/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.penjualan.dao;

import com.penjualan.javabeans.Transaksi;
import com.penjualan.koneksi.Koneksi;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author USER
 */
public class TransaksiDao {
    public void simpan(Transaksi transaksi) throws SQLException{
        
        try{
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
          
          String query = "INSERT INTO transaksi"
                        + "(kode_transaksi, nama_costumer, produk, qty, harga, tanggal_pembelian, status) "
                        + "VALUES('" + transaksi.getKode_transaksi()+ "','" + transaksi.getNama_costumer()+ "','" 
                        + transaksi.getProduk()+ "','" + transaksi.getQty()+ "','" 
                        + transaksi.getHarga()+ "','" + transaksi.getTanggal_pembelian()+ "','" + transaksi.getStatus() + "')";
          System.out.println(query);
          stm.executeUpdate(query);
          conn.close();
          stm.close();
        }catch(Exception e){
            e.printStackTrace();
        }
         
        
    }
     
   public void ubah(Transaksi transaksi) throws SQLException{
        
        try{
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
          
          String query = "UPDATE transaksi SET nama_costumer='" + transaksi.getNama_costumer()+ "' , produk='" + transaksi.getProduk() + "' , qty='" + transaksi.getHarga() + "' , harga='" + transaksi.getHarga() + "' , tanggal_pembelian='" + transaksi.getTanggal_pembelian() + "' , status='" + transaksi.getStatus() + "' WHERE kode_transaksi='"+transaksi.getKode_transaksi()+"'";
          System.out.println(query);             
          stm.executeUpdate(query);
          conn.close();
          stm.close();
        }catch(Exception e){
            e.printStackTrace();
        }     
  }
    
        
     public void hapus(Transaksi transaksi) throws SQLException{
        
        try{
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
          
          String query = "DELETE FROM transaksi WHERE kode_transaksi='" + transaksi.getKode_transaksi() + "'";
          System.out.println(query); 
          stm.executeUpdate(query);
          conn.close();
          stm.close();
        }catch(Exception e){
            e.printStackTrace();
        }
           
    }
     
    public Transaksi cari(String kode_transaksi) throws SQLException{
            Transaksi transaksi = null;
        
        try{
         
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
        
          String query = "SELECT * FROM transaksi WHERE kode_transaksi='"+kode_transaksi+"'";
          System.out.println(query);
          ResultSet rs = stm.executeQuery(query);
          
          if(rs.next()){
              transaksi = new Transaksi();
              transaksi.setKode_transaksi(rs.getString("kode_transaksi"));
              transaksi.setNama_costumer(rs.getString("nama_costumer"));
              transaksi.setProduk(rs.getString("produk"));
              transaksi.setQty(rs.getString("qty"));
              transaksi.setHarga(rs.getString("harga"));
              transaksi.setTanggal_pembelian(rs.getString("tanggal_pembelian"));
              transaksi.setStatus(rs.getString("status"));

          }
          conn.close();
          stm.close();

          
        }catch(Exception e){
            e.printStackTrace();
        }
        return transaksi;
         
        
    }
}
