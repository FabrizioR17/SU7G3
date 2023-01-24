/*
  Warnings:

  - You are about to drop the column `private` on the `songs` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_songs" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "artist" TEXT,
    "album" TEXT,
    "year" INTEGER NOT NULL,
    "genre" TEXT NOT NULL,
    "duration" INTEGER NOT NULL,
    "privacysong" BOOLEAN NOT NULL DEFAULT false,
    "playlistID" INTEGER
);
INSERT INTO "new_songs" ("album", "artist", "duration", "genre", "id", "name", "playlistID", "year") SELECT "album", "artist", "duration", "genre", "id", "name", "playlistID", "year" FROM "songs";
DROP TABLE "songs";
ALTER TABLE "new_songs" RENAME TO "songs";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
