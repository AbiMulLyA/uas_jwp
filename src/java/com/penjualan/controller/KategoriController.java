
package com.penjualan.controller;

import com.penjualan.dao.KategoriDao;
import com.penjualan.javabeans.Kategori;
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

public class KategoriController extends HttpServlet {

      Kategori kategori = new Kategori();
      KategoriDao kategoriDao = new KategoriDao();
      
      
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String id = request.getParameter("id");
        String namaKategori = request.getParameter("kategori");
        String tanggal = request.getParameter("tanggal");
        String brand = request.getParameter("brand");
        String vendor = request.getParameter("vendor");
        String remark = request.getParameter("remark");
        String status = request.getParameter("status");
        String selectId = request.getParameter("selectId");
        
        RequestDispatcher rd;
        
        kategori.setId(id);
        kategori.setKategori(namaKategori);
        kategori.setTanggal(tanggal);
        kategori.setBrand(brand);
        kategori.setVendor(vendor);
        kategori.setRemark(remark);
        kategori.setStatus(status);
        
       try {
           if(request.getParameter("cari") != null){
               kategori = kategoriDao.cari(id);
               if(kategori != null){
                    request.setAttribute("id", kategori.getId());
                    request.setAttribute("kategori", kategori.getKategori());
                    request.setAttribute("tanggal", kategori.getTanggal());
                    request.setAttribute("brand", kategori.getBrand());
                    request.setAttribute("vendor", kategori.getVendor());
                    request.setAttribute("remark", kategori.getRemark());
                    request.setAttribute("status", kategori.getStatus());
                    request.setAttribute("pesan", "Berhasil di cari");
               }else{
                   request.setAttribute("id", id);
                   request.setAttribute("pesan", "Data Tidak Ditemukan");
               }
                rd = request.getRequestDispatcher("index.jsp?go=Kategori");
                rd.forward(request, response);
           }else if(request.getParameter("simpan") != null){
               kategoriDao.simpan(kategori);
               request.setAttribute("pesan", "Berhasil di input");
               rd = request.getRequestDispatcher("index.jsp?go=Kategori");
               rd.forward(request, response);
           }else if(request.getParameter("ubah") != null){
               kategoriDao.ubah(kategori);
               request.setAttribute("pesan", "berhasil di Ubah");
               rd = request.getRequestDispatcher("index.jsp?go=Kategori");
               rd.forward(request, response);
           }else if(request.getParameter("hapus") != null){
               kategoriDao.hapus(kategori);
               request.setAttribute("pesan", "Berhasil di Hapus");
               rd = request.getRequestDispatcher("index.jsp?go=Kategori");
               rd.forward(request, response);
           }else if(request.getParameter("idSelected") != null){
               String idSelected= request.getParameter("idSelected");
               kategori = kategoriDao.cari(idSelected);
               if(kategori != null){
                    request.setAttribute("id", kategori.getId());
                    request.setAttribute("kategori", kategori.getKategori());
                    request.setAttribute("tanggal", kategori.getTanggal());
                    request.setAttribute("brand", kategori.getBrand());
                    request.setAttribute("vendor", kategori.getVendor());
                    request.setAttribute("remark", kategori.getRemark());
                    request.setAttribute("status", kategori.getStatus());
                    request.setAttribute("pesan", "Berhasil di cari");
               }else{
                   request.setAttribute("id", id);
                   request.setAttribute("pesan", "Data Tidak Ditemukan");
               }
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
