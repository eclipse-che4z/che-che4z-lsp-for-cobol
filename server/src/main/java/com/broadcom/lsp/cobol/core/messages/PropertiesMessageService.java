package com.broadcom.lsp.cobol.core.messages;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;

import java.util.Locale;
import java.util.ResourceBundle;

/**
 * This class is an properties file implementation of {@link MessageService} . It loads messages
 * from a properties file into memory to be used latter on for logging or messaging.
 */
@Singleton
public class PropertiesMessageService implements MessageService {

  private final String baseName;
  private final LocaleStore localeStore;
  private ResourceBundle resourceBundle;

  @Inject
  public PropertiesMessageService(
      @Named("resourceFileLocation") String baseName, LocaleStore localeStore) {
    this.baseName = baseName;
    this.localeStore = localeStore;
    resourceBundle = ResourceBundle.getBundle(baseName, localeStore.getApplicationLocale());
    subscribeToLocaleStore();
  }

  private void subscribeToLocaleStore() {
    localeStore.subscribeToLocaleChange(this::reloadResourceBundle);
  }

  private void reloadResourceBundle(Locale locale) {
    ResourceBundle.clearCache();
    resourceBundle = ResourceBundle.getBundle(baseName, locale);
  }

  /**
   * This method return an {@link String} based on passes key and params.
   *
   * @param key Unique ID for each message in externalized message file.
   * @param parameters Arguments referenced by the format specifiers in the format * string in
   *     externalized message file.
   * @return {@link String}
   */
  @Override
  public String getMessage(String key, Object... parameters) {
    return String.format(resourceBundle.getString(key), parameters);
  }
}
