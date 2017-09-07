import java.util.*;

public class Director {

    private static Set<String> all_ingredients = 
        new HashSet<String>(Arrays.asList("ginger_roots","scarab_beetles",
                                          "armadillo_bile","hellebore",
                                          "moonstone","ashwinder_eggs", 
                                          "rose_thorns","peppermint"));
    private static Set<String> update_available_ingredients() {
        Set<String> availables = new HashSet<String>();
        Iterator<String> iter = all_ingredients.iterator();
        while (iter.hasNext()) {
            String ingredient = iter.next();
            if (Math.random() < 0.7) {
                availables.add(ingredient);
            }
        }                    
        return availables;
    }

    public static void  makePotion( String clientRequest ) {
        PotionMaker potionMaker = null;
        if ( clientRequest.equalsIgnoreCase("Wit Sharpening Potion")){
            System.out.println("\n\nDIRECTOR will try to get the Wit " + 
                               "Sharpening Potion made\n");
            Set<String> availableIngredients = update_available_ingredients();
            potionMaker = new WitSharpeningPotionMaker();
            Set<String> neededIngredients = potionMaker.neededIngredients();
            System.out.println("   NEEDED INGREDIENTS: " + neededIngredients);
            System.out.println("   Available ingredients: " 
                                                      + availableIngredients);
            while (!availableIngredients.containsAll( neededIngredients ) ) {
                try {
                    Thread.sleep(3000);
                } catch(InterruptedException e){}
                availableIngredients = update_available_ingredients();
                System.out.println("   Available ingredients: " 
                                                      + availableIngredients);
            }
        } else if (clientRequest.equalsIgnoreCase(
                                          "Draught of Peace Potion")){
            System.out.println("\n\nDIRECTOR will try to get the Draught "
                             + "of Peace Potion made\n");
            Set<String> availableIngredients = update_available_ingredients();
            potionMaker = new DraughtOfPeacePotionMaker();
            Set<String> neededIngredients = potionMaker.neededIngredients();
            System.out.println("   NEEDED INGREDIENTS: " + neededIngredients);
            System.out.println("   Available ingredients: " + 
                                                        availableIngredients);
            while (!availableIngredients.containsAll( neededIngredients ) ) {
                try {
                    Thread.sleep(3000);
                } catch(InterruptedException e){}
                availableIngredients = update_available_ingredients();
                System.out.println("   Available ingredients: " + 
                                                        availableIngredients);
            }
        } else if ( clientRequest.equalsIgnoreCase("Love Potion") ) {
            System.out.println("\n\nDIRECTOR will try to get the Love Potion "
                                                                + "made\n");
            Set<String> availableIngredients = update_available_ingredients();
            potionMaker = new LovePotionMaker();
            Set<String> neededIngredients = potionMaker.neededIngredients();
            System.out.println("   NEEDED INGREDIENTS: " + neededIngredients);
            System.out.println("   Available ingredients: " + 
                                                        availableIngredients);
            while (!availableIngredients.containsAll( neededIngredients ) ) {
                try {
                    Thread.sleep(3000);
                } catch(InterruptedException e){}
                availableIngredients = update_available_ingredients();
                System.out.println("   Available ingredients: " + 
                                                        availableIngredients);
            }
        } else {
            System.out.println( 
                           "Client request not understood. Exiting" );
            System.exit(0);
        }
        System.out.println("  \nDIRECTOR now has all the needed ingredients\n");
        try {
            potionMaker.makePotion();
            potionMaker.getResult();
        } catch( PotionMakingFeasibilityViolation e ) {
            System.out.println( e.getMessage() );
        }
    }
}
