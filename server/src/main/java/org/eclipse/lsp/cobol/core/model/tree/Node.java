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

import com.google.common.collect.ImmutableList;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicLong;
import java.util.stream.Stream;

/** The class represents a Node in source structure tree. */
@ToString
@Getter
public abstract class Node {
  private static final AtomicLong ID_COUNTER = new AtomicLong();
  public final long id;
  private final Locality locality;
  private final List<Node> children = new ArrayList<>();
  private final NodeType nodeType;

  @ToString.Exclude
  @Setter(AccessLevel.PROTECTED)
  private Node parent;

  protected Node(Locality location, NodeType nodeType) {
    id = ID_COUNTER.incrementAndGet();
    this.locality = location;
    this.nodeType = nodeType;
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

  /** Updates parents on internal node state after tree construction. */
  public void process() {}

  /**
   * Return list of errors if any. Must be called after process.
   *
   * @return the list of errors
   */
  public List<SyntaxError> getErrors() {
    return ImmutableList.of();
  }
}
