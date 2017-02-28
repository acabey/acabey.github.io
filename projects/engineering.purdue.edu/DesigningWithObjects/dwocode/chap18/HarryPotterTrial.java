public class HarryPotterTrial implements Trial {	
    private Mediator mediator;
    private TrialState currentState;
    private  TrialState nextState;
    public HarryPotterTrial() {
        mediator = new MinistryOfMagicTrialMediator();
        mediator.setChargeAgainstAccused(
                             Charge.ConjuredPetronusInMugglePresence);
        mediator.setAvailabilityOfDefenseWitnesses(true);
        mediator.setAvailabilityOfProsecutionWitnesses(false);
    }
    public void addNewWitness(Witness w) {
        mediator.addNewWitness(w);
    }
    public void setLeadWitness(Witness lw) {
        mediator.setLeadWitness( lw );
    }
    public TrialState getNextTrialState( TrialState currentState ) 
                                                   throws Exception {
        return mediator.getNextState( currentState );
    }
    public void setCurrentTrialState( TrialState state ) {
        currentState = state;
        mediator.setCurrentState( state );
    }
    public Verdict getTrialVerdict() {
        return mediator.getVerdict();
    }
	
    public static void main(String[] args) {
        try {
            HarryPotterTrial trial = new HarryPotterTrial();
            Witness dumbledore = new Witness( "Dumbledore", 
                           Evidence.LifeOfAccusedInDanger, "defense");
            Witness figg = new Witness( "Figg", 
                           Evidence.LifeOfAccusedInDanger, "defense");
            trial.addNewWitness( dumbledore );
            trial.addNewWitness( figg );
            trial.setLeadWitness(dumbledore);
            trial.setCurrentTrialState(TrialState.ChargeBeingFiled);
            while (trial.currentState != TrialState.TrialCompleted) {
                trial.nextState = 
                          trial.getNextTrialState(trial.currentState);
                trial.setCurrentTrialState( trial.nextState );
            }
            System.out.println( "The final trial state is: " 
                                                  + trial.nextState );
            System.out.println( "The verdict is: " 
                                          + trial.getTrialVerdict() );
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
