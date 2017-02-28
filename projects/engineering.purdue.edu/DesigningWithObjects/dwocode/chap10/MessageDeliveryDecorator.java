public abstract class MessageDeliveryDecorator implements MessageDelivery {
	
    private MessageDelivery message;
	
    public MessageDeliveryDecorator( MessageDelivery m ) { message = m; }

    public void deliverMessage() {
        message.deliverMessage();
    }
}
