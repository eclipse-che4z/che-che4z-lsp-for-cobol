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
package org.eclipse.lsp.cobol.usecases.suite;

import lombok.experimental.UtilityClass;
import org.junit.jupiter.api.extension.ExtensionContext;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Utility class for TestWatchers
 */
@UtilityClass
public class TestWatcherHelper {
  private static final Pattern UNIT_TEST_ID_PATTERN =
      Pattern.compile("\\[.*?\\]/\\[.*?\\]/\\[.*?\\]/\\[.*?:(.*?)\\]");
  static final String ROOT_DIRECTORY_PROPERTY = "usecase.test.repo.dir";

  Path fetchTargetPath(ExtensionContext context, String rootFolder)
      throws IOException {
    String className = context.getTestClass().get().getSimpleName();
    String methodName = context.getRequiredTestMethod().getName();
    Optional<String> parameterInvocation = getParameterInvocation(context);

    List<String> subfolder = new ArrayList<>(Arrays.asList(className, methodName));
    parameterInvocation.ifPresent(subfolder::add);

    Path mainFolderPath = Paths.get(rootFolder, subfolder.toArray(new String[0]));
    Files.createDirectories(mainFolderPath);
    return mainFolderPath;
  }

  private static Optional<String> getParameterInvocation(ExtensionContext context) {
    Matcher matcher = UNIT_TEST_ID_PATTERN.matcher(context.getUniqueId());
    return matcher.find() ? Optional.of(matcher.group(1)) : Optional.empty();
  }
}
