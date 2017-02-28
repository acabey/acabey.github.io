import java.util.*;

public class MagicWandMaker implements ArtifactMaker, WandCores {

    public Enchanted makeArtifact( String owner ) 
                                   throws ArtifactCannotBeCreated {
        System.out.println( 
        "\n\nEnter the experience level of the wizard as \"novice\","  
               + " \"intermediate\", \"advanced\", or \"unknown\" ");
        Scanner sc = new Scanner(System.in);
        String experienceLevel = sc.next();
        return makeArtifact( owner, experienceLevel );
    }
	
    public Enchanted makeArtifact( String owner, 
          String experienceLevel ) throws ArtifactCannotBeCreated {
        if ( experienceLevel.equals( "novice" ) ) {
            // Call procedures for checking on the availability 
            //     of phoenix tail feathers.
            // If successful, call the return below, otherwise 
            //     throw exception.
            return new MagicWand( owner, 
                                  WandCore.phoenixTailFeather,  
                                  experienceLevel );
        } else if ( experienceLevel.equals( "intermediate" ) ) {
            // Call procedures for checking on the availability 
            //     of unicorn tail hairs.
            // If successful, call the return below, otherwise 
            //     throw exception.
           return new MagicWand(owner,
                                WandCore.unicornTailHair,
                                experienceLevel );
        } else  if ( experienceLevel.equals( "advanced" ) ) {
            // Call procedures for checking on the availability 
            //     of dragon heart strings.
            // If successful, call the return below, otherwise 
            //     throw exception.
            return new MagicWand( owner, 
                                  WandCore.dragonHeartString, 
                                  experienceLevel );
        } else {
            // Either the user entered an unrecognizable string or
            // nothing at all in response to the prompt for 
            // experience level:
            return new MagicWand( owner );
        }
    }
}
