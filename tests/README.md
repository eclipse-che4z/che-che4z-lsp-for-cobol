# Theia Automation

Automate functional tests running on Theia with Cypress.io in COBOL LS.

#### Prerequisite:

- Windows Environment
- Linux Environment

#### Procedure:

1. Install yarn
   You can test it, e.g. <code>yarn --version</code>

2. Install all dependencies

   <code> cd /your/project/path (where you cloned the repository)</code>

   <code> yarn install --frozen-lockfile</code>

- Add commands files from https://github.com/eclipse/che-che4z/tree/master/tests (check instructions in README). For some reason it is not working as expected [installation](https://github.com/eclipse/che-che4z/blob/ab4789702b0ca6ec7061c0eb5417c4c45bcdf32d/tests/package.json#L12), so we should do it manually:

  <code>.\node_modules\.bin\tsc --build  .\node_modules\@eclipse\che-che4z\tests\tsconfig.json</code>

- Refer to https://github.com/eclipse-theia/theia/blob/master/doc/Developing.md
- For Windows specific:
  https://github.com/eclipse-theia/theia/blob/master/doc/Developing.md#building-on-windows

3. Prepare the Theia environment for test suites

:information_source: **Note**:

- In order to run the LS COBOL LOCAL test suite, open a workspace in Theia, and put the test COBOL files in the root folder of that opened workspace.

- The test COBOL files can be found in the `test_files/project` subdirectory of a project. Theia version is `1.5.0.`

  #### Run Theia in docker:

  <code>sudo docker run -it --rm -p 3000:3000 -v /home/$USER/$project/plugins/:/home/theia/plugins -v /home/$USER/$project/test_files/project/:/home/project --name theia theiaide/theia-java:1.5.0</code>

  or

  #### Run builded Theia:

  ```
  cd theia/examples/browser
  yarn start IntegrationTests/test_files/project/ --hostname=0.0.0.0
  ```

4. Run Cypress

If you are running in interactive mode, and you want to run only one test, add `.only` to the specific test case, e.g.
` describe.only(...)` or ` it.only(...)`. For more information, check this link: https://docs.cypress.io/guides/core-concepts/writing-and-organizing-tests.html#Excluding-and-Including-Tests

| Command Description                                                                            | LSP                                                                                                                 |
| ---------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| Run in interactive mode                                                                        | `.\node_modules\.bin\cypress open `                                                                 |
| Run in CLI mode **ALL** spec files in specific folder with Chrome browser                      | `.\node_modules\.bin\cypress run --spec '.\cypress\integration\LSP\*' --browser chrome`            |
| Run in CLI mode **ALL** spec files in specific folder with Chrome browser in **headless** mode | `.\node_modules\.bin\cypress run --spec '.\cypress\integration\LSP\*' --browser chrome --headless` |
| Run in CLI mode **SPECIFIC** spec file in specific folder with Chrome browser                  | `.\node_modules\.bin\cypress run --spec '.\cypress\integration\LSP\lsp.spec.js' --browser chrome `  |

#### Test Retries

Check this page: https://docs.cypress.io/guides/guides/test-retries.html#Introduction. Cypress v5.x has test retries ability by default. Global configuration can be found in `cypress.json` file.

:information_source: **Note**: by default Cypress expects the Theia is running on `localhost:3000`. If your Theia server runs on different URL, you could provide it in command line:

| Command Description         | LSP                                                                                      |
| --------------------------- | ---------------------------------------------------------------------------------------- |
| baseURL in interactive mode | `.\node_modules\.bin\cypress open  --config baseUrl=http://<IP>:<port>/` |

5. Add new tests

Please check this page: https://docs.cypress.io/guides/references/best-practices.html

Check commands in `node_modules/@eclipse/che-che4z/tests/src/*.ts` (they could be helpful to create tests and functions should be available in autocomplete).

`cypress/support/index.js` is a place where you can put global configuration to run before each test.

And finally add the test directly to the `cypress/integration/LSP/{PUT_NAME_HERE}.spec.js`.

:information_source: **Note**:

Pre-commit is enabled. Also you can run `eslint` before commiting anything, then run manually this command:

`.\node_modules\.bin\eslint .`
