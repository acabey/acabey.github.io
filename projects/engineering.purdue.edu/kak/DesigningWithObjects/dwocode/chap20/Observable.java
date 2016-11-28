public interface Observable  {
    abstract void registerWithObservable( Observer observer );
    abstract void unRegisterWithObservable( Observer observer );
}
