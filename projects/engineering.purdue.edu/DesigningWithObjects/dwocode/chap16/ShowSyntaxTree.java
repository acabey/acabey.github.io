public class ShowSyntaxTree {
    private int indentationIndex = 1;
 
    private String getIndentation() {
        String indentation = "     ";
        for (int i=0;  i< indentationIndex; i++ ) {
            indentation += "     ";
        }
        return indentation;
    }
    public void print(Node node) {
        System.out.println("\nPrinting the tree ...");
        visit(node);
    }
    private void visit(Node node) {
        System.out.println( getIndentation() + node.toString() );
        ++indentationIndex;
        int count = node.jjtGetNumChildren();
        for (int i=0;i<count;i++) {
            Node child = node.jjtGetChild(i);
            visit(child);
        }
        --indentationIndex;	  
    }
}
