/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Pengeluaran;
import util.DBConnection;

public class PengeluaranDAO {

    // 1. Tambah Pengeluaran
    public boolean tambahPengeluaran(Pengeluaran p) {
        String sql = "INSERT INTO pengeluaran (tanggal, jumlah, keperluan) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setDate(1, new java.sql.Date(p.getTanggal().getTime()));
            ps.setDouble(2, p.getJumlah());
            ps.setString(3, p.getKeperluan());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 2. Ambil Semua Data
    public List<Pengeluaran> getAll() {
        List<Pengeluaran> list = new ArrayList<>();
        String sql = "SELECT * FROM pengeluaran ORDER BY tanggal DESC";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Pengeluaran p = new Pengeluaran();
                p.setId(rs.getInt("id"));
                p.setTanggal(rs.getDate("tanggal"));
                p.setJumlah(rs.getDouble("jumlah"));
                p.setKeperluan(rs.getString("keperluan"));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 3. Hitung Total Pengeluaran (Untuk Dashboard/Laporan Saldo)
    public double getTotalPengeluaran() {
        double total = 0;
        String sql = "SELECT SUM(jumlah) as total FROM pengeluaran";
        try (Connection conn = DBConnection.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                total = rs.getDouble("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    // Ambil daftar pengeluaran dalam rentang tanggal tertentu
    public List<Pengeluaran> getPengeluaranByDate(java.sql.Date start, java.sql.Date end) {
        List<Pengeluaran> list = new ArrayList<>();
        String sql = "SELECT * FROM pengeluaran WHERE tanggal BETWEEN ? AND ? ORDER BY tanggal DESC";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDate(1, start);
            ps.setDate(2, end);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Pengeluaran p = new Pengeluaran();
                    p.setId(rs.getInt("id"));
                    p.setTanggal(rs.getDate("tanggal"));
                    p.setJumlah(rs.getDouble("jumlah"));
                    p.setKeperluan(rs.getString("keperluan"));
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Hapus Pengeluaran
    public boolean deletePengeluaran(int id) {
        String sql = "DELETE FROM pengeluaran WHERE id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
