declare module "nyc" {
  namespace NYC {
    interface Config {
      tempDirectory?: string;
      cache?: boolean;
      cwd?: string;
      exclude?: string | string[];
      sourceMap?: boolean;
      hookRequire?: boolean;
      hookRunInContext?: boolean;
      hookRunInThisContext?: boolean;
      reporter?: string[];
    }

    interface NYC {
      wrap: () => void;
      createTempDirectory: () => Promise<void>;
      writeCoverageFile: () => Promise<void>;
      getCoverageMapFromAllCoverageFiles: (
        baseDirectory: string,
      ) => Promise<object>;
      report: () => Promise<void>;
    }
  }

  let NYC: {
    new (config: NYC.Config): NYC.NYC;
    name: string;
  };

  export = NYC;
}
