package com.ca.lsp.cobol.service.delegates;

import com.ca.lsp.cobol.service.MyDocumentModel;
import com.ca.lsp.cobol.service.delegates.references.References;
import java.util.List;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import org.eclipse.lsp4j.*;

/** @author ra890997 */
public class Highlights {

  public static List<DocumentHighlight> findHighlights(MyDocumentModel myDocumentModel, TextDocumentPositionParams position) {
    return
        References.findReferences(myDocumentModel,position,new ReferenceContext(true)).stream().filter(
            byUri(position)).map(
            toDocumentHighlight()).collect(
            Collectors.toList());

  }

  private static Predicate<Location> byUri(TextDocumentPositionParams position) {
    return it -> it.getUri().equals(position.getTextDocument().getUri());
  }

  private static Function<Location, DocumentHighlight> toDocumentHighlight() {
    return it -> new DocumentHighlight(it.getRange(), DocumentHighlightKind.Text);
  }
}
