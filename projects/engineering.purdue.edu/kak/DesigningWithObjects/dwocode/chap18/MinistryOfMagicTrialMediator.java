import java.util.*;

public  class MinistryOfMagicTrialMediator extends Mediator 
                                            implements TrialElements {
    private TrialState currentState;
    private Charge charge;
    private Set<Witness>  setOfWitnesses = new HashSet<Witness>();
    private Set<Witness>  witnessesHeardByTheCourt = 
                                               new HashSet<Witness>();
    private boolean defenseWitnessesAvailable;
    private boolean prosecutionWitnessesAvailable;
    private Witness leadWitness;
    private Witness currentWitness;
    private Verdict verdict;
    
    public void setCurrentState( TrialState state ) { 
        currentState = state; 
    }
    public void setChargeAgainstAccused( Charge ch ) { charge = ch; }
    public void setAvailabilityOfDefenseWitnesses(boolean b) { 
        defenseWitnessesAvailable = b; 
    }
    public void setAvailabilityOfProsecutionWitnesses(boolean b) { 
        prosecutionWitnessesAvailable = b; 
    }
    public void setLeadWitness( Witness lw ) { leadWitness = lw; }
    public Verdict getVerdict() { return verdict; }
    public void addNewWitness( Witness wt ) { 
        setOfWitnesses.add( wt ); 
    }
	
    public TrialState getNextState( TrialState currentState ) 
                                                  throws Exception {
        if ( currentState == TrialState.ChargeBeingFiled ) {
            List<Charge> listOfCharges = 
                                     Arrays.asList( Charge.values() );
            Set<Charge> setOfCharges = 
                                 new HashSet<Charge>( listOfCharges );
            if (! setOfCharges.contains( charge ) ) {
                throw new Exception( 
                        "Charge against the accused not recognized" );
            }
        } else if ( currentState == 
                               TrialState.WitnessesBeingQuestioned ) {
            System.out.println("List of all witnesses: " 
                                                   + setOfWitnesses );
            System.out.println("The remaining witnesses available: " 
                              + remainingWitnesses() );
            if (remainingWitnesses().size() > 0) {
                if (leadWitness != null) {
                    currentWitness = leadWitness;
                    leadWitness = null;
                } else {
                    currentWitness = 
                          (Witness) remainingWitnesses().toArray()[0];
                }
                witnessesHeardByTheCourt.add(currentWitness);
                System.out.println("Next witness to be questioned: " 
                                        + currentWitness);
            } else {
                return TrialState.WitnessTestimoniesCompleted;
            }
            if (currentWitness.getWhoseWitness() == "prosecution") {
                System.out.println(
                              "    This is a prosecution witness --- "
                                   + "will be questioned by defense");
                return TrialState.WitnessBeingQuestionedByDefense;
            } else {
                System.out.println("   This is a defense witness --- "
                               + "will be questioned by prosecution");
                return TrialState.WitnessBeingQuestionedByProsecution;
            }
        } else if ( currentState == 
                TrialState.WitnessBeingQuestionedByProsecution ) {
            System.out.println("    DEFENSE WITNESS: Witness being "
                             + "questioned by prosecution: " 
                             + currentWitness);      		
            if ( !currentWitness.initialTestimonyPresented )  {
                currentWitness.initialTestimonyPresented = true;
                currentWitness.testimonyCorroboratedUponExamination =
                  corroborateWitnessTestimony( 
                                      currentWitness.getTestimony() );
            } else {
                throw new Exception( "Something has gone wrong with "
                              + "the sequencing of court procedures");
            }
            return TrialState.WitnessesBeingQuestioned;
        } else if ( currentState == 
                        TrialState.WitnessBeingQuestionedByDefense ) {
            System.out.println("PROSECUTION WITNESS: Witness being " 
                             + "questioned by defense: " 
                             + currentWitness);  
            if ( !currentWitness.initialTestimonyPresented )  {
                currentWitness.initialTestimonyPresented = true;
                currentWitness.testimonyCorroboratedUponExamination =
                  corroborateWitnessTestimony( 
                                      currentWitness.getTestimony() );
            } else {
                throw new Exception( "Something has gone wrong with "
                              + "the sequencing of court procedures");
            }
            return TrialState.WitnessesBeingQuestioned;
        } else if ( currentState == 
                            TrialState.WitnessTestimoniesCompleted ) {
      		return TrialState.JudgementBeingRendered;
      	} else if  ( currentState == 
                                 TrialState.JudgementBeingRendered ) {
            boolean prosecutionWitnesses = true;
            boolean defenseWitnesses = true;
            for (Witness wit : setOfWitnesses ) {
                if ( wit.getWhoseWitness() == "prosecution" )  {
                    if (wit.testimonyCorroboratedUponExamination) {
                        continue;
                    } else {
                        prosecutionWitnesses = false;
                    }
                } else if ( wit.getWhoseWitness() == "defense" )  {
                    if (wit.testimonyCorroboratedUponExamination) {
                        continue;
                    } else {
                        defenseWitnesses = false;
                    }
                }
            }
            if ( (!prosecutionWitnessesAvailable ) 
                                     & (defenseWitnesses == true) ) {
                verdict = Verdict.NotGuilty;
            } else if ( (!prosecutionWitnessesAvailable ) 
                                    & (defenseWitnesses == false) ) {
                verdict = Verdict.Guilty;
            } else if ( (!defenseWitnessesAvailable ) 
                                 & (prosecutionWitnesses == true) ) {
                verdict = Verdict.Guilty;
            } else if ( (!defenseWitnessesAvailable ) 
                                & (prosecutionWitnesses == false) ) {
                verdict = Verdict.NotGuilty;
            } else if ( (prosecutionWitnesses == true) 
                                    & (defenseWitnesses == false) ) {
                verdict = Verdict.Guilty;
            } else if ( (prosecutionWitnesses == false) 
                                     & (defenseWitnesses == true) ) {
                verdict = Verdict.NotGuilty;
            } else {
                verdict = Verdict.UnableToReachVerdict;
            }
        }
        return transitions.get( currentState );
    }
    
    public boolean corroborateWitnessTestimony( Evidence testimony ) {
        // This is just a place-holder at the moment since the logic
        // encoded here would not be important to demonstrating the
        // main ideas of the Mediator pattern.
    	return true;
    }
    
    public Set<Witness>   remainingWitnesses() {
        Set<Witness> remaining = new HashSet<Witness>();
        for ( Witness w : setOfWitnesses ) {
            if ( ! witnessesHeardByTheCourt.contains(w) ) {
                remaining.add(w);
            }
        }
        return remaining;
    }
}
