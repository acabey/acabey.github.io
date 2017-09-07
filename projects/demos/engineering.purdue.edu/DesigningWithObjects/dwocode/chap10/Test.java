public class Test {
    public static void main(String[] args) {
        MessageDelivery m1 = new DeliverMsgThruPost( 
                             new CoreMessageDeliveryClass() );
        m1.deliverMessage();
        System.out.println();
		
        MessageDelivery m2 = new DeliverMsgThruChimney( 
                             new CoreMessageDeliveryClass() );
        m2.deliverMessage();
        System.out.println();
		
        MessageDelivery m3 = new DeliverMsgThruHagrid( 
                             new DeliverMsgThruChimney( 
                             new CoreMessageDeliveryClass() ) );
        m3.deliverMessage();
        System.out.println();
    }
}
