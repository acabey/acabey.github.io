import java.util.*;

public class WitSharpeningPotionMaker extends PotionMaker {

    public Set<String> neededIngredients() {
        return new HashSet<String>(Arrays.asList("ginger_roots","scarab_beetles","armadillo_bile"));   
    }

    protected boolean prepareAndAddGingerRoots() 
               throws PotionMakingFeasibilityViolation { 
        ginger_roots = new Ingredient( "ginger_roots", "slicing");
        System.out.println( 
                        "Ginger roots sliced and added to the potion");
        return true;
    }
    protected boolean prepareAndAddScarabBeetles() 
               throws PotionMakingFeasibilityViolation {
        if ( ginger_roots == null ) {
            throw new PotionMakingFeasibilityViolation( 
                     "Ginger roots must be sliced and added before " 
                   + "scarab beetles can be added to the potion" );
        }
        scarab_beetles = new Ingredient( "scarab_beetles", "mashing");
        System.out.println( 
                     "Scarab beetles mashed and added to the potion");
        return true;		
    }
    protected boolean prepareAndAddArmadilloBile() 
               throws PotionMakingFeasibilityViolation { 
        if ( ginger_roots == null  |  scarab_beetles == null ) {
            throw new PotionMakingFeasibilityViolation( 
                  "Ginger roots and scarab beetles must be  added " 
                + "before armadillo bile can be added to the potion" );
        }
        armadillo_bile = new Ingredient( "armadillo_bile", 
                                         "measure out a cup");
        System.out.println( 
              "Armadillo bile measured out and added to the potion");
        return true;
    }
    public void makePotion() throws PotionMakingFeasibilityViolation{
        prepareAndAddGingerRoots();
        prepareAndAddScarabBeetles();
        prepareAndAddArmadilloBile();
    }
    public Potion getResult() {
        if ( ginger_roots != null   
                  &   scarab_beetles != null  
                  &  armadillo_bile != null ) {
            potionMade = new Potion( "Wit Sharpening Potion", 
               new ArrayList<Ingredient>( 
                Arrays.asList( ginger_roots, 
                               scarab_beetles, 
                               armadillo_bile)));
            System.out.println( 
                                  "\nWit sharpening potion made by "
                                + "WitSharpeningPotionMaker.java\n" );
            return potionMade;
        } else {
            System.out.println( 
                "WitSharpeningPotionMaker unable to make the potion" );
            return null;
        }
    }
}
