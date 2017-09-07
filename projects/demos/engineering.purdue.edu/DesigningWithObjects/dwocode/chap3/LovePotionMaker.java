import java.util.*;

public class LovePotionMaker extends PotionMaker {
	
    public Set<String> neededIngredients() {
        return new HashSet<String>(Arrays.asList("ashwinder_eggs","rose_thorns","peppermint"));   
    }

    protected boolean prepareAndAddAshwinderEggs() 
               throws PotionMakingFeasibilityViolation { 
        ashwinder_eggs = new Ingredient( "ashwinder_eggs", "frozen" );
        System.out.println( 
                        "Frozen ashwinder eggs added to the potion" );
        return true;
    }
    protected boolean prepareAndAddRoseThorns() 
               throws PotionMakingFeasibilityViolation { 
        if ( ashwinder_eggs == null ) {
               throw new PotionMakingFeasibilityViolation( 
                    "You must first add frozen ashwinder eggs " 
                  + "to the love potion before you can add rose "
                  + "thorns" );
        }
        rose_thorns = new Ingredient( "rose_thorns", "powdered" );
        System.out.println( "Rose thorns added to the potion" );
        return true;
    }
    protected boolean prepareAndAddPeppermint() 
               throws PotionMakingFeasibilityViolation { 
        if ( rose_thorns == null ) {
               throw new PotionMakingFeasibilityViolation( 
                     "Before you can add peppermint to the " +
                     "love potion, you must first add rose thorns" );
        }
        peppermint = new Ingredient( "peppermint", "powdered" );
        System.out.println( "Peppermint powder added to the potion" );
        return true;
    }
    protected boolean prepareAndAddMoonstone() 
               throws PotionMakingFeasibilityViolation { 
        if ( peppermint == null ) {
            throw new PotionMakingFeasibilityViolation( 
                     "YBefore you can add moonstone to the " +
                     "love potion, you must first add peppermint" );
        }
        moonstone = new Ingredient( "moonstone", "powdered");
        System.out.println( 
                        "Moonstone powdered and added to the potion");
        return true;
    }
    public void makePotion() throws PotionMakingFeasibilityViolation{
        prepareAndAddAshwinderEggs();
        prepareAndAddRoseThorns();
        prepareAndAddPeppermint();
        prepareAndAddMoonstone();
    }
    public Potion getResult() {
        if ( ashwinder_eggs != null &   
             rose_thorns != null  &  
             peppermint != null & 
             moonstone != null ) {
            potionMade = new Potion( "Love potion", 
                            new ArrayList<Ingredient>( 
                                 Arrays.asList( ashwinder_eggs,  
                                                rose_thorns, 
                                                peppermint,
                                                moonstone)));
            System.out.println( 
                      "\nLove potion made by LovePotionMaker.java\n" );
            return potionMade;
        } else {
            System.out.println( 
                         "LovePotionMaker unable to make the potion" );
            return null;
        }
    }
}
