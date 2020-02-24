import { DownloadQueue } from "../DownloadQueue";

describe("Check download queue", () => {
    const element = "Test";
    const element_extra = "Test";
    it("Can add elements to queue", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        queue.push(element);
        const e = await queue.pop();
        expect(e).toEqual(element);
        expect(0).toEqual(queue.length);
    });
    it("Can wait", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        const result = queue.pop().then(e => {
            expect(e).toEqual(element);
        });
        queue.push(element);
        await result;
        expect(0).toEqual(queue.length);
    });
    it("Can have more then one element", async () => {
        const queue: DownloadQueue = new DownloadQueue();
        queue.push(element);
        queue.push(element_extra);
        expect(await queue.pop()).toEqual(element);
        expect(1).toEqual(queue.length);
        expect(await queue.pop()).toEqual(element_extra);
        expect(0).toEqual(queue.length);
    });
});
