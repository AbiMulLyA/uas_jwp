/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.penjualan.javabeans;

/**
 *
 * @author USER
 */
public class Transaksi {
    public String kode_transaksi;
    public String nama_costumer;
    public String produk;
    public String qty;
    public String harga;
    public String tanggal_pembelian;
    public String status;

    public String getKode_transaksi() {
        return kode_transaksi;
    }

    public void setKode_transaksi(String kode_transaksi) {
        this.kode_transaksi = kode_transaksi;
    }

    public String getNama_costumer() {
        return nama_costumer;
    }

    public void setNama_costumer(String nama_costumer) {
        this.nama_costumer = nama_costumer;
    }

    public String getProduk() {
        return produk;
    }

    public void setProduk(String produk) {
        this.produk = produk;
    }

    public String getQty() {
        return qty;
    }

    public void setQty(String qty) {
        this.qty = qty;
    }

    public String getHarga() {
        return harga;
    }

    public void setHarga(String harga) {
        this.harga = harga;
    }

    public String getTanggal_pembelian() {
        return tanggal_pembelian;
    }

    public void setTanggal_pembelian(String tanggal_pembelian) {
        this.tanggal_pembelian = tanggal_pembelian;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
