public abstract class Mediator implements TrialElements {
	   
    public static java.util.Map<TrialState, TrialState> transitions = 
                       new java.util.HashMap<TrialState,TrialState>();

    { 
        transitions.put( TrialState.ChargeBeingFiled, 
                         TrialState.WitnessesBeingQuestioned );
        transitions.put( TrialState.WitnessesBeingQuestioned,
                     TrialState.WitnessBeingQuestionedByProsecution );
        transitions.put( TrialState.WitnessesBeingQuestioned, 
                         TrialState.WitnessBeingQuestionedByDefense );
        transitions.put( 
                       TrialState.WitnessBeingQuestionedByProsecution,
                         TrialState.WitnessBeingQuestionedByDefense );
        transitions.put( TrialState.WitnessBeingQuestionedByDefense, 
                     TrialState.WitnessBeingQuestionedByProsecution );     
        transitions.put( 
                       TrialState.WitnessBeingQuestionedByProsecution, 
                         TrialState.WitnessTestimoniesCompleted );
        transitions.put( TrialState.WitnessBeingQuestionedByDefense, 
                         TrialState.WitnessTestimoniesCompleted );
        transitions.put( TrialState.WitnessTestimoniesCompleted, 
                         TrialState.JudgementBeingRendered );
        transitions.put( TrialState.JudgementBeingRendered, 
                         TrialState.TrialCompleted );
    };
  
    public abstract void setCurrentState( TrialState state );
    public abstract void setChargeAgainstAccused( Charge ch );
    public abstract void addNewWitness( Witness w );
    public abstract void setLeadWitness( Witness lw );
    public abstract void setAvailabilityOfDefenseWitnesses(boolean b);
    public abstract void setAvailabilityOfProsecutionWitnesses(
                                                           boolean b);
    public abstract Verdict getVerdict();
    public abstract TrialState getNextState( TrialState 
                                      currentState ) throws Exception;
}
