public interface Violations {
    public final int CannotResolveViolations = -1;
	
    public final int Blagging = 0;      // Seizing an opponent's broom.
    public final int Blatching = 1;     // Flying with the intent to 
                                        //   collide.
    public final int Blurting = 2;      // Locking broom handles to 
                                        //   steer opponent off course.
    public final int Bumphing = 3;      // Hitting a bludger towards
                                        //   the keepers or spectators.
                                        //   However, the former is
                                        //   allowed if the quaffle is 
                                        //   within the scoring area.
    public final int Cobbing = 4;       // Elbowing the opponents 
                                        //   excessively.
    public final int Flacking = 5;      // When a keeper defends a
                                        //   hoop from behind.
    public final int Haversacking = 6;  // A chaser still in contact 
                                        //   with the quaffle as it
                                        //   passes through a hoop.
    public final int QuafflePocking = 7;// When a chaser tampers with 
                                        //   the quaffle.
    public final int Stooging = 8;      // When more than one chaser 
                                        //   is in the scoring area
                                        //   at the same time.
    public final int PlayerLeavesBoundary = 9;
    public final int PushPlayerOffTheBroom = 10;
    public final int PissOffTheReferee = 11;
    public final int HitPlayerWithClub = 12;
    public final int BeaterHittingQuaffle = 13;
    public final int ThrowQuaffleOutOfBounds = 14;
    public final int NonSeekerContactingGoldenSnitch = 15;
    public final int FailureToReturnAfterTimeout = 16;
    public final int UsingWandToEnchantDuringPlay = 17;
    public final int TeamFoul = 18;
    public final int BroomTampering = 19;
    public final int TamperingWithRefereeBroom = 20;
	
    public final String[] printViolation = new String[]{"Blagging",    
                        "Blatching", "Blurting", "Bumphing", 
                        "Cobbing", "Flacking", "Haversacking", 
                        "QuafflePocking", "Stooging", 
                        "PlayerLeavesBoundary", 
                        "PushPlayerOffTheBroom", "PissOffTheReferee", 
                        "HitPlayerWithClub", "BeaterHittingQuaffle", 
                        "ThrowQuaffleOutOfBounds", 
                        "NonSeekerContactingGoldenSnitch", 
                        "FailureToReturnAfterTimeout", 
                        "UsingWandToEnchantDuringPlay", "TeamFoul", 
                        "BroomTampering", "TamperingWithRefereeBroom"};
}
