/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Mahasiswa {
    private String nim;
    private String nama;
    private String password;
    private String angkatan;

    public Mahasiswa() {}

    public Mahasiswa(String nim, String nama, String password, String angkatan) {
        this.nim = nim;
        this.nama = nama;
        this.password = password;
        this.angkatan = angkatan;
    }

    // Getter & Setter
    public String getNim() { return nim; }
    public void setNim(String nim) { this.nim = nim; }

    public String getNama() { return nama; }
    public void setNama(String nama) { this.nama = nama; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getAngkatan() { return angkatan; }
    public void setAngkatan(String angkatan) { this.angkatan = angkatan; }
}