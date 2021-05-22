/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.penjualan.controller;

import com.penjualan.javabeans.Produk;
import com.pernjualan.dao.ProdukDao;
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

/**
 *
 * @author retmac
 */
@WebServlet(name = "ProdukController", urlPatterns = {"/ProdukController"})
public class ProdukController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ProdukDao produkDao = new ProdukDao();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Produk produk = new Produk();
        RequestDispatcher rd;
       try {
            /* TODO output your page here. You may use following sample code. */
           String kodeProduk = request.getParameter("kodeProduk");
           String namaProduk = request.getParameter("namaProduk");
           String kategoriProduk = request.getParameter("kategoriProduk");
           String harga = request.getParameter("harga");
           String qty = request.getParameter("qty");
           String berat = request.getParameter("berat");
           String varian = request.getParameter("varian");

           if(request.getParameter("cari") != null){
               produk = produkDao.cari(kodeProduk);
               if(produk != null){
                    request.setAttribute("kodeProduk", produk.getKodeProduk());
                    request.setAttribute("namaproduk", produk.getNamaProduk());    
               }else{
                   request.setAttribute("kodeProduk", kodeProduk);
               }
                rd = request.getRequestDispatcher("index.jsp?go=Produk");
                rd.forward(request, response);
           }else if(request.getParameter("simpan") != null){
               produk.setKodeProduk(kodeProduk);
               produk.setNamaProduk(namaProduk);
               produk.setKategoriProduk(kategoriProduk);
               produk.setHarga(harga);
               produk.setQty(qty);
               produk.setBerat(berat);
               produk.setVarian(varian);
               
               produkDao.simpan(produk);
               rd = request.getRequestDispatcher("index.jsp?go=Produk");
               rd.forward(request, response);
           }else if(request.getParameter("ubah") != null){
               produk.setKodeProduk(kodeProduk);
               produk.setNamaProduk(namaProduk);
               produk.setKategoriProduk(kategoriProduk);
               produk.setHarga(harga);
               produk.setQty(qty);
               produk.setBerat(berat);
               produk.setVarian(varian);
               produkDao.ubah(produk);
               rd = request.getRequestDispatcher("index.jsp?go=Produk");
               rd.forward(request, response);
           }else if(request.getParameter("hapus") != null){
               produk.setKodeProduk(kodeProduk);
               produkDao.hapus(produk);
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
