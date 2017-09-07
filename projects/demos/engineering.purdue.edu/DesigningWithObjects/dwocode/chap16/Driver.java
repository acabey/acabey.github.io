import java.io.*;

public class Driver {
	
    static String interpretedSentence = "";
    static String offset = "";
    static String savedNounContext = "";
    static String savedVerbContext = "";
	
    public static void main(String args[]) {
        InputStreamReader inputStream = null;
        try {
            if (args.length == 1) { 
                System.out.println("\nReading from file " + args[0]);
                inputStream =  new FileReader(args[0]);
            } else {
               System.out.println(
                              "Usage: java Driver magic_phrases.txt");
               System.exit(-1);
            }
            
            // Construct parser instance for parsing the file with 
            // magic-speak:
            Parser parser =  new Parser(inputStream);
            ASTMagicalSpeech root = parser.MagicalSpeech();
            System.out.println(
                      "\nMagical speech file parsed successfully.\n");
 
            // Print an indented list of the AST nodes: 
            ShowSyntaxTree printer = new ShowSyntaxTree(); 
            printer.print(root);            
            
            // Now process the AST for the interpretation of 
            // magic-speak:
            processForInterpretation(root);
            System.out.println( "\n\nInterpreted sentence(s):\n " 
                                             +  interpretedSentence );
        } catch (ParseException pe) {
            System.out.println("Main : " + pe.getMessage());
        }catch (java.io.FileNotFoundException fnfe) {
            System.out.println("Main : " + fnfe.getMessage());
            System.exit(0);
        }
    }
    
    private static void processForInterpretation(Node node) {
    	Interpreter_Sentence st = new Interpreter_Sentence();
     	if (node instanceof ASTStatement ) {
            st = new Interpreter_Sentence();
            interpretedSentence += "\n\n";
        } else if (node instanceof ASTNounPhrase ) {
            String nounContext = getStringValue( node );
            savedNounContext = nounContext;
        } else if (node instanceof ASTVerbPhrase ) {
            String val = getStringValue( node );
            savedVerbContext = val;
        } else if (node instanceof ASTNoun ) {
            st.constructNounNode( node.toString(), savedNounContext );
            interpretedSentence += offset + st.interpretNoun() + "\n";
        } else if (node instanceof ASTVerb ) {
            st.constructVerbNode( node.toString(), savedVerbContext );
            interpretedSentence += offset + st.interpretVerb() + "\n";
        } else if (node instanceof ASTAdjective ) {
            st.constructAdjectiveNode( node.toString(), 
                                                   savedNounContext );
            interpretedSentence += offset 
                                    +  st.interpretAdjective() + "\n";
        } else {
            if ( node.toString().contains( ":")) {
                interpretedSentence += offset + node + "\n";
            }
     	}
        int count = node.jjtGetNumChildren();
        offset += offset;
        for (int i=0;i<count;i++) {
            Node child = node.jjtGetChild(i);
            processForInterpretation(child);
        }
     }
    
    private static String getStringValue( Node node ) {
        String val = "";
        int nn = node.jjtGetNumChildren();
        if (nn == 0) {
            String str = node.toString();
            val += str.substring( 1+ str.indexOf( ':' ) );
        }
        for (int i=0;i<nn;i++) {
            Node child = node.jjtGetChild(i);
            val += getStringValue( child );
        }
        return val;
    }
}
