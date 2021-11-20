/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ca.bean;

/**
 *
 * @author hp
 */
public class MedicalSupplies {
    private int medId;
    private String medName;
    private int stock;
    private String expirationDate;
    private double price;

    /**
     * @return the medId
     */
    public int getMedId() {
        return medId;
    }

    /**
     * @param medId the medId to set
     */
    public void setMedId(int medId) {
        this.medId = medId;
    }

    /**
     * @return the medName
     */
    public String getMedName() {
        return medName;
    }

    /**
     * @param medName the medName to set
     */
    public void setMedName(String medName) {
        this.medName = medName;
    }

    /**
     * @return the stock
     */
    public int getStock() {
        return stock;
    }

    /**
     * @param stock the stock to set
     */
    public void setStock(int stock) {
        this.stock = stock;
    }

    /**
     * @return the expirationDate
     */
    public String getExpirationDate() {
        return expirationDate;
    }

    /**
     * @param expirationDate the expirationDate to set
     */
    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

    
}
