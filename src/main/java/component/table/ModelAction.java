package component.table;


public class ModelAction<Type, EventAction> {

    public Type getEntity() {
        return entity;
    }

    public void setEntity(Type entity) {
    	 this.entity = entity;
    }

    public EventAction getEvent() {
        return event;
    }

    public void setEvent(EventAction event) {
        this.event = event;
    }

    public ModelAction(Type entity, EventAction event) {
        this.entity = entity;
        this.event = event;
    }

    public ModelAction() {
    }

    private Type entity;
    private EventAction event;
}
