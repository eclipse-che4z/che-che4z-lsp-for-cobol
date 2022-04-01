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
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.time.DurationFormatUtils;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessorImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReaderImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.rewriter.CobolLineIndicatorProcessorImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.transformer.ContinuationLineTransformation;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriterImpl;
import org.eclipse.lsp.cobol.usecases.engine.UseCase;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

/**
 * This test checks that the files in the positive test set don't produce any {@link
 * RuntimeException} while analyzing them char by char. Disabled by default, to enable provide
 * <code>-Dtests.typing=true
 * </code> as a system property for the run configuration.
 */
@Slf4j
class TypingTest extends FileBasedTest {
  private static final String MODE_PROPERTY_NAME = "tests.typing";
  private static final String TEST_MODE = System.getProperty(MODE_PROPERTY_NAME);

  @Test
  void typingTest() {
    if (!Boolean.TRUE.toString().equals(TEST_MODE)) return;
    List<CobolText> textsToTest = getTextsToTest();
    final int size = textsToTest.size();
    for (int i = 0; i < size; i++) {
      CobolText cobolText = textsToTest.get(i);
      String name = cobolText.getFileName();
      LOG.info("Analyzing {}", name);
      final long start = System.currentTimeMillis();
      analyze(name, getCleanText(cobolText));
      final long duration = System.currentTimeMillis() - start;
      LOG.info("{} analyzed in {}. Progress: {}/{}.",
          name,
          DurationFormatUtils.formatDurationHMS(duration),
          i + 1, size);
    }
  }

  private String getCleanText(CobolText cobolText) {
    TextPreprocessor preprocessor = new TextPreprocessorImpl(
        null,
        new CobolLineReaderImpl(null),
        new CobolLineWriterImpl(),
        new ContinuationLineTransformation(null),
        new CobolLineIndicatorProcessorImpl()
    );
    ResultWithErrors<String> cleanTextResult = preprocessor.cleanUpCode(cobolText.getFileName(), cobolText.getFullText());
    for (SyntaxError error: cleanTextResult.getErrors())
      LOG.error(error.toString());
    return cleanTextResult.getResult();
  }

  private void analyze(String name, String fullText) {
    AtomicInteger position = new AtomicInteger();
    ScheduledExecutorService scheduled = Executors.newScheduledThreadPool(1);
    int textSize = fullText.length();
    scheduled.scheduleAtFixedRate(() -> {
      int done = position.get();
      String percents = String.format("%.2f", (float) 100 * done / textSize);
      LOG.info("{}% in work. Position {} of {}", percents, done, textSize);
    }, 10, 10, TimeUnit.MINUTES);
    ForkJoinPool.commonPool().invokeAll(
        IntStream.rangeClosed(0, ForkJoinPool.commonPool().getParallelism())
            .mapToObj(i -> new UseCaseRun(name, fullText, position))
            .collect(Collectors.toList())
    );
    scheduled.shutdown();
  }

  private final class UseCaseRun implements Callable<Void> {
    private final String name;
    private final String fullText;
    private final AtomicInteger position;

    UseCaseRun(String name, String fullText, AtomicInteger position) {
      this.name = name;
      this.fullText = fullText;
      this.position = position;
    }

    @Override
    public Void call() throws Exception {
      SimpleTimeLimiter timeLimiter = SimpleTimeLimiter.create(ForkJoinPool.commonPool());
      for (int currentPos = position.incrementAndGet();
           currentPos <= fullText.length();
           currentPos = position.incrementAndGet()) {
        if (fullText.charAt(currentPos - 1) == ' ') continue;
        String text = fullText.substring(0, currentPos);
        try {
          timeLimiter.callWithTimeout(() -> {
            UseCaseUtils.analyzeForErrors(UseCase.builder()
                .text(text)
                .fileName(name)
                .copybooks(getCopybooks())
                .build());
            return null;
          }, 30, TimeUnit.SECONDS);
        } catch (Exception e) {
          LOG.error("Text that produced the error:\n{}", text, e);
        }
      }
      return null;
    }
  }
}
