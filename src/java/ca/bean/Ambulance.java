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
public class Ambulance {
    private int ambulanceNo;
    private String driverName;
    private int userId;
    private double contactNo;
    private String status;
    private String location;

    /**
     * @return the ambulanceNo
     */
    public int getAmbulanceNo() {
        return ambulanceNo;
    }

    /**
     * @param ambulanceNo the ambulanceNo to set
     */
    public void setAmbulanceNo(int ambulanceNo) {
        this.ambulanceNo = ambulanceNo;
    }

    /**
     * @return the driverName
     */
    public String getDriverName() {
        return driverName;
    }

    /**
     * @param driverName the driverName to set
     */
    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    /**
     * @return the userId
     */
    public int getUserId() {
        return userId;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }

    /**
     * @return the contactNo
     */
    public double getContactNo() {
        return contactNo;
    }

    /**
     * @param contactNo the contactNo to set
     */
    public void setContactNo(double contactNo) {
        this.contactNo = contactNo;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the location
     */
    public String getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(String location) {
        this.location = location;
    }
}
