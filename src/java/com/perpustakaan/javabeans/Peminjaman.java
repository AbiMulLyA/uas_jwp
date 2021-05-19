/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.perpustakaan.javabeans;


/**
 *
 * @author User
 */
public class Peminjaman {
    
    private int id;
    private String kodePeminjaman;
    private String kodePeminjam;
    private String kodeBuku;
    private String tglPinjam;
    private String tglKembali;
    private String catatan;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKodePeminjaman() {
        return kodePeminjaman;
    }

    public void setKodePeminjaman(String kodePeminjaman) {
        this.kodePeminjaman = kodePeminjaman;
    }

    public String getKodePeminjam() {
        return kodePeminjam;
    }

    public void setKodePeminjam(String kodePeminjam) {
        this.kodePeminjam = kodePeminjam;
    }

    public String getKodeBuku() {
        return kodeBuku;
    }

    public void setKodeBuku(String kodeBuku) {
        this.kodeBuku = kodeBuku;
    }

    public String getCatatan() {
        return catatan;
    }

    public void setCatatan(String catatan) {
        this.catatan = catatan;
    }

    public String getTglPinjam() {
        return tglPinjam;
    }

    public void setTglPinjam(String tglPinjam) {
        this.tglPinjam = tglPinjam;
    }

    public String getTglKembali() {
        return tglKembali;
    }

    public void setTglKembali(String tglKembali) {
        this.tglKembali = tglKembali;
    }
    
    
    
    
    
}
