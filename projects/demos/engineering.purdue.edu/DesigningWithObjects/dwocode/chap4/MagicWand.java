import java.util.*;

public class MagicWand implements WandCores, Enchanted {
	
    public int idNum;
    public static int nextIdNum = 1; 
    
    private String owner;
    private String wizardExperienceLevel;
    private WandCore wandCore;
    
    public static final HashMap<String, WandCore>  
            experience_to_wandCore_mapping = 
                                         new HashMap<String,WandCore>();

    { experience_to_wandCore_mapping.put( "novice", 
                                          WandCore.phoenixTailFeather );
      experience_to_wandCore_mapping.put( "intermediate", 
                                          WandCore.unicornTailHair );
      experience_to_wandCore_mapping.put( "advanced", 
                                          WandCore.dragonHeartString );
    }

    public MagicWand() {
        idNum = nextIdNum++;
        wandCore= WandCore.veelaHair;
    }
    public MagicWand( String owner, WandCore core, 
                             String wizardExperienceLevel)  
                                  throws ArtifactCannotBeCreated {
        this();
        this.owner = owner;  
        this.wandCore = core;
        this.wizardExperienceLevel = wizardExperienceLevel;
        if ( !experience_to_wandCore_mapping.get( 
                      wizardExperienceLevel ).equals( core ) ) {
            throw new ArtifactCannotBeCreated( 
                       "wizard's experience not matched to the wand");
        }
     }

    public MagicWand( String owner ) {
        this();
        this.owner = owner;
    }    

    public String toString() {
        return "Wand Owner: " + owner + "        Wand Core: " 
                          + wandCore + "         Serial Num: " + idNum;
    }
  
    public int getIdNum() { return idNum; }
    public String getOwner() { return owner; }
    public String getWizardExperienceLevel() { 
        return wizardExperienceLevel; 
    }
}
