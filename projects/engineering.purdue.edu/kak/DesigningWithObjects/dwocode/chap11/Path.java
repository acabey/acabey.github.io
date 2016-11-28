import java.util.*;

public class Path implements Comparable<Path>, Iterable<Node> {
    private List<Node> nodeSequence = new ArrayList<Node>();
    private int pathLength = 0;
    private Node lastNode;
    private Network network;

    public Path( Node nn ) {
        nodeSequence.add(nn);
        lastNode = nn;
    }
    public Path( Path otherPath ) {
        for (Node nn: otherPath) {
            if (nn == null) continue;
            nodeSequence.add( nn );
           if (nodeSequence.size() == 1) {
               pathLength = 0;
           } else {
               pathLength += 
                  Network.getDirectConnectionDistanceBetweenTwoNodes( 
                                                       lastNode, nn );
           }
           lastNode = nn;
        }
    }
    public Path( Network network ) {
        this.network = network;
    }
    public Path( Node nn, Network network ) {
        nodeSequence.add(nn);
        lastNode = nn;
        this.network = network;
    }
    // The second arg `network' in the following method is to supply it
    // with a reference to the underlying network so that it can 
    // get access to inter-node distances for calculating path lengths.
    public Path( Path otherPath, Network network ) {
        this.network = network;
        for (Node nn: otherPath) {
            if (nn == null) continue;
            nodeSequence.add( nn );
            if (nodeSequence.size() == 1) {
                pathLength = 0;
            } else {
                pathLength += 
                 network.getDirectConnectionDistanceBetweenTwoNodes2( 
                                                       lastNode, nn );
            }
            lastNode = nn;
        }
    }	
    public void extendPath( Node nn ) {
        nodeSequence.add(nn);
        Node oldLastNode = lastNode;
        lastNode = nn;
        // The logic of shortest path calculation ensures
        // that the following statement will only be invoked if
        // there is a direct path between the last node on the path
        // and the argument node nn:
        pathLength += 
            Network.getDirectConnectionDistanceBetweenTwoNodes( 
                                              oldLastNode, lastNode );
    }
    // The following version is for non-static versions of the network.
    // The scond arg supplies a reference to the network in which the
    // path is to be extended.
    public void extendPath2( Node nn, Network net ) {
        network = net;
        nodeSequence.add(nn);
        Node oldLastNode = lastNode;
        lastNode = nn;
        pathLength += 
            network.getDirectConnectionDistanceBetweenTwoNodes2( 
                                              oldLastNode, lastNode );
    }
    public String toString() {
        String outputString = "";
        for ( Node nn: nodeSequence ) {
            outputString += nn + " : ";
        }
        outputString += " length: " + pathLength;
        return outputString;
    }
    public int getPathLength() {
        return pathLength;
    }
    public int compareTo(  Path other ) {
        if ( pathLength < other.pathLength ) {
        return -1;
        } else if ( pathLength > other.pathLength ) {
            return 1;
        }
        return 0;
    }
    public boolean lessThan(Path other ) {
        if ( pathLength < other.pathLength ) return true;
        return false;
    }
    public Node getLastNode() {
        return lastNode;
    }
    public Iterator<Node> iterator() {
        return new PathIterator( nodeSequence.toArray() );
    }
	
    /////////////////   Inner class:  PathIterator  ///////////////
    class PathIterator implements Iterator<Node> {
        private int index = 0;	
        private Object[] pathAsArray = null;
        public PathIterator( Object[] collection ) {
            pathAsArray = collection;
        }
        public boolean hasNext() {
            return index < pathAsArray.length;
        }
        public Node next() {
            if (hasNext()) {
                return (Node) pathAsArray[index++];
            } else {
                throw new NoSuchElementException();
            }
        }
        public void remove() {
            throw new UnsupportedOperationException();
        }
    }
}
