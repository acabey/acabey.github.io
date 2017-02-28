public class Witness implements TrialElements {
    private String name;
    private Evidence testimony;
    private String whoseWitness;
    public boolean initialTestimonyPresented = false;
    public boolean testimonyCorroboratedUponExamination;
    public Witness(String name, Evidence testimony, String whoseSide) {
        this.name = name; 
        this.testimony = testimony;
        this.whoseWitness = whoseSide;
    }
    public String getWhoseWitness() {
        return whoseWitness;
    }
    public Evidence getTestimony() { return testimony; }
    public String toString() { return name; }
}
