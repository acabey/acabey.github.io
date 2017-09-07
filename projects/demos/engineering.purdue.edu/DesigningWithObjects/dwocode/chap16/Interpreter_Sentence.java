import java.util.*;

public class Interpreter_Sentence  {

    private Interpreter_Noun mn;
    private Interpreter_Verb mv;
    private Interpreter_Adjective ma;

    static protected Set<String> trigger_words = new HashSet<String>();
    static protected Map<String,String> nounTranslator = 
                                      new HashMap<String,String>();	
    static protected Map<String,String> verbTranslator = 
                                      new HashMap<String,String>();
    static protected Map<String,String> adjectiveTranslator = 
                                      new HashMap<String,String>();
    {
        nounTranslator.put("wand", "finger");
        nounTranslator.put("wizards", "people");
        nounTranslator.put("dementors", "greedy businessmen");
        nounTranslator.put("spell", "picture");
		
        verbTranslator.put("cast", "show");
        //verbTranslator.put("conquer", "please");
		
        adjectiveTranslator.put("magic", "little");
        adjectiveTranslator.put("dark", "ambitious");
        adjectiveTranslator.put("wizarding", "trading");
		
        trigger_words.addAll( Arrays.asList("wizards", "wand", 
                                 "spell", "dementors", "wizarding"));
    }
	
    void constructNounNode( String str, String context ) {
        mn = new Interpreter_Noun( str, context );
    }
    void constructVerbNode( String str, String context ) {
        mv = new Interpreter_Verb( str, context );
    }
    void constructAdjectiveNode( String str, String context ) {
        ma = new Interpreter_Adjective( str, context );
    }
    String interpretNoun() {
        return mn.interpret();
    }
    String interpretVerb() {
        return mv.interpret();
    }
    String interpretAdjective() {
        return ma.interpret();
    }
}
