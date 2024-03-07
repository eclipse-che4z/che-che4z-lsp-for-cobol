package org.eclipse.lsp.cobol.common.benchmark;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.concurrent.TimeUnit;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

class BenchmarkServiceTests {
  private static final String ID = "test.data";

  @Test
  void measure100() throws InterruptedException {
    BenchmarkService benchmarkService = new BenchmarkServiceImpl();
    BenchmarkSession benchmarkSession = benchmarkService.startSession();
    benchmarkSession.start(ID);
    TimeUnit.MICROSECONDS.sleep(100);
    benchmarkSession.stop(ID);
    benchmarkSession.attr("uri", "http://hello.com");
    benchmarkSession.attr("size", "100500");
    List<Measurement> measurements = benchmarkService.getMeasurements();
    assertEquals(1, measurements.size());
    assertTrue(measurements.get(0).elapsed() >= 100);
    List<JsonElement> jsons = benchmarkService.toJsons();
    assertEquals(1, jsons.size());
    assertEquals("100500", benchmarkSession.attr("size"));
    assertEquals("http://hello.com", benchmarkSession.attr("uri"));
  }
}
