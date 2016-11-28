public class Node {
    private String location;
    public Node( String location ) {
    	this.location = location;
    }
    public String toString() { 
    	return location; 
    }
    public boolean equals( Node other ) {
    	if (location == other.location) {
    		return true;
    	}
    	return false;
    }
    public int hashCode() {
    	return  3 ^ 19 + location.hashCode();
    }
}
