import java.io.*;

public interface Observer extends Runnable {
    DataOutputStream outputStreamToBeUsedByObservable();
}
