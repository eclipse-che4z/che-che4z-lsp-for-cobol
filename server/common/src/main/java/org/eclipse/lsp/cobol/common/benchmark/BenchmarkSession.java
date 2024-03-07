package org.eclipse.lsp.cobol.common.benchmark;

import lombok.extern.slf4j.Slf4j;

import java.util.*;
import java.util.function.Supplier;

@Slf4j
public class BenchmarkSession {
  private final Map<String, Measurement> measurementMap = new HashMap<>();
  private final Map<String, String> attributes = new HashMap<>();

  /**
   * Measure run time of supplier
   *
   * @param supplier execution logic
   * @return result of execution
   * @param <T> type of execution result
   */
  public <T> T measure(String id, Supplier<T> supplier) {
    try {
      start(id);
      return supplier.get();
    } finally {
      stop(id);
    }
  }

  void start(String id) {
    Measurement value = new Measurement(id);
    measurementMap.put(id, value);
    value.start();
  }

  void stop(String id) {
    if (!measurementMap.containsKey(id)) {
      LOG.warn("Measurement '" + id + "' is not started.");
      return;
    }
    measurementMap.get(id).stop();
  }

  public Collection<Measurement> getMeasurements() {
    return measurementMap.values();
  }

  public void attr(String key, String value) {
    attributes.put(key, value);
  }

  public String attr(String key) {
    return attributes.get(key);
  }
}
