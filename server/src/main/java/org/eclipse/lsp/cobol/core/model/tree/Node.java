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
package org.eclipse.lsp.cobol.core.model.tree;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.stream.Stream;

/** The class represents a Node in source structure tree. */
@ToString
@Getter
@EqualsAndHashCode
public abstract class Node {
  private final Locality locality;
  private final NodeType nodeType;

  @EqualsAndHashCode.Exclude private final List<Node> children = new ArrayList<>();
  @EqualsAndHashCode.Exclude @ToString.Exclude @Setter private Node parent;
  @EqualsAndHashCode.Exclude private Optional<Supplier<List<SyntaxError>>> nextProcessingStep = Optional.empty();

  protected Node(Locality location, NodeType nodeType) {
    this.locality = location;
    this.nodeType = nodeType;
  }

  /**
   * Construct a predicate for testing that node has specified type.
   *
   * @param type the desired type
   * @return the predicate for testing node
   */
  public static Predicate<Node> hasType(NodeType type) {
    return node -> node.nodeType == type;
  }

  /**
   * Add a child node to this node and updates the child parent link.
   *
   * @param node a child node.
   */
  public void addChild(Node node) {
    node.setParent(this);
    children.add(node);
  }

  /**
   * Remove a child node.
   *
   * @param node a child for remove
   * @return true if this node contained the specified child
   */
  public boolean removeChild(Node node) {
    return children.remove(node);
  }

  /**
   * Get a stream with all nested children starting with this instance.
   *
   * @return the stream with all underline children.
   */
  public Stream<Node> getDepthFirstStream() {
    return Stream.concat(Stream.of(this), children.stream().flatMap(Node::getDepthFirstStream));
  }

  /**
   * Get nearest parent with specified type.
   *
   * @param type required node type.
   * @return an optional with requested nearest node.
   */
  public Optional<Node> getNearestParentByType(NodeType type) {
    return Optional.ofNullable(parent)
        .flatMap(it -> (it.nodeType == type) ? Optional.of(it) : it.getNearestParentByType(type));
  }

  /**
   * Process tree node and its children after tree construction.
   *
   * @return the list of errors
   */
  public final List<SyntaxError> process() {
    Optional<Supplier<List<SyntaxError>>> processTmp = nextProcessingStep;
    nextProcessingStep = Optional.empty();
    List<SyntaxError> errors = new ArrayList<>();
    processTmp.map(Supplier::get).ifPresent(errors::addAll);
    children.stream().map(Node::process).forEach(errors::addAll);
    return errors;
  }


  /**
   * Return true if this node and all its children was fully processed and there is no need to do extra `process`
   * calls in order to finish node processing.
   *
   * @return true if no more `process` calls is needed
   */
  public final boolean isProcessed() {
    return !nextProcessingStep.isPresent() && children.stream().allMatch(Node::isProcessed);
  }

  /**
   * Add step for processing.
   * See {@see NodeProcessingTest} for examples
   *
   * @param processCall the method for processing
   */
  protected final void addProcessStep(Supplier<List<SyntaxError>> processCall) {
    if (nextProcessingStep.isPresent()) {
      Supplier<List<SyntaxError>> previousProcessIt = nextProcessingStep.get();
      nextProcessingStep = Optional.of(() -> {
        List<SyntaxError> errors = new ArrayList<>(previousProcessIt.get());
        errors.addAll(processCall.get());
        return errors;
      });
    } else {
      nextProcessingStep = Optional.of(processCall);
    }
  }
}
