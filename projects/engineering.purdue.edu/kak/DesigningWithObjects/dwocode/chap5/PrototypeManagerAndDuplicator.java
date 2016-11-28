public final class PrototypeManagerAndDuplicator {
    private Dragon prototype_ChineseFireball;
    private Dragon prototype_HungarianHorntail;
    private Dragon prototype_CommonWelshGreen;
    private Dragon prototype_NorwegianRidgeback;
    private Dragon prototype_HebrideanBlack;
    private Dragon prototype_PeruvianVipertooth;
    private Dragon prototype_RomanianLonghorn;
    private Dragon prototype_SwedishShortSnout;
    
    public PrototypeManagerAndDuplicator() {
    	try {
            prototype_ChineseFireball = 
                       Dragon.makeNewDragonInstance("Chinese Fireball");
            prototype_HungarianHorntail = 
                     Dragon.makeNewDragonInstance("Hungarian Horntail");
            prototype_CommonWelshGreen= 
                     Dragon.makeNewDragonInstance("Common Welsh Green");
            prototype_NorwegianRidgeback = 
                    Dragon.makeNewDragonInstance("Norwegian Ridgeback");
            prototype_HebrideanBlack = 
                        Dragon.makeNewDragonInstance("Hebridean Black");
            prototype_PeruvianVipertooth = 
                    Dragon.makeNewDragonInstance("Peruvian Vipertooth");
            prototype_RomanianLonghorn = 
                      Dragon.makeNewDragonInstance("Romanian Longhorn");
            prototype_SwedishShortSnout = 
                    Dragon.makeNewDragonInstance("Swedish Short-Snout");
        } catch( UnknownDragonException e ) {
            e.printStackTrace();
            System.exit(1);
        }
     }
    public Dragon conjure_ChineseFireball() {
        Dragon d = null;
        try {
            d = (Dragon) prototype_ChineseFireball.clone();
        } catch( CloneNotSupportedException e) {}
        return d;
    }
    public Dragon conjure_HungarianHorntail() {
        Dragon d = null;
        try {
            d = (Dragon) prototype_HungarianHorntail.clone();
        } catch( CloneNotSupportedException e) {}
        return d;
    }
    public Dragon conjure_CommonWelshGreen() {
        Dragon d = null;
        try {
            d = (Dragon) prototype_CommonWelshGreen.clone();
        } catch( CloneNotSupportedException e) {}
        return d;
    }
    public Dragon conjure_NorwegianRidgeback() {
        Dragon d = null;
        try {
            d = (Dragon) prototype_NorwegianRidgeback.clone();
        } catch( CloneNotSupportedException e) {}
        return d;
    }
    public Dragon conjure_HebrideanBlack() {
        Dragon d = null;
        try {
            d = (Dragon) prototype_HebrideanBlack.clone();
        } catch( CloneNotSupportedException e) {}
        return d;
    }
    public Dragon conjure_PeruvianVipertooth() {
        Dragon d = null;
        try {
            d = (Dragon) prototype_PeruvianVipertooth.clone();
        } catch( CloneNotSupportedException e) {}
        return d;
    }
    public Dragon conjure_RomanianLonghorn() {
        Dragon d = null;
        try {
            d = (Dragon) prototype_RomanianLonghorn.clone();
        } catch( CloneNotSupportedException e) {}
        return d;
    }
    public Dragon conjure_SwedishShortSnout() {
        Dragon d = null;
        try {
            d = (Dragon) prototype_SwedishShortSnout.clone();
        } catch( CloneNotSupportedException e) {}
        return d;
    }
    
    public Dragon conjure( String whatType ) 
                                     throws UnknownDragonException {
    	if ( whatType.equals( "Chinese Fireball" ) ) {
    	    return conjure_ChineseFireball();
    	} else if ( whatType.equals( "Hungarian Horntail" ) ) {
            return conjure_HungarianHorntail();
    	} else if ( whatType.equals( "Common Welsh Green" ) ) {
            return conjure_CommonWelshGreen();	
       	} else if ( whatType.equals( "Norwegian Ridgeback" ) ) {
            return conjure_NorwegianRidgeback();	
      	} else if ( whatType.equals( "Hebridean Black" ) ) {
            return conjure_HebrideanBlack();	
      	} else if ( whatType.equals( "Peruvian Vipertooth" ) ) {
            return conjure_PeruvianVipertooth();	
      	} else if ( whatType.equals( "Romanian Longhorn" ) ) {
            return conjure_RomanianLonghorn();	
      	} else if ( whatType.equals( "Swedish Short-Snout" ) ) {
            return conjure_SwedishShortSnout();		
    	} else {
            throw new UnknownDragonException( 
                                     "Unknown dragon type called for" );
        }
    }
}
