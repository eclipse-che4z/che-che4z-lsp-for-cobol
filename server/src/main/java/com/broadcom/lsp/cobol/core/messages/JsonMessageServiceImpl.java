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
package com.broadcom.lsp.cobol.core.messages;

import com.google.common.collect.Sets;
import com.google.gson.Gson;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

/***
 * This class is a JSON implementation of {@link MessageService} . It loads the JSON messages into memory to be used latter on for logging.
 */
@Slf4j
public class JsonMessageServiceImpl implements MessageService {

  public static final String KEYS_WITH_ID_S_ALREADY_EXISTS = "Keys with id '{%s}' already exists.";
  private final Map<String, MessageTemplate> customMessagesMap = new HashMap<>();

  public JsonMessageServiceImpl(String filePath) {
    loadMessages(filePath);
  }

  /***
   *
   * @param key Key corresponds to the uniqueness of a messageTemplate.
   *            It's like an ID for the message. Every key must be unique.
   * @param parameters are the different arguments to be substituted in the message,
   *            in the passed order.
   * @return {@link ExternalizedMessage}
   */
  @Override
  public ExternalizedMessage getMessage(@NonNull String key, @NonNull Object... parameters) {
    if (this.customMessagesMap.isEmpty()) {
      throw new MessageTemplateLoadException(
          "Please load messages from a template json file before using message service."
              + "Use loadMessages method provided by the MessageService class.");
    }
    MessageTemplate messageTemplate = validateMessageTemplateExists(key);
    if (!messageTemplate.isValidKey()) {
      parameters = new Object[] {key};
    }
    return ExternalizedMessage.builder()
        .messageTemplate(messageTemplate)
        .parameters(parameters)
        .key(key)
        .build();
  }

  private MessageTemplate validateMessageTemplateExists(String key) {
    return this.getMessageTemplate(key)
        .orElseGet(
            () -> {
              LOG.error("No templates corresponding to key '{}' found.", key);
              return invalidMessageTemplate();
            });
  }

  private MessageTemplate invalidMessageTemplate() {
    return new MessageTemplate(
        INVALID_KEY, INVALID_KEY_S_SUPPLIED_PLEASE_CHECK_THE_EXTERNALIZED_MESSAGE_FILES);
  }

  /***
   *
   * @param filePath is the path from where we want to load messageTemplate files.
   */
  @Override
  public void loadMessages(String filePath) {
    try (final BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
      Gson gson = new Gson();
      final MessageTemplate[] messageTemplates = gson.fromJson(reader, MessageTemplate[].class);
      final List<MessageTemplate> messageTemplateList = List.of(messageTemplates);
      this.addMessageTemplates(messageTemplateList);
    } catch (IOException exception) {
      throw new MessageTemplateLoadException(
          String.format(
              "Problems encountered while loading MessageTemplate from path '%s'.", filePath));
    }
  }

  /***
   *
   * @param messageTemplateList list of {@link MessageTemplate} to be loaded in the memory, to be used
   *                            later on by calling {@link MessageService#getMessage(String, Object...)} .
   */
  public void addMessageTemplates(List<MessageTemplate> messageTemplateList) {
    validateMessageTemplateKeys(messageTemplateList);
    messageTemplateList.forEach(element -> this.customMessagesMap.put(element.getKey(), element));
  }

  private void validateMessageTemplateKeys(List<MessageTemplate> messageTemplateList) {
    validateKeyDuplication(messageTemplateList);
    final Set<String> existingKeySet = customMessagesMap.keySet();
    final Set<String> toBeAddedKeys =
        messageTemplateList.stream().map(MessageTemplate::getKey).collect(Collectors.toSet());
    verifyNoKeyDuplicationIn(toBeAddedKeys, existingKeySet);
  }

  private void verifyNoKeyDuplicationIn(Set<String> toBeAddedKeys, Set<String> existingKeySet) {
    final Sets.SetView<String> intersection = Sets.intersection(toBeAddedKeys, existingKeySet);
    String errorMsg;
    if (!intersection.isEmpty()) {
      errorMsg =
          String.format(
              KEYS_WITH_ID_S_ALREADY_EXISTS, StringUtils.joinWith(",", intersection.toArray()));
      throw new KeyAlreadyExistException(errorMsg);
    }
  }

  private void validateKeyDuplication(List<MessageTemplate> messageTemplateList) {
    List<String> duplicateKeys =
        messageTemplateList.stream()
            .collect(Collectors.groupingBy(MessageTemplate::getKey, Collectors.counting()))
            .entrySet()
            .stream()
            .filter(entry -> entry.getValue() > 1)
            .map(Map.Entry::getKey)
            .collect(Collectors.toList());

    if (!duplicateKeys.isEmpty()) {
      String errorMsg =
          String.format(KEYS_WITH_ID_S_ALREADY_EXISTS, StringUtils.join(duplicateKeys, ","));
      throw new KeyAlreadyExistException(errorMsg);
    }
  }

  /***
   *
   * @param key message template key. This key needs to be unique.
   * @return @{@link Optional} of {@link MessageTemplate} from messageService.
   */
  private Optional<MessageTemplate> getMessageTemplate(String key) {
    return Optional.ofNullable(customMessagesMap.get(key));
  }
}
