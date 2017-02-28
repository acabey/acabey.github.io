public class MagicList<T> implements MagicCollection<T>{

    protected class Node {
        T item;
        Node next = null;
        Node( T item ) { this.item = item; }
        public String toString() { return (String) item; }
    }
    protected Node head = null;
    protected Node tail = null;
    private int length = 0;
    public  MagicList() {}
    public T first() { return head.item; }
    public void add( T item ) {
        if ( head == null ) {
            head = new Node( item );
            length++;
            tail = head;
        } else {
            tail.next = new Node( item );
            length++;
            tail = tail.next;
        }
    }
    public void remove( T item ) {
        Node ptr = head;
        Node ptr_prev = ptr;
        while (ptr != null) {
            if ((ptr == head) && (ptr.item == item)) {
                head = ptr.next;
                length--;
                return;
            } else if (ptr.item == item) {
                ptr_prev.next = ptr.next;
                length--;
                return;
            } else {
                ptr_prev = ptr;
                ptr = ptr.next;
            }
        }
    }
    public boolean contains( T item ) {
        Node ptr = head;
        while (ptr != null) {
            if (ptr.item == item) return true;
            ptr = ptr.next;
        }
        return false;
    }
    public void clear() {
        head = null;
        tail = null;
        length = 0;
    }
    public Iterator<T> iterator() {
        return new Iterator<T>() {
            protected Node ptr = head;
            public boolean hasNext() { return ptr != null; }
            public T next() {
                if (ptr != null) {
                    T item = ptr.item;
                    ptr = ptr.next;
                    return item;
                } else {
                    throw new RuntimeException();
                }
            }
        };
    }
    public int length() {
        return length;
    }
    public String toString() {
        String result = "";
        Iterator<T> it = iterator();
        while ( it.hasNext() ) {
            T node = it.next();
            result += node + "\n";
        }
        return result;
    }
}
