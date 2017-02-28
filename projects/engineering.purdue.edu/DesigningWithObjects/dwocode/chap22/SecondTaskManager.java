public class SecondTaskManager {
	
    public static boolean executeTask( Champion champ ) {
        StrategyAbstractRoot strategy = champ.getStrategy();
        String firstProblem = strategy.getFirstProblem();
        boolean solution = true;
        String problem = firstProblem;
        while(solution) {
            String solution_description = 
                           strategy.invokeSolution(problem, champ);
            if (solution_description == null) {
                solution = false;
                break;
            }
            problem =StrategyAbstractRoot.getNextProblem( problem );
            if (problem == null) break;
        } 
        return solution;
    }

    public static void main( String[] args ) {
		
        Champion champ = new Champion( "Cedric Diggory", 
                                      new BubbleHeadCharmStrategy() );
       	boolean succeeded = executeTask(champ);
        if (succeeded) {
            System.out.println(champ.getName() + 
                                     " succeeded at the second task");
        } else {
            System.out.println(champ.getName() 
                                      + " failed at the second task");
        }	  	
        champ = new Champion( "Fleur Delacour", 
                                      new BubbleHeadCharmStrategy() );
        champ.setHasSolutionForKeepingGrindylowsAtBay(false);
        succeeded = executeTask(champ);
        if (succeeded) {
            System.out.println( champ.getName() + 
                                     " succeeded at the second task");
        } else {
            System.out.println( champ.getName() 
                                      + " failed at the second task");
        }	
        champ = new Champion( "Victor Krum", 
                                      new TransfigurationStrategy() );
        succeeded = executeTask(champ);
        if (succeeded) {
            System.out.println( champ.getName() + 
                                     " succeeded at the second task");
        } else {
            System.out.println( champ.getName() +
                                        " failed at the second task");
        }	    	
        champ = new Champion("Harry Potter", new GillyweedStrategy());
        succeeded = executeTask(champ);
        if (succeeded) {
            System.out.println( champ.getName() + 
                                     " succeeded at the second task");
        } else {
            System.out.println( champ.getName() + 
                                        " failed at the second task");
        }	
    }
}
