/*
 * Copyright (c) 2024 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.common.benchmark;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.*;
import java.util.stream.Collectors;

public class BenchmarkServiceImpl implements BenchmarkService {
  private final static Logger LOG = LoggerFactory.getLogger(BenchmarkServiceImpl.class);
  private static final String PERFORMANCE_LOG_PATH = "performance.log.path";
  private final List<BenchmarkSession> benchmarkSessions = new ArrayList<>();

  @Override
  public BenchmarkSession startSession() {
    BenchmarkSession session = new BenchmarkSession();
    benchmarkSessions.add(session);
    return session;
  }

  @Override
  public List<Measurement> getMeasurements() {
    return benchmarkSessions.stream()
        .flatMap(s -> s.getMeasurements().stream())
        .collect(Collectors.toList());
  }

  @Override
  public List<JsonElement> toJsons() {
    Gson gson = new Gson();
    return benchmarkSessions.stream()
        .flatMap(s -> s.getMeasurements().stream())
        .map(gson::toJsonTree)
        .collect(Collectors.toList());
  }

  @Override
  public void logTiming() {
    benchmarkSessions.forEach(this::logTiming);
  }
  public void logTiming(BenchmarkSession benchmarkSession) {
    Collection<Measurement> measurements = benchmarkSession
            .getMeasurements();
    measurements
            .forEach(m -> LOG.debug("Timing for {}: {}", m.getId(), m.getTime()));
    Optional.ofNullable(System.getProperty(PERFORMANCE_LOG_PATH))
            .map(Paths::get)
            .ifPresent(path -> {
              try {
                if (!Files.exists(path)) {
                  LOG.info("Write performance data into: " + path);
                  Files.write(path, Collections.singleton(createHeaderLine(measurements)), StandardOpenOption.CREATE);
                }
                Files.write(path, Collections.singleton(createTimingLine(measurements,
                        benchmarkSession.attr("uri"),
                        Integer.parseInt(benchmarkSession.attr("size")))), StandardOpenOption.APPEND);
              } catch (IOException e) {
                LOG.debug(e.getMessage(), e);
              }
            });
  }

  private String createHeaderLine(Collection<Measurement> measurements) {
    StringBuilder line = new StringBuilder("url");
    measurements.stream().map(Measurement::getId).sorted().forEach(stageName -> {
      line.append(",");
      line.append(stageName);
    });
    line.append(",");
    line.append("Total time");
    line.append(",");
    line.append("Size");
    return line.toString();
  }

  private String createTimingLine(Collection<Measurement> measurements, String url, int size) {
    StringBuilder line = new StringBuilder(url);
    long total = 0;
    for(Measurement m: measurements.stream().sorted(Comparator.comparing(Measurement::getId))
            .collect(Collectors.toList())) {
      line.append(",");
      line.append(m.getTime());
      total += m.getTime();
    }
    line.append(",");
    line.append(total);
    line.append(",");
    line.append(size);
    return line.toString();
  }
}
