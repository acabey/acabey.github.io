import java.util.*;

public class Test implements Violations{

    public static void main(String[] args) {
        Headmaster headmaster = 
                    Headmaster.makeInstanceOfHeadmaster("Dumbledore");
        DeputyHeadmaster  deputyHead = 
         DeputyHeadmaster.makeInstanceOfDeputyHeadmaster("McGonagall",
                                                          headmaster);
        Teacher teacher = new Teacher( "Rolanda Hooch", deputyHead );
        Referee referee = new Referee( "Severus Snape", teacher );
		
        System.out.println(
                  "For player Harry Potter (Violation: Blatching): ");
        Player p1 = new Player( "Harry Potter", "seeker", referee );
        p1.resolveViolation( Blatching );
		
        System.out.println("\n\nFor player Angelina Johnson " +
                                       "(Violation: Haversacking): ");
        Player p2 = new Player("Angelina Johnson", "chaser", referee);
        p2.resolveViolation( Haversacking );

        System.out.println("\n\nFor player Dracy Molfoy " 
                           + "(Violation: Using Wand During Play): ");
        Player p3 = new Player( "Draco Malfoy", "seeker",
                     new ArrayList<Adjudicator>( 
                      Arrays.asList( referee, teacher, deputyHead )));
        p3.resolveViolation(UsingWandToEnchantDuringPlay);
		
        System.out.println("\n\nFor player Viktor Krum "
                                  + "(Violation: Broom Tampering): ");
        Player p4 = new Player("Viktor Krum","seeker", 
                     new ArrayList<Adjudicator>( 
                      Arrays.asList( referee, teacher, deputyHead )));
        p4.resolveViolation(BroomTampering);
		
        System.out.println("\n\nFor player Fred Weasley "
                             + "(Violation: Piss off the referee): ");
        Player p5 = new Player( "Fred Weasley", "Blind Side Beater", 
                     new ArrayList<Adjudicator>( 
                      Arrays.asList( referee, teacher, deputyHead )));
        p5.resolveViolation(PissOffTheReferee);
    }
}
