package com.broadcom.lsp.domain.cobol.databus.impl;

import com.broadcom.lsp.domain.cobol.event.model.DataEvent;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import java.util.concurrent.TimeoutException;

import static org.junit.Assert.fail;

/**
 * This class contains all the unit tests related to the pubblish/subscribe pattern handled by the
 * databus.
 */
@Slf4j
public class DatabusEventSubscriptionE2ETest extends DatabusConfigProvider {
  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    waiter.assertTrue(getTargetEventType() == adaptedDataEvent.getEventType());
    LOG.debug(String.format("Received : %s", adaptedDataEvent.getEventType().getId()));
    LOG.debug(String.format("Expected : %s", DataEventType.REQUIRED_COPYBOOK_EVENT.getId()));
    waiter.resume();
  }

  /**
   * This test verify that the observerCallback() method is successfully engaged for a require
   * event.
   */
  @Test
  @SneakyThrows
  public void databusSubscriptionPositiveTest() {
    try {
      databusSubscriptionForPositiveScenario(
          DataEventType.REQUIRED_COPYBOOK_EVENT, DataEventType.REQUIRED_COPYBOOK_EVENT);
      databusSubscriptionForPositiveScenario(
          DataEventType.FETCHED_COPYBOOK_EVENT, DataEventType.FETCHED_COPYBOOK_EVENT);
      databusSubscriptionForPositiveScenario(
          DataEventType.UNKNOWN_EVENT, DataEventType.UNKNOWN_EVENT);
      databusSubscriptionForPositiveScenario(
          DataEventType.RUN_ANALYSIS_EVENT, DataEventType.RUN_ANALYSIS_EVENT);
    } catch (TimeoutException | InterruptedException e) {
      fail();
    }
  }

  /**
   * This test verify that the observerCallback will not be engaged caused by a different event
   * published on the databus.
   */
  @Test(expected = TimeoutException.class)
  @SneakyThrows
  public void databusSubscriptionNegativeTest() {
    databusSubscriptionForNegativeScenario(
        DataEventType.REQUIRED_COPYBOOK_EVENT, DataEventType.UNKNOWN_EVENT);
    databusSubscriptionForNegativeScenario(
        DataEventType.RUN_ANALYSIS_EVENT, DataEventType.UNKNOWN_EVENT);
    databusSubscriptionForNegativeScenario(
        DataEventType.FETCHED_COPYBOOK_EVENT, DataEventType.UNKNOWN_EVENT);
    databusSubscriptionForNegativeScenario(
        DataEventType.UNKNOWN_EVENT, DataEventType.FETCHED_COPYBOOK_EVENT);
  }

  @Test(expected = TimeoutException.class)
  @SneakyThrows
  public void databusUnsubscriptionPositiveTest() {
    databusUnsubscribeForPositiveScenario(DataEventType.REQUIRED_COPYBOOK_EVENT);
    databusUnsubscribeForPositiveScenario(DataEventType.FETCHED_COPYBOOK_EVENT);
    databusUnsubscribeForPositiveScenario(DataEventType.RUN_ANALYSIS_EVENT);
    databusUnsubscribeForPositiveScenario(DataEventType.UNKNOWN_EVENT);
  }
}
