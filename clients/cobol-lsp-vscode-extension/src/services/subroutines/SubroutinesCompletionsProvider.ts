import {
  CancellationToken,
  CompletionContext,
  CompletionItem,
  CompletionItemKind,
  CompletionItemProvider,
  Position,
  Progress,
  ProgressLocation,
  TextDocument,
  window,
} from "vscode";
import { SUBROUTINE_COMPLETIONS_SORT_PREFIX } from "../../constants";
import { listLocalSubroutines } from "./LocalSubroutinesService";

export class SubroutinesCompletionsProvider implements CompletionItemProvider {
  async provideCompletionItems(
    document: TextDocument,
    position: Position,
    _token: CancellationToken,
    _context: CompletionContext,
  ): Promise<CompletionItem[]> {
    const line = document
      .lineAt(position.line)
      .text.slice(0, position.character);

    const CALL_PATTERN = /^.*\bCALL\s+("|')?(\S+)?$/i;

    const match = line.match(CALL_PATTERN);
    if (!match) {
      return [];
    }

    let prefix = match[2];
    prefix = prefix?.toUpperCase();

    let subroutines: string[] = [];
    let subroutinesLoadingFinished = false;
    const subroutinesLoadingPromise = (async () => {
      subroutines = await listLocalSubroutines();
      subroutinesLoadingFinished = true;
    })();
    await Promise.race([
      subroutinesLoadingPromise,
      new Promise((resolve) => {
        setTimeout(resolve, 200);
      }),
    ]);

    // If we are unable to provide completions immediately, show info dialog
    if (!subroutinesLoadingFinished) {
      await window.withProgress(
        {
          location: ProgressLocation.Notification,
          title: "Loading subroutines completions",
        },
        async (
          _progress: Progress<{ message?: string; increment?: number }>,
        ) => {
          await subroutinesLoadingPromise;
        },
      );
    }

    if (prefix) {
      subroutines = subroutines.filter((subroutine) =>
        subroutine.startsWith(prefix),
      );
    }

    // Subroutine name has to be wrapped in " or '. Add it to the completions
    // if it's not already part of the call statement.
    let wrapperChar = "'";
    if (match[1] === `"` || match[1] === `'`) {
      wrapperChar = "";
    }

    const completions = subroutines.map((subroutine) => {
      const ci = new CompletionItem(subroutine, CompletionItemKind.Function);
      ci.sortText = `${SUBROUTINE_COMPLETIONS_SORT_PREFIX}${subroutine}`;
      ci.insertText = `${wrapperChar}${subroutine}${wrapperChar}`;
      return ci;
    });

    return completions;
  }
}
