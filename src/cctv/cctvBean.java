package cctv;

import java.util.Date;

public class cctvBean {
    private int id;
    private Date cctvData;
    private String cctvFile;

    public cctvBean() {
    }

    public cctvBean(int id, Date cctvData, String cctvFile) {
        this.id = id;
        this.cctvData = cctvData;
        this.cctvFile = cctvFile;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCctvData() {
        return cctvData;
    }

    public void setCctvData(Date cctvData) {
        this.cctvData = cctvData;
    }


    public String getCctvFile() {
        return cctvFile;
    }

    public void setCctvFile(String cctvFile) {
        this.cctvFile = cctvFile;
    }

    @Override
    public String toString() {
        return cctvFile;
    }
}
