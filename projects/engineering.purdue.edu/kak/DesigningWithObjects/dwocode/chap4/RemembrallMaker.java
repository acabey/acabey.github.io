import java.util.Random;

public class RemembrallMaker implements ArtifactMaker {

    public Enchanted makeArtifact( String owner )  
                        throws ArtifactCannotBeCreated {
        Random rand = new Random();
        boolean isSmokeAvailable = rand.nextBoolean();
        boolean isSmokeEnchantmentAvailable= rand.nextBoolean();
        return  new Remembrall( owner, isSmokeAvailable, 
                                    isSmokeEnchantmentAvailable ); 
    }
}
