/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Mahasiswa;
import util.DBConnection;

public class MahasiswaDAO {

    // 1. TAMBAH MAHASISWA BARU (Create)
    public boolean tambahMahasiswa(Mahasiswa m) {
        String sql = "INSERT INTO mahasiswa (nim, nama, password, angkatan) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, m.getNim());
            ps.setString(2, m.getNama());
            ps.setString(3, m.getPassword()); // Password disimpan plain text (untuk latihan)
            ps.setString(4, m.getAngkatan());

            // Eksekusi query
            int rowAffected = ps.executeUpdate();
            return rowAffected > 0; // Mengembalikan true jika berhasil disimpan

        } catch (SQLException e) {
            System.out.println("Error Tambah Mahasiswa: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // 2. AMBIL SEMUA DATA MAHASISWA (Read)
    public List<Mahasiswa> getAllMahasiswa() {
        List<Mahasiswa> list = new ArrayList<>();
        String sql = "SELECT * FROM mahasiswa ORDER BY nim ASC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Mahasiswa m = new Mahasiswa();
                m.setNim(rs.getString("nim"));
                m.setNama(rs.getString("nama"));
                m.setPassword(rs.getString("password"));
                m.setAngkatan(rs.getString("angkatan"));

                list.add(m);
            }

        } catch (SQLException e) {
            System.out.println("Error Get All Mahasiswa: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    // 3. CEK LOGIN (Authentication)
    public boolean login(String nim, String password) {
        String sql = "SELECT * FROM mahasiswa WHERE nim = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nim);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                // Jika rs.next() bernilai true, berarti ada data yang cocok
                return rs.next();
            }

        } catch (SQLException e) {
            System.out.println("Error Login Mahasiswa: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // 4. AMBIL NAMA BERDASARKAN NIM (Helper)
    public String getNamaByNim(String nim) {
        String nama = ""; // Default kosong jika tidak ditemukan
        String sql = "SELECT nama FROM mahasiswa WHERE nim = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nim);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    nama = rs.getString("nama");
                }
            }

        } catch (SQLException e) {
            System.out.println("Error Get Nama Mahasiswa: " + e.getMessage());
            e.printStackTrace();
        }
        return nama;
    }

    // =========================================================================
    // 5. HAPUS MAHASISWA (Delete)
    // =========================================================================
    public boolean deleteMahasiswa(String nim) {
        // Query 1: Hapus dulu data setoran milik mahasiswa ini (agar tidak error FK)
        String sqlDeleteSetoran = "DELETE FROM setoran WHERE nim = ?";
        // Query 2: Baru hapus data mahasiswanya
        String sqlDeleteMhs = "DELETE FROM mahasiswa WHERE nim = ?";

        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            // Matikan auto-commit untuk transaksi (agar kedua query jalan bareng)
            conn.setAutoCommit(false);

            // 1. Eksekusi Hapus Setoran
            try (PreparedStatement ps1 = conn.prepareStatement(sqlDeleteSetoran)) {
                ps1.setString(1, nim);
                ps1.executeUpdate();
            }

            // 2. Eksekusi Hapus Mahasiswa
            int rowAffected;
            try (PreparedStatement ps2 = conn.prepareStatement(sqlDeleteMhs)) {
                ps2.setString(1, nim);
                rowAffected = ps2.executeUpdate();
            }

            // Commit transaksi jika lancar
            conn.commit();
            return rowAffected > 0;

        } catch (SQLException e) {
            // Rollback jika ada error
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            System.out.println("Error Hapus Mahasiswa: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            // Kembalikan status auto-commit
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
