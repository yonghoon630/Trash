package open;

import java.sql.Timestamp;
import java.util.Date;

public class openBean {
    private String id;
    private String trashCanId;
    private Timestamp openTime;
    private boolean isOpen;
    private int idx;
    
    public int getIdx() {
        return idx;
    }
    
    public void setIdx(int idx) {
        this.idx = idx;
    }
    
    public String getId() {
        return id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    
    public String getTrashCanId() {
        return trashCanId;
    }
    
    public void setTrashCanId(String trashCanId) {
        this.trashCanId = trashCanId;
    }
    
    public Timestamp getOpenTime() {
        return openTime;
    }

    public void setOpenTime(Timestamp openTime) {
        this.openTime =  openTime;
    }
    
   
}
