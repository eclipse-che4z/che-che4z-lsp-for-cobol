/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.positive;

import com.google.common.util.concurrent.SimpleTimeLimiter;
import org.eclipse.lsp.cobol.service.delegates.validations.UseCaseUtils;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Objects;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * This test checks that the files in the positive test set don't produce any {@link
 * RuntimeException} while analyzing them char by char. Disabled by default, to enable provide
 * <code>-Dtests.typing=true
 * </code> as a system property for the run configuration.
 */
class TypingTest extends FileBasedTest {
  private static final String MODE_PROPERTY_NAME = "tests.typing";
  private static final String TEST_MODE = System.getProperty(MODE_PROPERTY_NAME);

  @Test
  void typingTest() {
    if (!Boolean.TRUE.toString().equals(TEST_MODE)) return;
    List<CobolText> textsToTest = getTextsToTest();
    AtomicInteger counter = new AtomicInteger();
    final int size = textsToTest.size();

    textsToTest.parallelStream()
        .filter(Objects::nonNull)
        .forEach(text -> analyze(text, counter, size));
  }

  private void analyze(CobolText text, AtomicInteger counter, int size) {
    String name = text.getFileName();
    String fullText = text.getFullText();

    System.out.printf("Analyzing %s\n", name);

    final long start = System.currentTimeMillis();
    analyze(name, fullText);
    final double time = (System.currentTimeMillis() - start) / 1000.0;

    System.out.printf(
        "%s analyzed successfully in %.3f seconds. Progress: %s/%s\n",
        name, time, counter.incrementAndGet(), size);
  }

  private void analyze(String name, String fullText) {
    String accumulator = "";
    ExecutorService es = Executors.newSingleThreadExecutor();
    SimpleTimeLimiter timeLimiter = SimpleTimeLimiter.create(es);
    try {
      for (char c : fullText.toCharArray()) {
        accumulator += c;
        UseCaseRun useCaseRun = new UseCaseRun(name, accumulator, getCopybooks());
        if (c != ' ')
          timeLimiter.callWithTimeout(useCaseRun, 30, TimeUnit.SECONDS);
      }
    } catch (Exception e) {
      System.out.printf("Text that produced the error:\n%s\n\n%s", accumulator, e);
    } finally {
      es.shutdown();
    }
  }

  private final class UseCaseRun implements Callable<Void> {
    private final String fileName;
    private final String text;
    private final List<CobolText> copybooks;

    private UseCaseRun(String fileName, String text, List<CobolText> copybooks) {
      this.fileName = fileName;
      this.text = text;
      this.copybooks = copybooks;
    }

    @Override
    public Void call() {
      UseCaseUtils.analyzeForErrors(fileName, text, copybooks);
      return null;
    }
  }
}
