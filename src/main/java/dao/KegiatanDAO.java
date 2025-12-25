/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Kegiatan;
import util.DBConnection;

public class KegiatanDAO {

    // 1. Simpan Kegiatan Baru
    public boolean tambahKegiatan(Kegiatan k) {
        String sql = "INSERT INTO kegiatan (judul, deskripsi, tanggal, gambar) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, k.getJudul());
            ps.setString(2, k.getDeskripsi());
            ps.setDate(3, k.getTanggal());
            ps.setString(4, k.getGambar());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 2. Ambil Semua Data (Untuk Carousel)
    public List<Kegiatan> getAll() {
        List<Kegiatan> list = new ArrayList<>();
        String sql = "SELECT * FROM kegiatan ORDER BY tanggal DESC LIMIT 5"; // Ambil 5 terbaru saja

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Kegiatan k = new Kegiatan();
                k.setId(rs.getInt("id"));
                k.setJudul(rs.getString("judul"));
                k.setDeskripsi(rs.getString("deskripsi"));
                k.setTanggal(rs.getDate("tanggal"));
                k.setGambar(rs.getString("gambar"));
                list.add(k);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    // 3. Ambil Satu Kegiatan berdasarkan ID (Untuk cari nama file gambar sebelum dihapus)
    public Kegiatan getKegiatanById(int id) {
        Kegiatan k = null;
        String sql = "SELECT * FROM kegiatan WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    k = new Kegiatan();
                    k.setId(rs.getInt("id"));
                    k.setJudul(rs.getString("judul"));
                    k.setDeskripsi(rs.getString("deskripsi"));
                    k.setTanggal(rs.getDate("tanggal"));
                    k.setGambar(rs.getString("gambar"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return k;
    }

    // 4. Hapus Kegiatan
    public boolean deleteKegiatan(int id) {
        String sql = "DELETE FROM kegiatan WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
