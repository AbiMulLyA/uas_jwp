package com.penjualan.controller;

import com.penjualan.javabeans.Produk;
import com.penjualan.dao.ProdukDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "ProdukController", urlPatterns = {"/ProdukController"})
public class ProdukController extends HttpServlet {
    ProdukDao produkDao = new ProdukDao();
    Produk produk = new Produk();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        RequestDispatcher rd;
       try {
           String kodeProduk = request.getParameter("kodeProduk");
           String namaProduk = request.getParameter("namaProduk");
           String kategoriProduk = request.getParameter("kategoriProduk");
           String harga = request.getParameter("harga");
           String qty = request.getParameter("qty");
           String berat = request.getParameter("berat");
           String varian = request.getParameter("varian");
           String kodeSelected = request.getParameter("kodeSelected");
           String kategoriProdukHidden = request.getParameter("kategoriProdukHidden");
           
           produk.setKodeProduk(kodeProduk);
               produk.setNamaProduk(namaProduk);
               produk.setKategoriProduk(kategoriProduk);
               produk.setHarga(harga);
               produk.setQty(qty);
               produk.setBerat(berat);
               produk.setVarian(varian);
           if(request.getParameter("cari") != null){
               produk = produkDao.cari(kodeProduk);
               if(produk != null){
                    request.setAttribute("kodeProduk", produk.getKodeProduk());
                    request.setAttribute("namaProduk", produk.getNamaProduk());
                    request.setAttribute("kategoriProduk", produk.getKategoriProduk());
                    request.setAttribute("harga", produk.getHarga());
                    request.setAttribute("qty", produk.getQty());
                    request.setAttribute("berat", produk.getBerat());
                    request.setAttribute("varian", produk.getVarian());
                    request.setAttribute("pesan", "berhasil di cari");
               }else{
                   request.setAttribute("kodeProduk", kodeProduk);
                   request.setAttribute("pesan", "data tidak ada");
               }
                rd = request.getRequestDispatcher("index.jsp?go=Produk");
                rd.forward(request, response);
           }else if(request.getParameter("simpan") != null){
               produkDao.simpan(produk);
               request.setAttribute("pesan", "Data Berhasil Disimpan");
               rd = request.getRequestDispatcher("index.jsp?go=Produk");
               rd.forward(request, response);
           }else if(request.getParameter("ubah") != null){
               if(request.getParameter("kategoriProdukHidden")=="null"){
                  produk.setKategoriProduk(kategoriProdukHidden);
               }else{
                  produk.setKategoriProduk(kategoriProduk);
               }
               produkDao.ubah(produk);
               request.setAttribute("pesan", "Data Berhasil Diubah");
               rd = request.getRequestDispatcher("index.jsp?go=Produk");
               rd.forward(request, response);
           }else if(request.getParameter("hapus") != null){
               produk.setKodeProduk(kodeProduk);
               request.setAttribute("pesan", "Data Berhasil Dihapus");
               produkDao.hapus(produk);
               rd = request.getRequestDispatcher("index.jsp?go=Produk");
               rd.forward(request, response);
           }else if(request.getParameter("kodeSelected") != null){
               produk = produkDao.cari(kodeSelected);
               if(produk != null){
                    request.setAttribute("kodeProduk", produk.getKodeProduk());
                    request.setAttribute("namaProduk", produk.getNamaProduk());
                    request.setAttribute("kategoriProduk", produk.getKategoriProduk());
                    request.setAttribute("harga", produk.getHarga());
                    request.setAttribute("qty", produk.getQty());
                    request.setAttribute("berat", produk.getBerat());
                    request.setAttribute("varian", produk.getVarian());
                    request.setAttribute("pesan", "berhasil di cari");
               }else{
                   request.setAttribute("kodeProduk", kodeProduk);
                   request.setAttribute("pesan", "data tidak ada");
               }
                rd = request.getRequestDispatcher("index.jsp?go=Produk");
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
            Logger.getLogger(ProdukController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProdukController.class.getName()).log(Level.SEVERE, null, ex);
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
