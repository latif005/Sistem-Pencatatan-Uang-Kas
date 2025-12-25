/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

public class Pengeluaran {
    private int id;
    private Date tanggal;
    private double jumlah;
    private String keperluan;

    public Pengeluaran() {}

    public Pengeluaran(Date tanggal, double jumlah, String keperluan) {
        this.tanggal = tanggal;
        this.jumlah = jumlah;
        this.keperluan = keperluan;
    }

    // Getter Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Date getTanggal() { return tanggal; }
    public void setTanggal(Date tanggal) { this.tanggal = tanggal; }

    public double getJumlah() { return jumlah; }
    public void setJumlah(double jumlah) { this.jumlah = jumlah; }

    public String getKeperluan() { return keperluan; }
    public void setKeperluan(String keperluan) { this.keperluan = keperluan; }
}