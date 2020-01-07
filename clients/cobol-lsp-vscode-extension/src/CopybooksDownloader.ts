export class CopybooksDownloader {
    public async downloadCopyBooks(copybooks: string[]) {
        const cb: Set<string> = new Set(copybooks);
        const profile = await this.askProfile();
        for (const ds of this.listDatasets()) {
            const members: string[] = this.listMembers(ds, profile);
            for (const member of members) {
                if (cb.has(member)) {
                    await this.downloadCopybook(ds, member, profile);
                    cb.delete(member);
                    if (cb.size === 0) {
                        return;
                    }
                }
            }
        }
    }

    private async downloadCopybook(dataset: string, copybook: string, profile: string) {
        // TODO
    }

    private listMembers(dataset: string, profile: string): string[] {
        return [];
    }
    private listDatasets(): string[] {
        // TODO
        return [];
    }

    private async askProfile(): Promise<string> {
        // list all
        // Prefill default
        // wait for selection
        return "";
    }
}
