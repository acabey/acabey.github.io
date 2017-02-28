public class Interpreter_Verb extends Interpreter_Sentence {
	
    private String val;
    private String[] contextWords;
    private boolean muggleAlert = false;
	
    public Interpreter_Verb( String str, String context ) { 		
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
        if (  (muggleAlert == true) &&  
                                  (verbTranslator.containsKey(val)) ){
            return "Verb interpreted as:  " + verbTranslator.get(val);
        }
        return "verb not interpreted:  " + val;
    }
}
