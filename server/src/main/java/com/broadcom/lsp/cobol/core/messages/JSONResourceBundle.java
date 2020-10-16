package com.broadcom.lsp.cobol.core.messages;

import com.google.gson.Gson;

import java.io.BufferedInputStream;
import java.io.InputStreamReader;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/** This is a custom {@link ResourceBundle} to support JSON. */
public class JSONResourceBundle extends ResourceBundle {
  private final Map<String, MessageTemplate> props;

  public JSONResourceBundle(BufferedInputStream bis) {
    Gson gson = new Gson();
    InputStreamReader reader = new InputStreamReader(bis);
    MessageTemplate[] messageTemplates = gson.fromJson(reader, MessageTemplate[].class);
    props =
        Arrays.stream(messageTemplates)
            .collect(Collectors.toMap(MessageTemplate::getKey, Function.identity()));
  }

  /**
   * Gets an object for the given key from this resource bundle. Returns null if this resource
   * bundle does not contain an object for the given key.
   *
   * @param key the key for the desired object
   * @return the object for the given key, or null
   * @throws NullPointerException if <code>key</code> is <code>null</code>
   */
  @Override
  protected Object handleGetObject(String key) {
    return props.get(key);
  }

  /**
   * Returns an enumeration of the keys.
   *
   * @return an <code>Enumeration</code> of the keys contained in this <code>ResourceBundle</code>
   *     and its parent bundles.
   */
  @Override
  public Enumeration<String> getKeys() {
    return Collections.enumeration(props.keySet());
  }
}
