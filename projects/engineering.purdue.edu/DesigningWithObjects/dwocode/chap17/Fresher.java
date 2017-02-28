public class Fresher implements Hogwarts_Info {
	
    public FresherName name;
    public double aptitudeForBravery;
    public double aptitudeForWitAndKnowledge;
    public double howFairnessMinded;
    public double howGoalOriented;
    private int preferredHouseIndex;
    private HogwartsHouse preferredHouse;
    private int howStronglyPreferenceWanted;
    public double rankWeightedStrengthOfPreference;

    public Fresher( FresherName name ) {
        this.name = name;
        this.aptitudeForBravery = 50 + (int) (50 * Math.random());
        this.aptitudeForWitAndKnowledge = 
                                      50 + (int) (50 * Math.random());
        this.howFairnessMinded = 50 + (int) (50 * Math.random());
        this.howGoalOriented = 50 + (int) (50 * Math.random());
        this.preferredHouseIndex = (int) ( 4 * Math.random() );
        this.preferredHouse = 
                        HogwartsHouse.values()[ preferredHouseIndex ];
        this.howStronglyPreferenceWanted = 
                                       (int) (10 * Math.random() + 1);
    }
	
    public int getPreferredHouseIndex() {return preferredHouseIndex;}
    public int getHowStronglyPreferenceWanted() { 
        return howStronglyPreferenceWanted; 
    }
    public double getRankWeightedStrengthOfPreference() {
        return rankWeightedStrengthOfPreference;
    }
    public void setRankWeightedStrengthOfPreference(double val) {
        this.rankWeightedStrengthOfPreference = val;
    }
    public String toString() {
        String s = String.format( "%.2f", 
                                    rankWeightedStrengthOfPreference);
        return name + ":  Preferred House is " + preferredHouse 
                    + " with preference " +howStronglyPreferenceWanted 
                    + " and with rank-weighted preference " +  s;
    }
	
    public static void main( String[] args ) throws Exception {
        SortingHat<Fresher> sorter = new SortingHat<Fresher>();
        MagicCollection<Fresher> all_freshers = 
                                             new MagicList<Fresher>();
        for(int i=0; i<FresherName.values().length; i++) {
            all_freshers.add( 
                       new Fresher( FresherName.values()[i] ) );
        }
        sorter.makeInitialHousePlacements(all_freshers, 
                                       "getPreferredHouseIndex");
        System.out.println( "Initial house counts: "  
                                 +  sorter.getHouseCounts() );
        MagicCollection<Fresher> sortedFreshers = 
                sorter.sortAndRank( all_freshers,
                             "getHowStronglyPreferenceWanted", 
                             "setRankWeightedStrengthOfPreference" );
        sorter.makeHousePlacements(sortedFreshers, 
                                  "getPreferredHouseIndex", 
                                  "rankWeightedStrengthOfPreference");
        System.out.println( "Final house counts: "  
                                       +  sorter.getHouseCounts() );
        sorter.displayHousePlacements();
    }
}
