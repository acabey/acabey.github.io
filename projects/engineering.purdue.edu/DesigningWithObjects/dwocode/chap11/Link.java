public class Link {
    private Node start;
    private Node destination;
    private int distance;
	
    public Link( Node start, Node destination, int distance ) {
        this.start = start;
        this.destination = destination;
        this.distance = distance;
    }
    public Link( Node start, Node destination )  {
        this.start = start;
        this.destination = destination;
    }
    public boolean equals( Link other) {
        if ( ( ( start.equals( other.start ) ) 
             && (destination.equals(other.destination) ) )  || 
                ( ( start.equals( other.destination ) ) 
             && (destination.equals(other.start) ) ) ) {
            return true;
        }
        return false;   
    } 
    public int getDirectDistance() {
        return distance;
    }
    public Node getStartNode() { return start; }
    public Node getDestinationNode() { return destination; }
    public String toString() {
        return "    Direct connection:   " + start + " <=> " 
                             + destination + ": " + distance;
    }
}
