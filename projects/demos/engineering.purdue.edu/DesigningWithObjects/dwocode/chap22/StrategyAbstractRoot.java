import java.util.*;

public abstract class StrategyAbstractRoot {
	
    protected Champion competitor;
    protected String firstProblem = "breathingUnderwater";
	
    protected static Map<String,String> problemSequencer = 
                                  new HashMap<String,String>();
	   
    {
        problemSequencer.put("breathingUnderwater", 
                                            "keepingGrindylowsAtBay");
        problemSequencer.put("keepingGrindylowsAtBay", 
                                                   "locatingHostage");
        problemSequencer.put("locatingHostage", "freeingHostage");
        problemSequencer.put("freeingHostate",
                                              "dealingWithMerpeople"); 
    }
	   
    public static String getNextProblem( String problem ){
        return problemSequencer.get(problem);
    }
    public String invokeSolution(String problem, Champion champ) {
        if (problem == "breathingUnderwater" 
              && champ.getHasSolutionForBreathingUnderwater()  ) {
            return this.breathingUnderwater();
        } else if (problem == "keepingGrindylowsAtBay" 
              && champ.getHasSolutionForKeepingGrindylowsAtBay()  ) {
            return this.keepingGrindylowsAtBay();
        } else if (problem == "locatingHostage"  
              && champ.getcanLocateHostage() ) {
            return this.locatingHostage();
        } else if (problem == "freeingHostage"   
              &&  champ.getCanFreeHostage() ) {
            return this.freeingHostage();
        } else if (problem == "dealingWithMerpeople"  
              &&   champ.getCanDealWithMerpeople()  ) {
            return this.dealingWithMerpeople();	    		
        } else {
            return null;
        }
    }
    public String getFirstProblem() { return firstProblem; }
    public String breathingUnderwater(){ return null; }
    public String keepingGrindylowsAtBay() { return null; }
    public String locatingHostage() { return null; }
    public String freeingHostage() { return null; }
    public String dealingWithMerpeople() { return null; }
}
