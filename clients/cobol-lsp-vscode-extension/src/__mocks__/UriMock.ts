export class Uri {
  constructor(public path: string) {}
  static parse(str: string): Uri {
    const path = str.startsWith("file://") ? removeSchema(str) : str;
    return new Uri(path);
  }

  static file(str: string): Uri {
    const p = str.replace(/\\/g, "/");

    return new Uri((p[1] === ":" ? "/" : "") + p);
  }

  static joinPath(base: Uri, ...pathSegments: string[]): Uri {
    const segment = pathSegments.shift();
    if (segment === "../.bridge.json") {
      const uri = new Uri(
        base.path.substring(0, base.path.lastIndexOf("/")) + "/.bridge.json",
      );
      return pathSegments.length > 0
        ? this.joinPath(uri, ...pathSegments)
        : uri;
    }
    if (segment == "..") {
      const uri = new Uri(base.path.substring(0, base.path.lastIndexOf("/")));
      return pathSegments.length > 0
        ? this.joinPath(uri, ...pathSegments)
        : uri;
    }
    const uri = new Uri(base.path + "/" + segment);
    return pathSegments.length > 0 ? this.joinPath(uri, ...pathSegments) : uri;
  }

  get fsPath(): string {
    let value = this.path;
    if (this.path[2] === ":") {
      // substring to remove the first /
      value = value.substring(1).replace(/\//g, "\\");
    }
    return value;
  }

  toString(): string {
    return "file://" + this.path;
  }
}

function removeSchema(uri: string): string {
  return uri.substring("file://".length);
}
