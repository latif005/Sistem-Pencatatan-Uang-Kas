/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate; // Import untuk LocalDate
import model.Setoran;
import util.DBConnection;
import model.Tunggakan;

public class SetoranDAO {

    // 1. CREATE (Tambah Data)
    public boolean tambahSetoran(Setoran s) {
        String sql = "INSERT INTO setoran (nim, tanggal, jumlah, keterangan) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, s.getNim());
            ps.setDate(2, new java.sql.Date(s.getTanggal().getTime()));
            ps.setDouble(3, s.getJumlah());
            ps.setString(4, s.getKeterangan());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 2. READ ALL (Sesuai error: butuh method 'getAll')
    public List<Setoran> getAll() {
        List<Setoran> list = new ArrayList<>();
        String sql = "SELECT s.id, s.nim, m.nama, s.tanggal, s.jumlah, s.keterangan "
                + "FROM setoran s LEFT JOIN mahasiswa m ON s.nim = m.nim "
                + "ORDER BY s.tanggal DESC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Setoran s = mapResultSetToSetoran(rs);
                list.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 3. READ BY NIM (Sesuai error: butuh method 'getByNim')
    public List<Setoran> getByNim(String nim) {
        List<Setoran> list = new ArrayList<>();
        String sql = "SELECT s.id, s.nim, m.nama, s.tanggal, s.jumlah, s.keterangan "
                + "FROM setoran s LEFT JOIN mahasiswa m ON s.nim = m.nim "
                + "WHERE s.nim = ? ORDER BY s.tanggal DESC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nim);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Setoran s = mapResultSetToSetoran(rs);
                    list.add(s);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 4. GET TOTAL SALDO (Sesuai error: butuh method 'getTotalSetoran')
    public double getTotalSetoran() {
        double total = 0;
        String sql = "SELECT SUM(jumlah) AS total FROM setoran";
        try (Connection conn = DBConnection.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                total = rs.getDouble("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    // 5. GET TOTAL RANGE TANGGAL (Sesuai error: butuh method 'getTotalSetoranBetween')
    // Method ini digunakan untuk Laporan Mingguan/Bulanan
    public double getTotalSetoranBetween(LocalDate start, LocalDate end) {
        double total = 0;
        String sql = "SELECT SUM(jumlah) AS total FROM setoran WHERE tanggal BETWEEN ? AND ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            // Konversi LocalDate ke java.sql.Date
            ps.setDate(1, java.sql.Date.valueOf(start));
            ps.setDate(2, java.sql.Date.valueOf(end));

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    total = rs.getDouble("total");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    // --- Helper Method untuk Mapping ResultSet ke Object ---
    private Setoran mapResultSetToSetoran(ResultSet rs) throws SQLException {
        Setoran s = new Setoran();
        s.setId(rs.getInt("id"));
        s.setNim(rs.getString("nim"));
        // Cek jika kolom nama ada (dari join)
        try {
            s.setNamaMahasiswa(rs.getString("nama"));
        } catch (SQLException e) {
            s.setNamaMahasiswa("Unknown");
        }
        s.setTanggal(rs.getDate("tanggal"));
        s.setJumlah(rs.getDouble("jumlah"));
        s.setKeterangan(rs.getString("keterangan"));
        return s;
    }

    // =========================================================================
    // 5. REKAP TOTAL BAYAR PER MAHASISWA (Untuk Laporan Tunggakan)
    // =========================================================================
    public List<Tunggakan> getRekapTunggakan(double targetWajibBayar) {
        List<Tunggakan> list = new ArrayList<>();

        // Query: Gabungkan Mahasiswa dengan Total Setoran mereka
        // COALESCE(SUM(...), 0) artinya jika tidak ada setoran, anggap 0.
        String sql = "SELECT m.nim, m.nama, COALESCE(SUM(s.jumlah), 0) as total_bayar "
                + "FROM mahasiswa m "
                + "LEFT JOIN setoran s ON m.nim = s.nim "
                + "GROUP BY m.nim, m.nama "
                + "ORDER BY m.nim ASC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String nim = rs.getString("nim");
                String nama = rs.getString("nama");
                double totalBayar = rs.getDouble("total_bayar");

                // Hitung Tunggakan (Target - Yang Sudah Dibayar)
                double kurang = targetWajibBayar - totalBayar;
                if (kurang < 0) {
                    kurang = 0; // Jika bayar lebih, tunggakan 0 (tidak minus)
                }
                list.add(new Tunggakan(nim, nama, totalBayar, kurang));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Ambil daftar setoran dalam rentang tanggal tertentu
    public List<Setoran> getSetoranByDate(java.sql.Date start, java.sql.Date end) {
        List<Setoran> list = new ArrayList<>();
        String sql = "SELECT s.id, s.nim, m.nama, s.tanggal, s.jumlah, s.keterangan "
                + "FROM setoran s LEFT JOIN mahasiswa m ON s.nim = m.nim "
                + "WHERE s.tanggal BETWEEN ? AND ? ORDER BY s.tanggal DESC";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDate(1, start);
            ps.setDate(2, end);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Setoran s = new Setoran();
                    s.setId(rs.getInt("id"));
                    s.setNim(rs.getString("nim"));
                    s.setNamaMahasiswa(rs.getString("nama"));
                    s.setTanggal(rs.getDate("tanggal"));
                    s.setJumlah(rs.getDouble("jumlah"));
                    s.setKeterangan(rs.getString("keterangan"));
                    list.add(s);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // =========================================================================
    // 6. HAPUS SETORAN (Delete)
    // Digunakan jika admin salah input
    // =========================================================================
    public boolean deleteSetoran(int id) {
        String sql = "DELETE FROM setoran WHERE id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
