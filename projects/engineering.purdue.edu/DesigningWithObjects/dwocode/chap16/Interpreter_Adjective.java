public class Interpreter_Adjective extends Interpreter_Sentence  {
	
    private String val;
    private String[] contextWords;
    private boolean muggleAlert = false;
	
    public Interpreter_Adjective( String str, String context) {
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
        if ((muggleAlert == true) && 
                             (adjectiveTranslator.containsKey(val))) {
            return "adjective interpreted as:  "
                                       + adjectiveTranslator.get(val);
        }
        return "adjective not interpreted:  " + val;
    }
}


