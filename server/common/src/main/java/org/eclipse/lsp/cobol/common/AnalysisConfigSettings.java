package org.eclipse.lsp.cobol.common;

public enum AnalysisConfigSettings {
  ENABLED(true, false, true),
  ENABLED_VERBOSE(true, true, true),
  ENABLED_NO_CICS(false, false, true),
  SKIP_SQL(true, false, false);

  public final boolean cicsTranslatorEnabled;
  public final boolean collectASTChanges;
  public final boolean sqlProcessingEnabled;

  AnalysisConfigSettings(
      boolean cicsTranslatorEnabled, boolean collectASTChanges, boolean sqlProcessingEnabled) {
    this.cicsTranslatorEnabled = cicsTranslatorEnabled;
    this.collectASTChanges = collectASTChanges;
    this.sqlProcessingEnabled = sqlProcessingEnabled;
  }
}
