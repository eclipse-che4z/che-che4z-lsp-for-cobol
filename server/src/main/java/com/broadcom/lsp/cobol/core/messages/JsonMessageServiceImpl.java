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

  private static final String KEYS_WITH_ID_ALREADY_EXISTS_MESSAGE =
      "Keys with id '{%s}' already exists.";
  private static final String MESSAGE_LOAD_EXCEPTION_MESSAGE =
      "Please load messages from a template json file before using message service."
          + "Use loadMessages method provided by the MessageService class.";
  private static final String KEY_NOT_FOUND_MESSAGE =
      "No templates corresponding to key '{}' found.";
  private static final String TEMPLATE_LOAD_EXCEPTION_MESSAGE =
      "Problems encountered while loading MessageTemplate from path '%s'.";
  private final Map<String, MessageTemplate> customMessagesMap = new HashMap<>();

  public JsonMessageServiceImpl(String filePath) {
    loadMessages(filePath);
  }

  /***
   *  This method return an {@link ExternalizedMessage} object passed on passed params from an message file.
   * @param key Key corresponds to the uniqueness of a messageTemplate.
   *            It's like an ID for the message. Every key must be unique.
   * @param parameters are the different arguments to be substituted in the message,
   *            in the passed order.
   * @return {@link ExternalizedMessage}
   */
  @Override
  public ExternalizedMessage getMessage(@NonNull String key, @NonNull Object... parameters) {
    if (this.customMessagesMap.isEmpty()) {
      throw new MessageTemplateLoadException(MESSAGE_LOAD_EXCEPTION_MESSAGE);
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
              LOG.error(KEY_NOT_FOUND_MESSAGE, key);
              return invalidMessageTemplate();
            });
  }

  private MessageTemplate invalidMessageTemplate() {
    return new MessageTemplate(INVALID_KEY, INVALID_KEY_EXTERNALIZED_MESSAGE);
  }

  /***
   * This methods verify and loads all messages from a provided message file.
   * @param filePath is the path from where we want to load messageTemplate files.
   */
  @Override
  public void loadMessages(String filePath) {
    try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
      Gson gson = new Gson();
      MessageTemplate[] messageTemplates = gson.fromJson(reader, MessageTemplate[].class);
      List<MessageTemplate> messageTemplateList = List.of(messageTemplates);
      this.addMessageTemplates(messageTemplateList);
    } catch (IOException exception) {
      throw new MessageTemplateLoadException(
          String.format(TEMPLATE_LOAD_EXCEPTION_MESSAGE, filePath));
    }
  }

  /***
   * Adds a list of {@link MessageTemplate} to an existing object of {@link MessageService }
   * @param messageTemplateList list of {@link MessageTemplate} to be loaded in the memory, to be used
   *                            later on by calling {@link MessageService#getMessage(String, Object...)} .
   */
  public void addMessageTemplates(List<MessageTemplate> messageTemplateList) {
    validateMessageTemplateKeys(messageTemplateList);
    messageTemplateList.forEach(element -> this.customMessagesMap.put(element.getKey(), element));
  }

  private void validateMessageTemplateKeys(List<MessageTemplate> messageTemplateList) {
    validateKeyDuplication(messageTemplateList);
    Set<String> existingKeySet = customMessagesMap.keySet();
    Set<String> toBeAddedKeys =
        messageTemplateList.stream().map(MessageTemplate::getKey).collect(Collectors.toSet());
    verifyNoKeyDuplicationIn(toBeAddedKeys, existingKeySet);
  }

  private void verifyNoKeyDuplicationIn(Set<String> toBeAddedKeys, Set<String> existingKeySet) {
    Sets.SetView<String> intersection = Sets.intersection(toBeAddedKeys, existingKeySet);
    if (!intersection.isEmpty()) {
      throw new KeyAlreadyExistException(
          String.format(
              KEYS_WITH_ID_ALREADY_EXISTS_MESSAGE,
              StringUtils.joinWith(",", intersection.toArray())));
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
          String.format(KEYS_WITH_ID_ALREADY_EXISTS_MESSAGE, StringUtils.join(duplicateKeys, ","));
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
