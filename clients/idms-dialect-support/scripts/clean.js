const { readdir, rm } = require("node:fs/promises");
const { join } = require("node:path");

async function cleanDirectory(directory, keep = new Set()) {
  let entries;

  try {
    entries = await readdir(directory);
  } catch (error) {
    if (error.code === "ENOENT") {
      return;
    }
    throw error;
  }

  await Promise.all(
    entries
      .filter((entry) => !keep.has(entry))
      .map((entry) =>
        rm(join(directory, entry), {
          recursive: true,
          force: true,
        }),
      ),
  );
}

async function main() {
  await cleanDirectory("src/generated");
  await cleanDirectory("out");
  await cleanDirectory("dist", new Set(["note.md"]));
}

main().catch((error) => {
  console.error("Failed to clean build directories:", error);
  process.exit(1);
});
