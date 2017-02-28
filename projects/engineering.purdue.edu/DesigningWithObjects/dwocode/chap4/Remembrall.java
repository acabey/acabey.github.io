public class Remembrall implements Enchanted {
    public int idNum;
    public static int nextIdNum = 1; 
    
    private String owner;
 	
    public Remembrall( String owner, boolean isSmokeAvailable, 
                       boolean isSmokeEnchanted ) 
                                    throws ArtifactCannotBeCreated {
        if (! isSmokeAvailable) { 
        	throw new ArtifactCannotBeCreated(
                  "Smoke not available for making a new remembrall");
        }
    	if (! isSmokeEnchanted) {
            throw new ArtifactCannotBeCreated( 
                      "Enchantment not available for the smoke" );
        }
        idNum = nextIdNum++;
        this.owner = owner;  
     }
    
    public String toString() {
        return "Remembrall owner: " + owner + "  Serial Num: " + idNum;
    }
  
    public int getIdNum() { return idNum; }
    public String getOwner() { return owner; }
}
