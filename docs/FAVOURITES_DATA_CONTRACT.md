# Personal favourites: client contract and rollout

Batch 4 replaces shared catalog `isFavorite` writes with an injected repository for personal selections.

## Storage

- Path: `UsersDB/{authenticatedUid}/favourites/{encodedKey}`.
- Document body: `{ "key": "restaurant:<businessId>" }` or `{ "key": "foodItem:<businessId>" }`.
- `encodedKey` is Dart `base64Url.encode(utf8.encode(key))`, retaining any padding. This prevents slashes in a business key from becoming path separators.
- Saving upserts the document; removing deletes it. The client listens to this user's favourites collection, resets visible selections when the session changes, and rejects guest writes.
- Entries reference business IDs used by the catalog routes. Missing catalog entries do not render as stale cards; the stored reference is retained rather than deleting user data during browsing.

## Compatibility

Old `RestaurantsDB.isFavorite` and `FoodItemsDB.isFavorite` values are shared across users, so they cannot establish ownership. The new UI ignores these flags. No bulk migration, data deletion, or backend deployment occurred. Old app versions may continue modifying shared flags; those writes do not populate personal lists. Coordinate client rollout and explain the initially empty personal list to existing users.

## Required backend verification before release

This checkout has Firebase application configuration but no deployed Firestore rules source or emulator setup. Do not replace unknown production rules with a standalone fragment from this document.

Merge the new path into the authoritative backend rules with these requirements:

- A signed-in user may read, create, update and delete only under their own UID.
- Guests and other UIDs must be denied, including collection reads.
- Creates/updates accept only the `key` field as a bounded string with the `restaurant:` or `foodItem:` prefix. Set an agreed maximum matching the catalog's ID contract.
- Existing broader wildcard grants must be reviewed as part of verification.

Exercise owner save/read/delete, guest denial, cross-account denial, malformed records, reconnect, simultaneous devices and account switching with a pending write against the emulator and staging rules. Confirm that no catalog record is modified by saving a personal favourite.

Current automated coverage injects repository fakes. It verifies client isolation, duplicate-write suppression, failure preservation, retry and disposal; it does not establish Firestore authorization or live cross-device behaviour.
