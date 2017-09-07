public class Interpreter_Noun extends Interpreter_Sentence {
	
    private String val;
    private String[] contextWords;
    private boolean muggleAlert = false;
	
    public Interpreter_Noun( String str, String context ) { 		
        val = str.substring( 2+ str.indexOf( ':' ) );
        contextWords = context.trim().split( "\\s+" );
        for ( String word : contextWords ) {
            if (trigger_words.contains(word)) {
                muggleAlert = true;
                break;
            }
        }
    }
    String interpret() {
        if ( (muggleAlert == true) && 
                                 (nounTranslator.containsKey(val)) ) { 
            return "noun interpreted as:  " + nounTranslator.get(val);
        }
        return "noun not interpreted:  " + val;
    }
}
