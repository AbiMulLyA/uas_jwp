/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.penjualan.controller;

import com.penjualan.dao.CostumerDao;
import com.penjualan.javabeans.Costumer;
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
 * @author USER
 */
public class CostumerController extends HttpServlet {

    
    Costumer costumer = new Costumer();
    CostumerDao costumerDao = new CostumerDao();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String kode_costumer = request.getParameter("kode_costumer");
        String no_ktp = request.getParameter("no_ktp");
        String nama = request.getParameter("nama");
        String no_telp = request.getParameter("no_telp");
        String ttl = request.getParameter("ttl");
        String alamat = request.getParameter("alamat");
        String umur = request.getParameter("umur");
        
        String selectKodeCustomer = request.getParameter("kodeSelected");
        RequestDispatcher rd;
        
        costumer.setKode_costumer(kode_costumer);
        costumer.setNo_ktp(no_ktp);
        costumer.setNama(nama);
        costumer.setNo_telp(no_telp);
        costumer.setTtl(ttl);
        costumer.setAlamat(alamat);
        costumer.setUmur(umur);
        
       try {
           if(request.getParameter("cari") != null){
               costumer = costumerDao.cari(kode_costumer);
               if(costumer != null){
                    request.setAttribute("kode_costumer", costumer.getKode_costumer());
                    request.setAttribute("no_ktp", costumer.getNo_ktp());
                    request.setAttribute("nama", costumer.getNama());
                    request.setAttribute("no_telp", costumer.getNo_telp());
                    request.setAttribute("ttl", costumer.getTtl());
                    request.setAttribute("alamat", costumer.getAlamat());
                    request.setAttribute("umur", costumer.getUmur());
                    request.setAttribute("pesan", "Berhasil di cari");
               }else{
                   request.setAttribute("kode_costumer", kode_costumer);
                   request.setAttribute("pesan", "Data Tidak Ditemukan");
               }
                rd = request.getRequestDispatcher("index.jsp?go=Costumer");
                rd.forward(request, response);
           }else if(request.getParameter("simpan") != null){
               costumerDao.simpan(costumer);
               request.setAttribute("pesan", "Berhasil di input");
               rd = request.getRequestDispatcher("index.jsp?go=Costumer");
               rd.forward(request, response);
           }else if(request.getParameter("ubah") != null){
               costumerDao.ubah(costumer);
               request.setAttribute("pesan", "Berhasil di Ubah");
               rd = request.getRequestDispatcher("index.jsp?go=Costumer");
               rd.forward(request, response);
           }else if(request.getParameter("hapus") != null){
               costumerDao.hapus(costumer);
               request.setAttribute("pesan", "Berhasil di Hapus");
               rd = request.getRequestDispatcher("index.jsp?go=Costumer");
               rd.forward(request, response);
           }else if(request.getParameter("kodeSelected") != null){
               String kodeSelected= request.getParameter("kodeSelected");
               costumer = costumerDao.cari(kodeSelected);
               if(costumer != null){
                    request.setAttribute("kode_costumer", costumer.getKode_costumer());
                    request.setAttribute("no_ktp", costumer.getNo_ktp());
                    request.setAttribute("nama", costumer.getNama());
                    request.setAttribute("no_telp", costumer.getNo_telp());
                    request.setAttribute("ttl", costumer.getTtl());
                    request.setAttribute("alamat", costumer.getAlamat());
                    request.setAttribute("umur", costumer.getUmur());
                    request.setAttribute("pesan", "Berhasil di cari");
               }else{
                   request.setAttribute("kode_costumer", kode_costumer);
                   request.setAttribute("pesan", "Data Tidak Ditemukan");
               }
                rd = request.getRequestDispatcher("index.jsp?go=Costumer");
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
