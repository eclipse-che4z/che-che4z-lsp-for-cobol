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
package org.eclipse.lsp.cobol.common.model.tree;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;

import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.function.Predicate;
import java.util.stream.Stream;

/** The class represents a Node in source structure tree. */
@ToString
@Getter
public abstract class Node {
  @Setter protected Locality locality;
  @Setter protected String text;
  private final NodeType nodeType;
  private final String dialect;

  private final List<Node> children = new CopyOnWriteArrayList<>();
  @ToString.Exclude @Setter private transient Node parent;

  protected Node(Locality location, NodeType nodeType, String dialect) {
    this.locality = location;
    this.nodeType = nodeType;
    this.dialect = dialect;
  }

  protected Node(Locality location, NodeType nodeType) {
    this.locality = location;
    this.nodeType = nodeType;
    this.dialect = null;
  }

  /**
   * Construct a predicate for testing that node has specified type.
   *
   * @param type the desired type
   * @return the predicate for testing node
   */
  public static Predicate<Node> hasType(NodeType type) {
    return node -> node.getNodeType() == type;
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
   * Add a child node to this node and updates the child parent link.
   *
   * @param index index of insertion
   * @param node a child node.
   */
  public void addChildAt(int index, Node node) {
    node.setParent(this);
    children.add(index, node);
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
   * Get a list with all nested children starting with this instance.
   *
   * @return a list with all underline children.
   */
  public List<Node> getDepthFirstList(Predicate<Node> nodePredicate) {
    ArrayList<Node> result = new ArrayList<>();
    if (nodePredicate.test(this)) {
      result.add(this);
    }
    LinkedList<Node> queue = new LinkedList<>(getChildren());
    while (!queue.isEmpty()) {
      Node node = queue.remove();
      if (nodePredicate.test(node)) {
        result.add(node);
      }
      for (Node child : node.getChildren()) {
        queue.addFirst(child);
      }
    }
    return result;
  }

  /**
   * Get the first node that meet predicate condition.
   *
   * @return a node if there is any or null.
   */
  public Node getDepthFirstFirstNode(Predicate<Node> nodePredicate) {
    if (nodePredicate.test(this)) {
      return this;
    }
    LinkedList<Node> queue = new LinkedList<>();
    for (Node child: getChildren()) {
      if (nodePredicate.test(child)) {
        return child;
      }
      queue.add(child);
    }

    while (!queue.isEmpty()) {
      Node node = queue.remove();
      for (Node child : node.getChildren()) {
        if (nodePredicate.test(child)) {
          return child;
        }
        queue.addFirst(child);
      }
    }
    return null;
  }

  /**
   * Get nearest parent with specified type.
   *
   * @param type required node type.
   * @return an optional with requested nearest node.
   */
  public Optional<Node> getNearestParentByType(NodeType type) {
    Node result = parent;
    while (result != null && !type.equals(result.getNodeType())) {
      result = result.getParent();
    }
    return Optional.ofNullable(result);
  }
  /**
   * Get nearest parent using predicate.
   *
   * @param predicate to find the right parent.
   * @return an optional with requested nearest node.
   */
  public Optional<Node> getNearestParent(Predicate<Node> predicate) {
    return Optional.ofNullable(parent)
            .flatMap(it -> predicate.test(it) ? Optional.of(it) : it.getNearestParent(predicate));
  }

  /**
   * Find a program node that contains current one.
   *
   * @return a program node if any
   */
  public Optional<ProgramNode> getProgram() {
    return getNearestParentByType(NodeType.PROGRAM).map(ProgramNode.class::cast);
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    Node node = (Node) o;
    return Objects.equals(locality, node.locality) && Objects.equals(text, node.text) && nodeType == node.nodeType && Objects.equals(dialect, node.dialect);
  }

  @Override
  public int hashCode() {
    int result = Objects.hashCode(locality);
    result = 31 * result + Objects.hashCode(text);
    result = 31 * result + Objects.hashCode(nodeType);
    result = 31 * result + Objects.hashCode(dialect);
    return result;
  }
}
