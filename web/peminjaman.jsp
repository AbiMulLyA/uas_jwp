<%@page import="java.sql.*" %>
<%@page import="com.perpustakaan.koneksi.Koneksi" %>
<style type="text/css">
    .main {
        margin-top: 5px;
        margin-left: 10px;
        margin-right: 10px;
        margin-bottom: 10px;
    }
</style>
<div class="main">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
        <th align="left" scope="col"><font color="#000000" size="3" face="Tahoma, Geneva, sans-serif">DATA TRANSAKSI PEMINJAMAN</font></th>
        </tr>
        <tr>
        <td><hr /></td>
        </tr>
        <tr>
        <td>
            <form id="form1" name="form1" method="post" action="PeminjamanController">
                <table width="700" border="0" align="center" cellpadding="4" cellspacing="1">
                    <tr>
                    <td colspan="6" align="right" valign="middle" scope="col"><font color="#000000" face="Tahoma, Geneva, sans-serif" size="2"><b><a href="index.jsp?go=Peminjaman_Tambah"><img src="Gambar/Tambah.png" width="32" height="32" title="Tambah Data" /></a></b></font></td>
                    </tr>
                    <tr>
                    <th width="10%" align="left" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Kode</font></th>
                    <th width="22%" align="left" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Nama Peminjam</font></th>
                    <th width="22%" align="left" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Judul Buku</font></th>
                    <th width="19%" align="Center" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Tgl Pinjam</font></th>  
                    <th width="19%" align="Center" scope="col" bgcolor="#66B2A8"><font face="Tahoma, Geneva, sans-serif" size="2">Tgl Kembali</font></th> 
                    <th width="6%" align="Center" scope="col" bgcolor="#66B2A8"><font color="#FFFFFF">Aksi</font></th>
                    </tr>

                    <%

                        String kodePeminjaman = null;
                        String namaPeminjam = null;
                        String judulBuku = null;
                        Date tglPinjam;
                        Date tglKembali;


                        try {
                            Koneksi konek = new Koneksi();
                            Connection conn = konek.bukaKoneksi();
                            Statement stm = conn.createStatement();
                            String sql = "SELECT a.kode_peminjaman as kode_peminjaman,a.tgl_pinjam,a.tgl_kembali, b.nama_peminjam as nama_peminjam, c.judul_buku as judul_buku FROM peminjamantbl a inner join peminjamtbl b on a.kode_peminjam = b.kode_peminjam inner join bukutbl c on a.kode_buku = c.kode_buku ORDER BY a.id DESC";
                            ResultSet res = stm.executeQuery(sql);
                            while (res.next()) {
                                kodePeminjaman = res.getString("kode_peminjaman");
                                namaPeminjam = res.getString("nama_peminjam");
                                judulBuku = res.getString("judul_buku");
                                tglPinjam = res.getDate("tgl_pinjam");
                                tglKembali = res.getDate("tgl_kembali");

                    %>
                   
                 <tr>
                    <td align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=kodePeminjaman%></font></td>
                    <td align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=namaPeminjam%></font></td>
                    <td align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=judulBuku%></font></td>
                    <th align="left" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=tglPinjam%></font></th>
                    <th align="Center" scope="col" bgcolor="#CCCCCC"><font face="Tahoma, Geneva, sans-serif" size="2"><%=tglKembali%></font></th>
                    <th align="Center" scope="col" bgcolor="#CCCCCC"> <a href="PeminjamanController?Hapus=Hapus&amp;kdpeminjamantxt=<%=kodePeminjaman%>"> <img src="Gambar/Hapus.png" width="15" height="15" title="Hapus" /></a></th>   
            <!--    <th align="Center" scope="col" bgcolor="#CCCCCC"> <input type="submit" name="Hapus" value="Hapus" />  <input type="hidden" name="kdpeminjamantxt" value="<%=kodePeminjaman%>" /> </th> -->
                </tr>
              
                   
          
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </table>
            </form>
        </td>
        </tr>
    </table>
</div>