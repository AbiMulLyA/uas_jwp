/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pernjualan.dao;

import com.penjualan.javabeans.Peminjaman;
import com.peenjualan.koneksi.Koneksi;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author User
 */
public class PeminjamanDao {
    
     public void simpan(Peminjaman peminjaman) throws SQLException{
        
        try{
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
          
          String query = "insert into peminjamantbl"
                        + "(kode_peminjaman,kode_peminjam,kode_buku,tgl_pinjam,tgl_kembali,catatan) "
                        + "values('" +peminjaman.getKodePeminjaman() + "','" + peminjaman.getKodePeminjam() + "','"+peminjaman.getKodeBuku()+"','"+peminjaman.getTglPinjam()+"','"+peminjaman.getTglKembali()+"','"+peminjaman.getCatatan()+"')";
          System.out.println(query);
          stm.executeUpdate(query);
          conn.close();
          stm.close();
        }catch(Exception e){
            e.printStackTrace();
        }
         
        
    }
     
       public void hapus(Peminjaman peminjaman) throws SQLException{
        
        try{
          Koneksi obj = new Koneksi();
          Connection conn = obj.bukaKoneksi();
          Statement stm = conn.createStatement();
          String query = "delete from peminjamantbl where kode_peminjaman='" + peminjaman.getKodePeminjaman() + "'";
          System.out.println(query); 
          stm.executeUpdate(query);
          conn.close();
          stm.close();
        }catch(Exception e){
            e.printStackTrace();
        }
           
    }
    
}
