import java.io.*;

public class Obliviator extends Wizard {
	
    public Obliviator( String firstname, String lastname ) {
        super( firstname, lastname );
    }
    public boolean isAllowedToPerformMemoryCharm() 
                        throws UnauthorizedAccessException {
        if ( this.getSchoolGraduatedFrom().equals( 
                    WizardTraits.SchoolGraduatedFrom.HomeSchooled ) )
            return false;
        if (! this.getWizardryStrength().equals( 
                 WizardTraits.WizardryStrength.Charms ) )
            return false;
        for (SchoolGraduatedFrom school : SchoolGraduatedFrom.values()){
            if ( school.equals( this.getSchoolGraduatedFrom() ) ) {
                return true;
            }
        }
        return false;
    }
    public void alterMuggleMemory( String muggleName ) 
                       throws UnauthorizedAccessException {
        if ( !isAllowedToPerformMemoryCharm() ) {
            System.out.println( 
              "This wizard is not qualified to perform memory charm" ); 
            System.exit(0);
        }
        try {
            Process p = Runtime.getRuntime().exec( "which espeak" );
            BufferedReader stdInput = 
               new BufferedReader(
                           new InputStreamReader( p.getInputStream()));
            BufferedReader stdError = 
               new BufferedReader(
                           new InputStreamReader( p.getErrorStream()));
            String reply = stdInput.readLine();
            String error = stdError.readLine();
            if  ( reply.contains("/espeak") )  {
                String incantation = "Obliviate" + muggleName;
                incantation = incantation.replaceAll(" ", "");
                Runtime.getRuntime().exec( 
                    "espeak -s80 -p99 -a200 -k20 " + incantation );
            } else {
                if (error != null) System.out.println( error );
                System.out.println("Memory Charm cast on Mrs. Marge");
            }
        } catch ( IOException e ) {
            e.printStackTrace();
            System.exit(-1);
        }
    }
}
