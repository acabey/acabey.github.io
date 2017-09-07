public abstract class EndOfSummerStories {

    public String endOfSummerHolidays() {
        String howDidSummerEnd   =   endOfSummerWithDursleys();
        String acquiringSchoolSupplies  =  acquiringSchoolSupplies();
        return "\nLeaving Dursleys at the end of summer: " 
             + howDidSummerEnd + "\n"  + acquiringSchoolSupplies;
    }
    protected String endOfSummerWithDursleys() { return null; }
    protected String acquiringSchoolSupplies() { return null; }
	  
    public String travelToHogwarts() {
        String goToStationScript  =   tripToKingsCrossStation();
        String platformScript     =   
                                   gettingToPlatformNineThreeFourth();
        String boardTrainScript   =   journeyToHogwarts();
        return "\nTravel to Hogwarts: " + goToStationScript 
             + "\n" + platformScript + "\n" + boardTrainScript;
    }
    protected String tripToKingsCrossStation(){ return null; }
    protected String gettingToPlatformNineThreeFourth() {return null;}
    protected String journeyToHogwarts() { return null; }
	  
    public String welcomeCeremonyAtHogwarts() {
        String speech = welcomeSpeechByDumbledore();
        String sortingHatNarrative =  assignNewStudentsToHouses();
        String feastScript   =  startOfTermFeast();
        return "\nWelcome ceremony at Hogwarts: " 
          +  speech + "\n" + sortingHatNarrative + "\n" + feastScript;
    }
    protected String welcomeSpeechByDumbledore() { return null; }
    protected String assignNewStudentsToHouses() { return null; }
    protected String startOfTermFeast() { return null; }
}
