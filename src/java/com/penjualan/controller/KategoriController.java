/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.perpustakaan.controller;

import com.perpustakaan.dao.KategoriDao;
import com.perpustakaan.javabeans.Kategori;
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

/**
 *
 * @author User
 */
public class KategoriController extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     // Kategori kategori = new Kategori();
      KategoriDao kategoriDao = new KategoriDao();
      
      
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Kategori kategori = new Kategori();
        RequestDispatcher rd;
       try {
            /* TODO output your page here. You may use following sample code. */
           String kodeKategori = request.getParameter("kodeKategori");
           String namaKategori = request.getParameter("namaKategori");
           if(request.getParameter("cari") != null){
               kategori = kategoriDao.cari(kodeKategori);
               if(kategori != null){
                    request.setAttribute("kodeKategori", kategori.getKodeKategori());
                    request.setAttribute("namaKategori", kategori.getNamaKategori());    
               }else{
                   request.setAttribute("kodeKategori", kodeKategori);
               }
                rd = request.getRequestDispatcher("index.jsp?go=Kategori");
                rd.forward(request, response);
           }else if(request.getParameter("simpan") != null){
               kategori.setKodeKategori(kodeKategori);
               kategori.setNamaKategori(namaKategori);
               kategoriDao.simpan(kategori);
               rd = request.getRequestDispatcher("index.jsp?go=Kategori");
               rd.forward(request, response);
           }else if(request.getParameter("ubah") != null){
               kategori.setKodeKategori(kodeKategori);
               kategori.setNamaKategori(namaKategori);
               kategoriDao.ubah(kategori);
               rd = request.getRequestDispatcher("index.jsp?go=Kategori");
               rd.forward(request, response);
           }else if(request.getParameter("hapus") != null){
               kategori.setKodeKategori(kodeKategori);
               kategoriDao.hapus(kategori);
               rd = request.getRequestDispatcher("index.jsp?go=Kategori");
               rd.forward(request, response);
           }
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
