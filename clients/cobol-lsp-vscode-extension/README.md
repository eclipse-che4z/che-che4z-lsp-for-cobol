# LSP Extension for Cobol Language
## Run extension client in socket mode
```
//connection with remote LS server
	let connectionInfo = {
		port: <SERVER_PORT>,
		host:<HOSTNAME>
	};
	let serverOptions = () => {
		// Connect to language server via socket
		let socket = net.connect(connectionInfo);
		let result: StreamInfo = {
			writer: socket,
			reader: socket
		};
		return Promise.resolve(result);
	};

	let languageClient = new LanguageClient('LSP','LSP extension for Cobol language', serverOptions, clientOptions);
	let disposable = languageClient.start();
```
## Run extension client in pipe mode

```
//spawn LSP process
var extPath = extensions.getExtension('BROADCOM.vscode-languageserver-extension').extensionPath;
let serverOptions: Executable = {
	command: 'java',
	args: [ "-jar",`${extPath}/lsp-service-cobol-1.0.1-jar-with-dependencies.jar`, "pipeEnabled"],
	options: {stdio:  'pipe', detached: true}
};

let languageClient = new LanguageClient('LSP','LSP extension for Cobol language', serverOptions, clientOptions);
let disposable = languageClient.start();
```