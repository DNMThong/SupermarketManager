package component.table;

import component.table.product.EventAction;

public class ModelAction<Entity> {

    public Entity getEntity() {
        return entity;
    }

    public void setEntity(Entity entity) {
    	 this.entity = entity;
    }

    public EventAction getEvent() {
        return event;
    }

    public void setEvent(EventAction event) {
        this.event = event;
    }

    public ModelAction(Entity entity, EventAction event) {
        this.entity = entity;
        this.event = event;
    }

    public ModelAction() {
    }

    private Entity entity;
    private EventAction event;
}
