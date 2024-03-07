package org.eclipse.lsp.cobol.common.benchmark;

import java.util.HashMap;
import java.util.Map;

public class Measurement {
  private final String id;

  private long startTime;
  private long time;
  private final Map<String, String> attributes = new HashMap<>();

  public Measurement(String id) {
    this.id = id;
  }

  public void start() {
    startTime = System.nanoTime();
  }

  public void stop() {
    time = System.nanoTime() - startTime;
  }

  public long elapsed() {
    return time;
  }

  public String getId() {
    return id;
  }

  public long getTime() {
    return time;
  }

  public void attr(String key, String value) {
    attributes.put(key, value);
  }

  public String attr(String key) {
    return attributes.get(key);
  }
}
