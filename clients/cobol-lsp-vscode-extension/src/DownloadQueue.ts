export class DownloadQueue {
    private queue: string[] = [];
    private resolve;

    public push(element: string): void {
        if (this.resolve) {
            this.resolve(element);
        } else {
            this.queue.push(element);
        }
    }

    public async pop(): Promise<string | undefined> {
        if (this.queue.length > 0) {
            return Promise.resolve(this.queue.pop());
        }
        return new Promise((resolve, reject) => {
            this.resolve = resolve;
        });
    }

    get length(): number {
        return this.queue.length;
    }
}
