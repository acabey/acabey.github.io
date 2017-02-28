public class GillyweedStrategy extends StrategyAbstractRoot {

    public String breathingUnderwater() {
        return "Eat gillyweed just prior to entering water";
    }
    public String keepingGrindylowsAtBay() {
        return "Cast the Relashio spell on grindylows; Ordinarily "
             + "this spell releases a shower of fiery sparks from "
             + "the tip of the wand and attack the enemy; "
             + "Underwater, the wand releases jets of boiling "
             + "water. ";
    }
    public String locatingHostage(){
        return "Ask magical creatures underwater for directions "
             + "--- especially Moaning Myrtle";
    }
    public String freeingHostage() {
        return "Use a sharp rock to the cut the ropes used to tie "
             + "the hostage";
    }
    public String dealingWithMerPeople() {
        return "Threaten merpeople by pointing your wand at them";
    }
}
