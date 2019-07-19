package pikapika.model;

import pikapika.pojo.Message;

import java.util.HashMap;
import java.util.Map;

public class ViewObject {
    private Map<String, Object> objs = new HashMap<String, Object>();
    private Map<String, Message> messages = new HashMap<String, Message>();
    public void set(String key, Object value) {
        objs.put(key, value);
    }

    public Object get(String key) {
        return objs.get(key);
    }
    public void setMessage(String key, Message message) {
        messages.put(key, message);
    }
    public Message getMessage(String key) {
        return messages.get(key);
    }
}
