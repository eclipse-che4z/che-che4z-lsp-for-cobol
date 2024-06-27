type Filename = string;
type Fingerprint = string;
type MemberName = string;
type Content = string;

export const enum ProcessorConfigurationType {
  COBOL = "COBOL",
}
interface EndevorElement {
  use_map: boolean;
  environment: string;
  stage: string;
  system: string;
  subsystem: string;
  type: string;
  element: string;
  fingerprint: string;
}
interface EndevorMember {
  dataset: string;
  member: string;
}
interface EndevorType {
  use_map: boolean;
  environment: string;
  stage: string;
  system: string;
  subsystem: string;
  type: string;
}

type TypeOrArray<T> = T | T[];
function asArray<T>(o: TypeOrArray<T>) {
  if (Array.isArray(o)) return o;
  return [o];
}

export type ResolvedProfile = {
  profile: string;
  instance: string;
};

export type ExternalConfigurationOptions = {
  compiler: string;
  preprocessor: string[];
  type: string;
};

export interface E4E {
  isEndevorElement: (uri: string) => boolean;
  getProfileInfo: (
    uriStringOrPartialProfile: Partial<ResolvedProfile> | string,
  ) => Promise<ResolvedProfile | Error>;
  listElements: (
    profile: ResolvedProfile,
    type: {
      use_map: boolean;
      environment: string;
      stage: string;
      system: string;
      subsystem: string;
      type: string;
    },
  ) => Promise<[Filename, Fingerprint][] | Error>;
  getElement: (
    profile: ResolvedProfile,
    type: {
      use_map: boolean;
      environment: string;
      stage: string;
      system: string;
      subsystem: string;
      type: string;
      element: string;
      fingerprint: string;
    },
  ) => Promise<[Content, Fingerprint] | Error>;
  listMembers: (
    profile: ResolvedProfile,
    type: {
      dataset: string;
    },
  ) => Promise<MemberName[] | Error>;
  getMember: (
    profile: ResolvedProfile,
    type: {
      dataset: string;
      member: string;
    },
  ) => Promise<Content | Error>;
  getConfiguration: (
    sourceUri: string,
    options: ExternalConfigurationOptions,
  ) => Promise<E4EExternalConfigurationResponse | Error>;
  onDidChangeElement: vscode.Event<ElementInfo[]>;
}

type E4EExternalConfigurationResponse = {
  pgms: ReadonlyArray<{
    program: string;
    pgroup: string;
    options?: {
      [key: string]: string;
    };
  }>;
  pgroups: ReadonlyArray<{
    name: string;
    libs: (
      | {
          dataset: string;
        }
      | {
          environment: string;
          stage: string;
          system: string;
          subsystem: string;
          type: string;
          use_map: boolean;
        }
    )[];
    options?: {
      [key: string]: string;
    };
    preprocessor?: TypeOrArray<{
      name: string;
      options?: {
        [key: string]: string;
      };
    }>;
  }>;
};

interface e4eResponse {
  profile: ResolvedProfile;
  uri: string;
  elements: { [key: string]: EndevorElement | EndevorMember };
}
