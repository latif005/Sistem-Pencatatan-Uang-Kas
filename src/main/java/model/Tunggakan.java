/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Tunggakan {
    private String nim;
    private String nama;
    private double totalDibayar;
    private double jumlahTunggakan;
    private String status; // "Lunas" atau "Nunggak"

    public Tunggakan(String nim, String nama, double totalDibayar, double jumlahTunggakan) {
        this.nim = nim;
        this.nama = nama;
        this.totalDibayar = totalDibayar;
        this.jumlahTunggakan = jumlahTunggakan;
        this.status = (jumlahTunggakan > 0) ? "Nunggak" : "Lunas";
    }

    // Getter
    public String getNim() { return nim; }
    public String getNama() { return nama; }
    public double getTotalDibayar() { return totalDibayar; }
    public double getJumlahTunggakan() { return jumlahTunggakan; }
    public String getStatus() { return status; }
}