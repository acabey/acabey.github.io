public class Hogwarts {
	
    public static void main(String[] args) {
        // If the human is interested in finding about DADA during 
        // the first year of Harry Potter's stay at
        // Hogwarts, instantiate the concrete state DADA_Year1 
        // and supply it as an argument to the context
        // class TeachingDADA() as shown below:
        DADA_State year1 = new DADA_Year1();
        TeachingDADA  dada_class = new TeachingDADA( year1 );
        System.out.println( dada_class.getTeacher() );
        System.out.println( dada_class.teacherPersonalityTraits() );
        System.out.println( dada_class.terminationConditions() );
		
        // If the human is interested in finding about DADA during 
        // the second year of Harry Potter's stay at
	// Hogwarts, instantiate the concrete state DADA_Year2 and 
        // supply it as an argument to the context
        // class TeachingDADA() as shown below:
        DADA_State year2 = new DADA_Year2( );
        dada_class = new TeachingDADA( year2 );
        System.out.println( dada_class.getTeacher() );
        System.out.println( dada_class.teacherBackground() );
        // and so on ...
		
        // Experiment with state switching:
        DADA_State  new_state = year2.changeState();
        dada_class = new TeachingDADA( new_state );
        System.out.println( dada_class.getTeacher() );
        System.out.println( dada_class.teacherBackground() );
        // and so on ...
    }
}

