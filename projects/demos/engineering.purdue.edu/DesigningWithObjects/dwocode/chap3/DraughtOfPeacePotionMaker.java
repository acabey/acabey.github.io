import java.util.*;

public class DraughtOfPeacePotionMaker extends PotionMaker {

    public Set<String> neededIngredients() {
        return new HashSet<String>(Arrays.asList("moonstone","hellebore"));   
    }
	
    protected boolean prepareAndAddMoonstone() 
                      throws PotionMakingFeasibilityViolation { 
        moonstone = new Ingredient( "moonstone", "to be powdered");
        System.out.println( "Moonstone powdered and added to the potion");
        System.out.println( "Stirred potion three times counterclockwise");
        System.out.println( "Allowed the potion to simmer for exactly "
                                                       + "seven minutes");
        return true;
    }
    protected boolean prepareAndAddHellebore() 
                 throws PotionMakingFeasibilityViolation {
        if ( moonstone == null ) {
            throw new PotionMakingFeasibilityViolation( 
                       "\nMoonstone must be powdered and added " 
                     + "before hellebore can be added to the potion.\n" );
        }
        hellebore = new Ingredient( "hellebore", "add as a syrup");
        System.out.println( 
            "Added two drops of the syrup of hellebore to the potion");
        return true;		
    }
    public void makePotion() throws PotionMakingFeasibilityViolation{
        prepareAndAddMoonstone();
        prepareAndAddHellebore();
    }
    public Potion getResult() {
        if ( moonstone != null   &   hellebore != null ) {
            potionMade = new Potion( "Draught Of Peace", 
            new ArrayList<Ingredient>( Arrays.asList( moonstone, 
                                                      hellebore )));
            System.out.println( 
               "\nDraught of Peace Potion made by "
                                 + "DraughtOfPeacePotionMaker.java\n" );
            return potionMade;
        } else {
            System.out.println( 
                "DraughtOfPeacePotionMaker unable to make the potion" );
            return null;
        }
    }
}
