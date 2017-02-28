public interface MagicCollection<T> {
    public void add( T x );
    public void remove(T x);
    public Iterator<T> iterator();
    public int length();
    public boolean contains( T item );
    public T first();
    public void clear();
}
