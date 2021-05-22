/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.penjualan.controller;

import com.penjualan.dao.PeminjamanDao;
import com.penjualan.javabeans.Peminjaman;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
public class PeminjamanController extends HttpServlet {
    
     Peminjaman peminjaman = new Peminjaman();
     PeminjamanDao peminjamanDao = new PeminjamanDao();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd;

        try {
            /* TODO output your page here. You may use following sample code. */
           String kodePeminjaman = request.getParameter("kdpeminjamantxt");
           String kodePeminjam = request.getParameter("kdpeminjamtxt");
           String kodeBuku = request.getParameter("kdbukutxt");
           String tglPinjam = request.getParameter("tglpinjam");
           String tglKembali = request.getParameter("tglkembali");
           String catatan = request.getParameter("cattxt"); 

            if(request.getParameter("Simpan") != null){
               peminjaman.setKodePeminjaman(kodePeminjaman);
               peminjaman.setKodePeminjam(kodePeminjam);
               peminjaman.setKodeBuku(kodeBuku);
               peminjaman.setTglPinjam(tglPinjam);
               peminjaman.setTglKembali(tglKembali);
               peminjaman.setCatatan(catatan);
               peminjamanDao.simpan(peminjaman);
               rd = request.getRequestDispatcher("index.jsp?go=Peminjaman");
               rd.forward(request, response);
           }else if(request.getParameter("Hapus")!= null){
               peminjaman.setKodePeminjaman(kodePeminjaman);
               peminjamanDao.hapus(peminjaman);
               rd = request.getRequestDispatcher("index.jsp?go=Peminjaman");
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
                    try {
                        processRequest(request, response);
                    } catch (SQLException ex) {
                        Logger.getLogger(PeminjamanController.class.getName()).log(Level.SEVERE, null, ex);
                    }
        } catch (ParseException ex) {
            Logger.getLogger(PeminjamanController.class.getName()).log(Level.SEVERE, null, ex);
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
                    try {
                        processRequest(request, response);
                    } catch (SQLException ex) {
                        Logger.getLogger(PeminjamanController.class.getName()).log(Level.SEVERE, null, ex);
                    }
        } catch (ParseException ex) {
            Logger.getLogger(PeminjamanController.class.getName()).log(Level.SEVERE, null, ex);
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
