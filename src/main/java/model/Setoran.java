/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

public class Setoran {
    private int id;
    private String nim;
    private String namaMahasiswa; // Helper field untuk join tabel
    private Date tanggal;
    private double jumlah;
    private String keterangan;

    // Constructor kosong & Constructor lengkap
    public Setoran() {
    }
    
    public Setoran(int id, String nim, String namaMahasiswa, Date tanggal, double jumlah, String keterangan) {
        this.id = id;
        this.nim = nim;
        this.namaMahasiswa = namaMahasiswa;
        this.tanggal = tanggal;
        this.jumlah = jumlah;
        this.keterangan = keterangan;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNim() {
        return nim;
    }

    public void setNim(String nim) {
        this.nim = nim;
    }

    public String getNamaMahasiswa() {
        return namaMahasiswa;
    }

    public void setNamaMahasiswa(String namaMahasiswa) {
        this.namaMahasiswa = namaMahasiswa;
    }

    public Date getTanggal() {
        return tanggal;
    }

    public void setTanggal(Date tanggal) {
        this.tanggal = tanggal;
    }

    public double getJumlah() {
        return jumlah;
    }

    public void setJumlah(double jumlah) {
        this.jumlah = jumlah;
    }

    public String getKeterangan() {
        return keterangan;
    }

    public void setKeterangan(String keterangan) {
        this.keterangan = keterangan;
    }

    
}