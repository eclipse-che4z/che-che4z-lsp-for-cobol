package org.broadcom.cobol.dialects.cobolExample;

import lombok.NonNull;
import org.eclipse.lsp.cobol.common.action.CodeActionProvider;
import org.eclipse.lsp4j.CodeAction;
import org.eclipse.lsp4j.CodeActionParams;
import org.eclipse.lsp4j.Command;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

import java.util.List;
import java.util.function.Function;

import static java.util.Arrays.asList;
import static java.util.Collections.singletonList;
import static java.util.stream.Collectors.toList;
import static org.broadcom.cobol.dialects.cobolExample.ExampleDialect.MISSING_INJECTS;
import static org.eclipse.lsp4j.CodeActionKind.QuickFix;

public class FindInjectsCommand implements CodeActionProvider {
    public static final String TITLE = "Resolve injects";
    /**
     * Create a list of commands or code actions according to the diagnostic's type. May be empty if
     * the given type in not supported.
     *
     * @param params - a request params
     * @return a list of commands or code actions
     */
    @Override
    public @NonNull List<Either<Command, CodeAction>> collectCommandsOrActions(@NonNull CodeActionParams params) {
        return params.getContext().getDiagnostics().stream()
                .filter(it -> it.getCode() != null)
                .filter(it -> MISSING_INJECTS.equalsIgnoreCase(it.getCode().getLeft()))
                .map(toCodeAction(params))
                .map(Either::<Command, CodeAction>forRight)
                .collect(toList());
    }

    @NonNull
    private Function<Diagnostic, CodeAction> toCodeAction(@NonNull CodeActionParams params) {
        return it -> {
            CodeAction action = new CodeAction(TITLE);
            action.setDiagnostics(singletonList(it));
            action.setKind(QuickFix);
            action.setCommand(createCommand(params, it));
            return action;
        };
    }

    @NonNull
    private Command createCommand(@NonNull CodeActionParams params, @NonNull Diagnostic it) {
        return new Command(
                TITLE,
                MISSING_INJECTS,
                asList(retrieveInjects(it), params.getTextDocument().getUri()));
    }

    @NonNull
    private String retrieveInjects(@NonNull Diagnostic it) {
        String message = it.getMessage();
        return message.substring(0, message.indexOf(':'));
    }
}
