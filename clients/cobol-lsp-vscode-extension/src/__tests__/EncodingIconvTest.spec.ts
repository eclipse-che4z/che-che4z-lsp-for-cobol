import * as iconv from "iconv-lite";

describe('Test iconv lib correctly decodes a binary buffer', () => {

    it('checks iconv-lite decodes correctly for patched ebcdic encodings 1147 / 037/ 1047', () => {
        expect(iconv.decode(Buffer.from([0xF3, 0xF0, 0xF0, 0x9F, 0x40, 0x40]), "cp1147")).toBe("300€  ");
        expect(iconv.decode(Buffer.from([0xF3, 0xF0, 0xF0, 0xBA, 0xBB, 0xB0]), "cp037")).toBe("300[]^");
        expect(iconv.decode(Buffer.from([0xF3, 0xF0, 0xF0, 0xBA, 0xBB, 0xB0]), "cp1047")).toBe("300Ý¨¬");
    });

    it('check iconv-lite decodes correctly for out of box provided encodings (ISO-8859-5)', () => {
        const testData = Buffer.from('\xb0\xb1\xb2\xb3\xb4\xb5\xb6\xb7\xb8\xb9\xba\xbb\xbc\xbd\xbe\xbf\xc0\xc1\xc2\xc3\xc4\xc5\xc6\xc7\xc8\xc9\xca\xcb\xcc\xcd\xce\xcf\xd0\xd1\xd2\xd3\xd4\xd5\xd6\xd7\xd8\xd9\xda\xdb\xdc\xdd\xde\xdf\xe0\xe1\xe2\xe3\xe4\xe5\xe6\xe7\xe8\xe9\xea\xeb\xec\xed\xee\xef', 'binary');
        expect(iconv.decode(testData, "iso88595")).toBe("АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя")
    })
});
