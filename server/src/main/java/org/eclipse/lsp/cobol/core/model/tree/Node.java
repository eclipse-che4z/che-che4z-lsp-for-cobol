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
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp4j.Location;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

/**
 * The class represents a Node in source structure tree.
 */
public abstract class Node {
  private final Location location;
  private Node parent;
  private final List<Node> children = new ArrayList<>();
  private final NodeType nodeType;

  protected Node(Location location, NodeType nodeType) {
    this.location = location;
    this.nodeType = nodeType;
  }

  public Location getLocation() {
    return location;
  }

  public Node getParent() {
    return parent;
  }

  public List<Node> getChildren() {
    return children;
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

  public NodeType getNodeType() {
    return nodeType;
  }

  protected void setParent(Node parent) {
    this.parent = parent;
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
   * Get nearest parent with specified type starting with this.
   * Exception: theNode == theNode.getNearestParentByType(theNode.getNodeType()).get();
   *
   * @param type required node type.
   * @return an optional with requested nearest node.
   */
  public Optional<Node> getNearestParentByType(NodeType type) {
    if (nodeType == type) return Optional.of(this);
    return Optional.ofNullable(parent).flatMap(it -> it.getNearestParentByType(type));
  }

  /**
   * Updates parents on internal node state after tree construction.
   */
  public void process() {}

  /**
   * Return list of errors if any.
   * Must be called after process.
   *
   * @return the list of errors
   */
  public List<SyntaxError> getErrors() {
    return ImmutableList.of();
  }
}
