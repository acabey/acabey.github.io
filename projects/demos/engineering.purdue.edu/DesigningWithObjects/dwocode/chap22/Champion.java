public class Champion {
    private String name;
    private StrategyAbstractRoot strategy;
    private boolean hasSolutionForBreathingUnderwater = true;
    private boolean hasSolutionForKeepingGrindylowsAtBay = true;
    private boolean canLocateHostage = true;
    private boolean canFreeHostage = true;
    private boolean canDealWithMerpeople = true;
	
    public Champion( String name, StrategyAbstractRoot strategy ) {
        this.name = name;
        this.strategy = strategy;
    }
    public String getName() {
        return name;
    }
    public StrategyAbstractRoot getStrategy() {
        return strategy;
    }
    public void setHasSolutionForBreathingUnderwater( boolean b ) {
        hasSolutionForBreathingUnderwater = b;
    }
    public boolean getHasSolutionForBreathingUnderwater( ) {
        return hasSolutionForBreathingUnderwater;
    }
    public void setHasSolutionForKeepingGrindylowsAtBay( boolean b ) {
        hasSolutionForKeepingGrindylowsAtBay = b;
    }
    public boolean getHasSolutionForKeepingGrindylowsAtBay( ) {
        return hasSolutionForKeepingGrindylowsAtBay;
    }
    public void setcanLocateHostage( boolean b ) {
        canLocateHostage = b;
    }
    public boolean getcanLocateHostage() {
        return canLocateHostage;
    }
    public void canFreeHostage(boolean b) {
        canFreeHostage = b;
    }
    public boolean getCanFreeHostage() {
        return canFreeHostage;
    }
    public void canDealWithMerpeople(boolean b) {
        canDealWithMerpeople = b;
    }
    public boolean getCanDealWithMerpeople() {
        return canDealWithMerpeople;
    }
}
