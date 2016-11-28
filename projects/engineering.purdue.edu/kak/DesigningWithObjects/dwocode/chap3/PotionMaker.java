import java.util.*;

public abstract class PotionMaker {
	
    protected Ingredient ginger_roots; 
    protected Ingredient scarab_beetles; 
    protected Ingredient armadillo_bile; 
    protected Ingredient hellebore;  
    protected Ingredient moonstone;  
    protected Ingredient ashwinder_eggs; 
    protected Ingredient rose_thorns; 
    protected Ingredient peppermint; 
	
    protected Potion potionMade;

    public abstract Set<String> neededIngredients();
	
    protected boolean prepareAndAddGingerRoots() 
           throws PotionMakingFeasibilityViolation { return false; }
    protected boolean prepareAndAddScarabBeetles() 
           throws PotionMakingFeasibilityViolation { return false; }
    protected boolean prepareAndAddArmadilloBile() 
           throws PotionMakingFeasibilityViolation { return false; }
    protected boolean prepareAndAddHellebore() 
           throws PotionMakingFeasibilityViolation { return false; }
    protected boolean prepareAndAddAshwinderEggs() 
           throws PotionMakingFeasibilityViolation { return false; }
    protected boolean prepareAndAddRoseThorns() 
           throws PotionMakingFeasibilityViolation { return false; }
    protected boolean prepareAndAddPeppermint() 
           throws PotionMakingFeasibilityViolation { return false; }
    protected boolean prepareAndAddMoonstone() 
           throws PotionMakingFeasibilityViolation { return false; }
    public abstract void makePotion() 
           throws PotionMakingFeasibilityViolation;
    public abstract Potion getResult();
}
