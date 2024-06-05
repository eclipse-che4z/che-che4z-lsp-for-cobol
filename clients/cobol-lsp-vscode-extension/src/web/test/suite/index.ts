// Imports mocha for the browser, defining the `mocha` global.
import { glob } from "glob";
import * as Mocha from "mocha";

export function run(): Promise<void> {

    return new Promise((c, e) => {
        mocha.setup({
            reporter: undefined,
            ui: "tdd",
        });

        // Bundles all files in the current directory matching `*.test`
        const importAll = (r: __WebpackModuleApi.RequireContext) => r.keys().forEach(r);
        importAll(require.context(".", true, /\.test$/));

        try {
            // Run the mocha test
            mocha.run((failures: number) => {
                if (failures > 0) {
                    e(new Error(`${failures} tests failed.`));
                } else {
                    c();
                }
            });
        } catch (err) {
            e(err);
        }
    });
}
