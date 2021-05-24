
package com.penjualan.controller;

import com.penjualan.dao.TransaksiDao;
import com.penjualan.javabeans.Transaksi;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class TransaksiController extends HttpServlet {
    
    Transaksi transaksi = new Transaksi();
    TransaksiDao transaksiDao = new TransaksiDao();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String kode_transaksi = request.getParameter("kode_transaksi");
        String nama_costumer = request.getParameter("nama_costumer");
        String produk = request.getParameter("produk");
        String qty = request.getParameter("qty");
        String harga = request.getParameter("qty");
        String tanggal_pembelian = request.getParameter("tanggal_pembelian");
        String status = request.getParameter("status");
        String selectKodeTransaksi = request.getParameter("kodeSelected");
        String costumerHidden = request.getParameter("costumerHidden");
        
        RequestDispatcher rd;
        
        transaksi.setKode_transaksi(kode_transaksi);
        transaksi.setNama_costumer(nama_costumer);
        transaksi.setProduk(produk);
        transaksi.setQty(qty);
        transaksi.setHarga(harga);
        transaksi.setTanggal_pembelian(tanggal_pembelian);
        transaksi.setStatus(status);
        
       try {
           if(request.getParameter("cari") != null){
               transaksi = transaksiDao.cari(kode_transaksi);
               if(transaksi != null){
                    request.setAttribute("kode_transaksi", transaksi.getKode_transaksi());
                    request.setAttribute("nama_costumer", transaksi.getNama_costumer());
                    request.setAttribute("produk", transaksi.getProduk());
                    request.setAttribute("qty", transaksi.getQty());
                    request.setAttribute("harga", transaksi.getHarga());
                    request.setAttribute("tanggal_pembelian", transaksi.getTanggal_pembelian());
                    request.setAttribute("status", transaksi.getStatus());
                    request.setAttribute("pesan", "Berhasil di cari");
               }else{
                   request.setAttribute("id", kode_transaksi);
                   request.setAttribute("pesan", "Data Tidak Ditemukan");
               }
                rd = request.getRequestDispatcher("index.jsp?go=Transaksi");
                rd.forward(request, response);
           }else if(request.getParameter("simpan") != null){
               transaksiDao.simpan(transaksi);
               request.setAttribute("pesan", "Berhasil di input");
               rd = request.getRequestDispatcher("index.jsp?go=Transaksi");
               rd.forward(request, response);
           }else if(request.getParameter("ubah") != null){
               if((request.getParameter("costumerHidden"))=="kosong"){
                   transaksi.setNama_costumer(nama_costumer);
               }else{
                   transaksi.setNama_costumer(costumerHidden);
               }
               transaksiDao.ubah(transaksi);
               request.setAttribute("pesan", "Berhasil di Ubah");
               rd = request.getRequestDispatcher("index.jsp?go=Transaksi");
               rd.forward(request, response);
           }else if(request.getParameter("hapus") != null){
               transaksiDao.hapus(transaksi);
               request.setAttribute("pesan", "Berhasil di Hapus");
               rd = request.getRequestDispatcher("index.jsp?go=Transaksi");
               rd.forward(request, response);
           }else if(request.getParameter("kodeSelected") != null){
               String kodeSelected= request.getParameter("kodeSelected");
               transaksi = transaksiDao.cari(kodeSelected);
               if(transaksi != null){
                    request.setAttribute("kode_transaksi", transaksi.getKode_transaksi());
                    request.setAttribute("nama_costumer", transaksi.getNama_costumer());
                    request.setAttribute("produk", transaksi.getProduk());
                    request.setAttribute("qty", transaksi.getQty());
                    request.setAttribute("harga", transaksi.getHarga());
                    request.setAttribute("tanggal_pembelian", transaksi.getTanggal_pembelian());
                    request.setAttribute("status", transaksi.getStatus());
                    request.setAttribute("pesan", "Berhasil di cari");
               }else{
                   request.setAttribute("id", kode_transaksi);
                   request.setAttribute("pesan", "Data Tidak Ditemukan");
               }
                rd = request.getRequestDispatcher("index.jsp?go=Transaksi");
                rd.forward(request, response);
           }
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(KategoriController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(KategoriController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
