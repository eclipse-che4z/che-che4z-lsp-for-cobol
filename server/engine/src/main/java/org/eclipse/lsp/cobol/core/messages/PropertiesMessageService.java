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
package org.eclipse.lsp.cobol.core.messages;

import com.google.gson.JsonArray;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.DialectRegistryItem;
import org.eclipse.lsp.cobol.common.message.LocaleStore;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.core.engine.dialects.WorkingFolderService;
import org.eclipse.lsp.cobol.service.settings.ConfigHelper;
import org.eclipse.lsp.cobol.service.settings.SettingsService;

import java.io.IOException;
import java.net.URI;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;
import java.util.stream.Stream;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.joining;
import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.DIALECTS;
import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.DIALECT_REGISTRY;

/**
 * This class is a properties file implementation of {@link MessageService} . It loads messages
 * from a properties file into memory to be used latter on for logging or messaging.
 */
@Singleton
@Slf4j
public class PropertiesMessageService implements MessageService {

  private final String baseName;
  private final LocaleStore localeStore;
  private CobolLSPropertiesResourceBundle resourceBundle;
  private final SettingsService settingsService;
  private final WorkingFolderService workingFolderService;

  @Inject
  public PropertiesMessageService(
      @Named("resourceFileLocation") String baseName,
      LocaleStore localeStore,
      SettingsService settingsService,
      WorkingFolderService workingFolderService) {
    this.baseName = baseName;
    this.localeStore = localeStore;
    this.settingsService = settingsService;
    this.workingFolderService = workingFolderService;
    resourceBundle =
        new CobolLSPropertiesResourceBundle(baseName, localeStore.getApplicationLocale());
    subscribeToLocaleStore();
  }

  private void subscribeToLocaleStore() {
    localeStore.subscribeToLocaleChange(this::reloadResourceBundle);
  }

  @Override
  public void reloadMessages() {
    reloadResourceBundle(this.localeStore.getApplicationLocale());
  }

  private void reloadResourceBundle(Locale locale) {
    ResourceBundle.clearCache();
    resourceBundle =
        new CobolLSPropertiesResourceBundle(baseName, localeStore.getApplicationLocale());
    updateResourceBundle();
  }

  @Override
  public String getMessage(String key, Object... parameters) {
    try {
      return String.format((String) resourceBundle.handleGetObject(key), parameters);
    } catch (MissingResourceException e) {
      return key;
    }
  }

  @Override
  public String localizeTemplate(MessageTemplate template) {
    Object[] parameters = processArgs(template.getArgs());
    return getMessage(
        template.getTemplate(),
        ofNullable(template.getDelimiter())
            .map(
                delimiter ->
                    Arrays.stream(parameters).map(Object::toString).collect(joining(delimiter)))
            .map(it -> new Object[] {it})
            .orElse(parameters));
  }

  private void updateResourceBundle() {
    this.settingsService
        .fetchTextConfiguration(DIALECTS.label)
        .thenAccept(
            dialects ->
                this.settingsService
                    .fetchConfiguration(DIALECT_REGISTRY.label)
                    .thenAccept(
                        registry -> {
                          List<DialectRegistryItem> dialectRegistryItems =
                              ConfigHelper.parseDialectRegistry((JsonArray) registry.get(0));
                          handleRegisteredDialects(dialects, dialectRegistryItems);
                          handleImplicitDialects(dialects, dialectRegistryItems);
                        }));
  }

  private void handleRegisteredDialects(List<String> dialects, List<DialectRegistryItem> dialectRegistryItems) {
    dialectRegistryItems.stream()
        .filter(
            registeredDialects ->
                dialects.contains(registeredDialects.getName()))
        .forEach(this::updateResourceBundle);
  }

  private void handleImplicitDialects(List<String> dialects, List<DialectRegistryItem> dialectRegistryItems) {
    if (dialectRegistryItems.isEmpty()) {
      dialects.forEach(this::updateResourceBundle);
    }
  }

  private void updateResourceBundle(String dialect) {
    updateResourceBundle(
        new DialectRegistryItem(
            dialect,
            createImplicitDialectUri(dialect),
            "implicit found dialects",
            "implicit-dialects"));
  }

  private URI createImplicitDialectUri(String dialect) {
    return URI.create(this.workingFolderService.getWorkingFolder() + "dialect-" + dialect + ".jar");
  }

  private void updateResourceBundle(DialectRegistryItem dialectRegistryItem) {
    try {
      LOG.debug(
          "update resource for - "
              + dialectRegistryItem.getName()
              + " ,"
              + dialectRegistryItem.getUri());
      this.resourceBundle.updateMessageResourceBundle(dialectRegistryItem);
    } catch (IOException e) {
      LOG.error("Issue while loading resource bundle for " + dialectRegistryItem.getName());
    }
  }

  private Object[] processArgs(Object[] args) {
    return Stream.of(args)
        .map(arg -> arg instanceof MessageTemplate ? localizeTemplate((MessageTemplate) arg) : arg)
        .toArray();
  }
}
