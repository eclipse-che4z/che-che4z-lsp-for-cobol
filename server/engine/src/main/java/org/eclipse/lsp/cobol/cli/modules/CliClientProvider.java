/*
 * Copyright (c) 2020 Broadcom.
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

package org.eclipse.lsp.cobol.cli.modules;

import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.Setter;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp4j.*;

import java.io.File;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.concurrent.CompletableFuture;

@Singleton
public class CliClientProvider implements Provider<CobolLanguageClient> {
  private final CliClient client = new CliClient();
  @Setter
  private List<File> cpyPaths;
  @Setter
  private List<String> cpyExt;

  /**
   * The CliClientProvider class is a provider for the CobolLanguageClient interface.
   */
  public CliClientProvider() { }

  @Override
  public CobolLanguageClient get() {
    return client;
  }

  class CliClient implements CobolLanguageClient {

    @Override
    public void telemetryEvent(Object object) {
      throw new UnsupportedOperationException();
    }

    @Override
    public void publishDiagnostics(PublishDiagnosticsParams diagnostics) {
      throw new UnsupportedOperationException();
    }

    @Override
    public void showMessage(MessageParams messageParams) {
      throw new UnsupportedOperationException();
    }

    @Override
    public CompletableFuture<MessageActionItem> showMessageRequest(ShowMessageRequestParams requestParams) {
      throw new UnsupportedOperationException();
    }

    @Override
    public CompletableFuture<List<Object>> configuration(ConfigurationParams configurationParams) {
      return CompletableFuture.completedFuture(null);
    }

    @Override
    public void logMessage(MessageParams message) {
      throw new UnsupportedOperationException();
    }

    @Override
    public CompletableFuture<String> resolveCopybook(String cobolFileUri, String copybookName, String dialectType) {
      for (File sp : cpyPaths) {
        for (String ext : cpyExt) {
          String copybookFileName = copybookName + (ext.isEmpty() || ext.startsWith(".") ? ext : "." + ext);
          Path cpy = sp.isAbsolute()
                  ? Paths.get(sp.toString(), copybookFileName)
                  : makeRelativePath(cobolFileUri, sp.toString(), copybookFileName);

          if (Files.exists(cpy)) {
            String value = cpy.toUri().toString();
            return CompletableFuture.completedFuture(value);
          }
        }
      }
      return CompletableFuture.completedFuture(null);
    }

    private Path makeRelativePath(String cobolFileUri, String cbPath, String copybookFileName) {
      String folder = Paths.get(URI.create((cobolFileUri))).getParent().toString();
      return Paths.get(folder, cbPath, copybookFileName);
    }
  }
}
