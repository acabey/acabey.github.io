public interface TrialElements  {	
	
    public static enum TrialState { 
                                 ChargeBeingFiled,
                                 EvidenceBeingPresented,
                                 WitnessesBeingQuestioned,
                                 WitnessBeingQuestionedByProsecution,
                                 WitnessBeingQuestionedByDefense,
                                 WitnessTestimoniesCompleted,
                                 JudgementBeingRendered,
                                 TrialCompleted
    }
	
    public static enum Charge { ConjuredPetronusInMugglePresence,
                                UsedHoverCharmOnMuggle,
                                OtherUnderageUsesOfMagic
    }
	
    public static enum Evidence { AccusedNotAtPlaceOfCrime,
                                  LifeOfAccusedInDanger;
    }
    
    public static enum Verdict { Guilty,  
                                 NotGuilty, 
                                 UnableToReachVerdict 
    }
}
