import java.util.*;

public class Client {
	
    public static void main(String[] args) {
        String latestStoryline;
        Map<Integer, HogwartsHappening.Memento> savedStates = 
                    new HashMap<Integer, HogwartsHappening.Memento>();
		
        // At clockTick 0:
        latestStoryline = "This is the beginning of the story of " 
                        + "Buckbeak coming close to being put\n"
                        + "to death and his eventual escape "
                        + "with help from Harry and\n"
                        + "Hermione";
        HogwartsHappening hh = 
                          new HogwartsHappening( 0, latestStoryline );
        savedStates.put( 0, hh.saveStateToMemento() );
		
        //THE ORIGINAL SEQUENCE OF EVENTS:
		
	// At clockTick 1:
        latestStoryline = "Harry, Ron, and Hermione set out under " 
                        + "Harry's invisibility cloak to\n"
                        + "visit Hagrid to express their sympathy "
                        + "and solidarity in his moment\n"
                        + "of grief; he has just been informed by "
                        + "the Ministry of Magic that his\n"
                        + "favorite creature, the hippogriff "
                        + "Buckbeak will be executed later that\n"
                        + "evening.\n";
        hh = new HogwartsHappening(latestStoryline );
        savedStates.put( 1, hh.saveStateToMemento() );
		
        // At clockTick 2:
        latestStoryline = "The execution party knocks at the door to "
                        + "Hagrid's cabin and Hagrid asks\n"
                        + "Harry, Ron, and Hermione to quickly leave "
                        + "his cabin through the back door.\n";
        hh = new HogwartsHappening(latestStoryline );
        savedStates.put( 2, hh.saveStateToMemento() );		
		
        // At clockTick 3:
        latestStoryline = "As Harry, Ron, and Hermione are making "
                        + "their way back to the castle,\n"
                        + "Ron's rat Scabbers starts to act up, "
                        + "ostensibly because of the proximity\n"
                        + "of Hermione's magical cat Crookshanks. "
                        + "(As we later find out, Crookshanks\n"
                        + "knows Scabber's true identity: the rat is "
                        + "actually Peter Pettigrew, who was\n"
                        + "an Animagus, meaning who could turn "
                        + "himself into an animal at will.\n"
                        + "Again as we later found out, it was Peter "
                        + "Pettigrew who had betrayed\n"
                        + "Harry's parents to Lord Voldemort.) "
                        + "Scabbers makes his way into a large\n"
                        + "hole in the roots of the Whomping Willow "
                        + "tree, followed by a very large dog\n"
                        + "(actually Sirius Black, also an Animagus) "
                        + "dragging along with him Ron,\n"
                        + "follwed by Crookshanks the cat, followed "
                        + "by Harry, and, finally, follwed by\n"
                        + "Hermione.  This hole in the roots of the "
                        + "Whomping Willow tree led to an\n"
                        + "underground tunnel to the Shrieking "
                        + "Shack just outside the Hogsmeade "
                        + "village.\n";
        hh = new HogwartsHappening(latestStoryline);
        savedStates.put( 3, hh.saveStateToMemento() );
		
        // At clockTick 4:
        latestStoryline = "The whole party --- Harry, Ron, Hermione, "
                        + "Sirius, Crookshanks, and\n"
                        + "Scabbers --- find themselves in an "
                        + "upstairs room in the Shrieking Shack\n"
                        + "in Hogsmeade.\n";
        hh = new HogwartsHappening(latestStoryline);
        savedStates.put( 4, hh.saveStateToMemento() );
		
        //....
        //....
		
        //THE RE-TRACED SEQUENCE OF EVENTS AFTER HERMIONE 
        //GOES BACK IN TIME BY GIVING THREE TURNS TO HER 
        //TIME-TURNER MACHINE:
			
        hh.restoreStateFromMemento( savedStates.get(0) );	
		
        // At clockTick 1:
        latestStoryline = "Hermione and Harry are in a broom closet. "
                        + " They can hear footsteps\n"
                        + "outside of what sound like three people "
                        + "going down the steps to Hagrid's\n"
                        + "cabin.   As it turns out, these are the "
                        + "footsteps of Harry, Ron, and Hermione\n"
                        + "walking under the Invisibility Cloak "
                        + "in the original time flow.\n";        
        hh = new HogwartsHappening(latestStoryline);
        savedStates.put( 1, hh.saveStateToMemento() );
		
        System.out.println( hh.getLatestStoryline() );
		
        // At clockTick 2:
        latestStoryline = "While still inside the broom closet, "
                        + "Hermione and Harry puzzle over\n"
                        + "Dumbledore's rather cryptic mention that "
                        + "they could save two lives, and\n"
                        + "just Buckbeak's by the time travel "
                        + "adventure they were on.  They put\n"
                        + "two and two together and realize that "
                        + "what Dumbledore meant: If they\n"
                        + "were successful, they could save both "
                        + "Buckbeak and Sirius Black, with\n"
                        + "the former helping the latter escape.\n";
        hh = new HogwartsHappening(latestStoryline);
        savedStates.put( 2, hh.saveStateToMemento() );
		
        // At clockTick 3:
        latestStoryline = "Hermione and Harry set off for Hagrid's "
                        + "cabin, doing their best not be\n"
                        + "discovered crossing the lawn behind the "
                        + "castle by keeping in the shadows\n"
                        + "of the trees, etc.  They arrive at a "
                        + "point where they can see the front door\n"
                        + "to the cabin.  Hiding behind a tree, "
                        + "they can see themselves from the\n"
                        + "original\n time flow, along with Ron, "
                        + "knocking at the door.\n";
        hh = new HogwartsHappening(latestStoryline);
        savedStates.put( 3, hh.saveStateToMemento() );

        // At clockTick 4:
        latestStoryline = "Later they see themselves leaving the "
                        + "cabin through the back door as the\n"
                        + "execution committee enters the cabin.  "
                        + "Harry and Hermione catch sight of\n"
                        + "Mcnair looking at Buckbeak through a "
                        + "window.  Since the back door to the\n"
                        + "cabin is open, they can also hear the "
                        + "conversation taking place inside.  They\n"
                        + "decide that the time has come to mount "
                        + "a rescue for Buckbeak.  So Harry\n"
                        + "darts to where Buckbeak is tethered to "
                        + "the fence, untethers the rope, and\n"
                        + "pulls Buckbeak into the trees at the edge "
                        + "of the forest where he would not\n"
                        + "be visible from Hagrid's cabin.  The "
                        + "execution committee steps out of the\n"
                        + "cabin with the idea of carrying out "
                        + "Buckbeak's execution, but is surprised\n"
                        + "to not see the hippogriff anywhere.\n"; 
        hh = new HogwartsHappening(latestStoryline);
        savedStates.put( 4, hh.saveStateToMemento() );
		
        // .....
        // .....
				
        System.out.println( hh.getLatestStoryline() );
    }
}
